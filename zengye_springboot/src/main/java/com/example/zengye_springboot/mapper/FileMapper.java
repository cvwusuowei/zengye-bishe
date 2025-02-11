package com.example.zengye_springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.zengye_springboot.entity.MyFile;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper extends BaseMapper<MyFile> {
}
