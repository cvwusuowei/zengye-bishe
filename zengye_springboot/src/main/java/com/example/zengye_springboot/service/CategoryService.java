package com.example.zengye_springboot.service;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.zengye_springboot.entity.Category;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.zengye_springboot.entity.IconCategory;
import com.example.zengye_springboot.mapper.CategoryMapper;
import com.example.zengye_springboot.mapper.IconCategoryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CategoryService extends ServiceImpl<CategoryMapper, Category> {

    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private IconCategoryMapper iconCategoryMapper;

    public void saveCategory(Category category) {
        Category categoryUse = new Category();
        categoryUse.setName(category.getName());
        this.save(categoryUse);
        IconCategory iconCategory = new IconCategory();
        iconCategory.setIconId(category.getId());
        iconCategory.setCategoryId(categoryUse.getId());
        iconCategoryMapper.insert(iconCategory);

    }
}
