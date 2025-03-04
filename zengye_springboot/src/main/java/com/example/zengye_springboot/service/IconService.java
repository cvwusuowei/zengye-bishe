package com.example.zengye_springboot.service;

import com.example.zengye_springboot.entity.Icon;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.zengye_springboot.mapper.IconMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class IconService extends ServiceImpl<IconMapper, Icon> {

    @Resource
    private IconMapper iconMapper;

    public List<Icon> getIconCategoryMapList() {
        return iconMapper.getIconCategoryMapList();
    }
}
