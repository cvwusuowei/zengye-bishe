package com.example.zengye_springboot.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.zengye_springboot.constants.Constants;
import com.example.zengye_springboot.entity.Cart;
import com.example.zengye_springboot.entity.Order;
import com.example.zengye_springboot.entity.OrderGoods;
import com.example.zengye_springboot.entity.OrderItem;
import com.example.zengye_springboot.exception.ServiceException;
import com.example.zengye_springboot.mapper.*;
import com.example.zengye_springboot.utils.TokenUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OrderService extends ServiceImpl<OrderMapper, Order> {

    @Resource
    private OrderMapper orderMapper;
    @Resource
    private OrderGoodsMapper orderGoodsMapper;
    @Resource
    private StandardMapper standardMapper;
    @Resource
    private CartService  cartService;
    @Resource
    private GoodMapper goodMapper;
    @Resource
    private CartMapper cartMapper;
    @Transactional
    public String saveOrder(Order order) {
        order.setUserId(TokenUtils.getCurrentUser().getId());
        String orderNo = DateUtil.format(new Date(), "yyyyMMddHHmmss") + RandomUtil.randomNumbers(6);
        order.setOrderNo(orderNo);
        order.setCreateTime(DateUtil.now());
        orderMapper.insert(order);

        OrderGoods orderGoods = new OrderGoods();
        orderGoods.setOrderId(order.getId());
        //遍历order里携带的goods数组，并用orderItem对象来接收
        String goods = order.getGoods();
        List<OrderItem> orderItems = JSON.parseArray(goods, OrderItem.class);
        for (OrderItem orderItem : orderItems) {
            long good_id = orderItem.getId();
            String standard = orderItem.getStandard();
            int num = orderItem.getNum();
            orderGoods.setGoodId(good_id);
            orderGoods.setCount(num);
            orderGoods.setStandard(standard);
            //插入到order_good表
            orderGoodsMapper.insert(orderGoods);
        }
        System.err.println(goods);
        return orderNo;
    }
    //给订单付款
    @Transactional
    public void payOrder(String orderNo) {
        //更改状态为代付款
        orderMapper.payOrder(orderNo);
        //给对应规格减库存
        Map<String, Object> orderMap = orderMapper.selectByOrderNo(orderNo);
        int count = (int) orderMap.get("count");
        Long goodId = (Long) orderMap.get("goodId");
        String standard = (String) orderMap.get("standard");
        int store = standardMapper.getStore(goodId,standard);
        if(store<count){
            throw new ServiceException(Constants.CODE_500,"库存不足");
        }
        standardMapper.deductStore(goodId, standard,store - count);
        //给对应商品加销量和销售额
        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<>();
        orderLambdaQueryWrapper.eq(Order::getOrderNo,orderNo);
        Order one = getOne(orderLambdaQueryWrapper);
        BigDecimal totalPrice = one.getTotalPrice();
        goodMapper.saleGood(goodId,count,totalPrice);
        // **删除购物车中已支付的商品**
        //查询OrderGoods中的goodid
        LambdaQueryWrapper<OrderGoods> orderGoodsLambdaQueryWrapper  = new LambdaQueryWrapper<>();
        orderGoodsLambdaQueryWrapper.eq(OrderGoods::getOrderId,one.getId());
        OrderGoods orderGoods = orderGoodsMapper.selectOne(orderGoodsLambdaQueryWrapper);

        //根据goodid和userid删除购物车信息
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<>();
        cartLambdaQueryWrapper.eq(Cart::getGoodId,orderGoods.getGoodId())
                        .eq(Cart::getUserId,one.getUserId());
        cartMapper.delete(cartLambdaQueryWrapper);
    }

    public List<Map<String,Object>> selectByUserId(int userId) {
        return orderMapper.selectByUserId(userId);
    }

    public boolean receiveOrder(String orderNo) {
        return orderMapper.receiveOrder(orderNo);
    }

    public Map<String,Object> selectByOrderNo(String orderNo) {
        return orderMapper.selectByOrderNo(orderNo);
    }

    public void delivery(String orderNo) {
        LambdaUpdateWrapper<Order> orderLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        orderLambdaUpdateWrapper.eq(Order::getOrderNo,orderNo)
                .set(Order::getState,"已发货");
        update(orderLambdaUpdateWrapper);
    }
}
