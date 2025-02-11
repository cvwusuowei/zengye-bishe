package com.example.zengye_springboot.service;

import com.example.zengye_springboot.entity.Category;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.zengye_springboot.mapper.CategoryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CategoryService extends ServiceImpl<CategoryMapper, Category> {

    @Resource
    private CategoryMapper categoryMapper;

}
