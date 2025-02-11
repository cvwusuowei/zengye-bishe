package com.example.zengye_springboot.controller;

import com.auth0.jwt.JWT;
import com.example.zengye_springboot.annotation.Authority;
import com.example.zengye_springboot.common.Result;
import com.example.zengye_springboot.entity.AuthorityType;
import com.example.zengye_springboot.service.UserService;
import com.example.zengye_springboot.entity.Carousel;
import com.example.zengye_springboot.service.CarouselService;
import com.example.zengye_springboot.entity.User;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/api/carousel")
public class CarouselController {
    @Resource
    private CarouselService carouselService;
    @Resource
    private HttpServletRequest request;
    @Resource
    private UserService userService;

    public User getUser() {
        String token = request.getHeader("token");
        String username = JWT.decode(token).getAudience().get(0);
        return userService.getOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, username));
    }

    /*
    查询
    */
    @GetMapping("/{id}")
    public Result findById(@PathVariable Long id) {
        return Result.success(carouselService.getById(id));
    }

    @GetMapping
    public Result findAll() {
        List<Carousel> list = carouselService.getAllCarousel();
        return Result.success(list);
    }

    /*
    保存
    */
    @Authority(AuthorityType.requireAuthority)
    @PostMapping
    public Result save(@RequestBody Carousel carousel) {
        carouselService.saveOrUpdate(carousel);
        return Result.success();
    }
    @Authority(AuthorityType.requireAuthority)
    @PutMapping
    public Result update(@RequestBody Carousel carousel) {
        carouselService.updateById(carousel);
        return Result.success();
    }

    /*
    删除
    */
    @Authority(AuthorityType.requireAuthority)
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        carouselService.removeById(id);
        return Result.success();
    }





}
