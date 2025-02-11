package com.example.zengye_springboot.annotation;

import com.example.zengye_springboot.entity.AuthorityType;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE,ElementType.METHOD})
@Documented
public @interface Authority {
    AuthorityType value() default AuthorityType.requireLogin;
}
