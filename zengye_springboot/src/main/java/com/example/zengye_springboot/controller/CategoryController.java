package com.example.zengye_springboot.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.zengye_springboot.annotation.Authority;
import com.example.zengye_springboot.common.Result;
import com.example.zengye_springboot.entity.AuthorityType;
import com.example.zengye_springboot.entity.Category;
import com.example.zengye_springboot.entity.Icon;
import com.example.zengye_springboot.entity.IconCategory;
import com.example.zengye_springboot.mapper.IconCategoryMapper;
import com.example.zengye_springboot.service.CategoryService;
import com.example.zengye_springboot.service.IconService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/category")
public class CategoryController {
    @Resource
    private CategoryService categoryService;
    @Resource
    private IconCategoryMapper iconCategoryMapper;
    /*
    查询
    */
    @GetMapping("/{id}")
    public Result findById(@PathVariable Long id) {
        return Result.success(categoryService.getById(id));
    }

    @GetMapping
    public Result findAll() {
        List<Category> list = categoryService.list();
        return Result.success(list);
    }

    /*
    保存
    */

    @PostMapping("/addCategory")
    public Result save(@RequestBody Category category) {
        categoryService.saveCategory(category);
        return Result.success();
    }
    @Authority(AuthorityType.requireAuthority)
    @PutMapping
    public Result update(@RequestBody Category category) {
        categoryService.updateById(category);

        return Result.success();
    }

    /*
    删除
    */
    @Authority(AuthorityType.requireAuthority)
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        categoryService.removeById(id);
        QueryWrapper<IconCategory> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("category_id", id);
        iconCategoryMapper.delete(queryWrapper);
        return Result.success();
    }





}
