package com.example.zengye_springboot.controller;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.zengye_springboot.annotation.Authority;
import com.example.zengye_springboot.common.Result;
import com.example.zengye_springboot.entity.AuthorityType;
import com.example.zengye_springboot.entity.Cart;
import com.example.zengye_springboot.service.CartService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Authority(AuthorityType.requireLogin)
@RestController
@RequestMapping("/api/cart")
public class CartController {
    @Resource
    private CartService cartService;

    /*
    查询
    */
    //根据购物车id查询
    @GetMapping("/{id}")
    public Result selectById(@PathVariable Long id) {
        return Result.success(cartService.getById(id));
    }
    //查找所有用户的购物车
    @GetMapping
    public Result findAll() {
        List<Cart> list = cartService.list();
        return Result.success(list);
    }
    //查找某个用户的购物车
    @GetMapping("/userid/{userId}")
    public Result selectByUserId(@PathVariable Long userId) {
        return Result.success(cartService.selectByUserId(userId)) ;
//        LambdaQueryWrapper<Cart> cartQueryWrapper = new LambdaQueryWrapper<>();
//        cartQueryWrapper.eq(Cart::getUserId,userId);
//        List<Cart> list = cartService.list(cartQueryWrapper);
//        return Result.success(list);
    }

    /*
    保存
    */
    @PostMapping
    public Result save(@RequestBody Cart cart) {
        cart.setCreateTime(DateUtil.now());

        // 检查是否已经有该商品与用户的组合
        QueryWrapper<Cart> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("good_id", cart.getGoodId());
        queryWrapper.eq("user_id", cart.getUserId());

        Cart existingCart = cartService.getOne(queryWrapper);  // 查询已存在的记录

        if (existingCart != null) {
            // 如果记录已存在，则更新数量
            existingCart.setCount(existingCart.getCount() + cart.getCount());
            cartService.updateById(existingCart);
        } else {
            // 如果记录不存在，则插入新记录
            cartService.save(cart);
        }

        return Result.success();
    }

    @PutMapping
    public Result update(@RequestBody Cart cart) {
        cartService.updateById(cart);
        return Result.success();
    }

    /*
    删除
    */
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        cartService.removeById(id);
        return Result.success();
    }





}
