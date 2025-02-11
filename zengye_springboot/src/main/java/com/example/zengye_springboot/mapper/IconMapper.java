package com.example.zengye_springboot.mapper;

import com.example.zengye_springboot.entity.Icon;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface IconMapper extends BaseMapper<Icon> {

    List<Icon> getIconCategoryMapList();
}
