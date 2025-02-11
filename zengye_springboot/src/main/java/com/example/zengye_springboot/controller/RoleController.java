package com.example.zengye_springboot.controller;

import com.example.zengye_springboot.common.Result;
import com.example.zengye_springboot.entity.User;
import com.example.zengye_springboot.utils.TokenUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RoleController {
    @PostMapping("/role")
    public Result getUserRole(){
        User currentUser = TokenUtils.getCurrentUser();
        return Result.success(currentUser.getRole());
    }
}
