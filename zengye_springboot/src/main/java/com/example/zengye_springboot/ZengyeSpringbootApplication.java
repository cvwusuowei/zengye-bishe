package com.example.zengye_springboot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.example.zengye_springboot.mapper")
@SpringBootApplication
public class ZengyeSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZengyeSpringbootApplication.class, args);
    }

}
