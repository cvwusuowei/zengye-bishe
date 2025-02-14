package com.example.zengye_springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value="icon_category")
public class IconCategory {

    private Long iconId;

    private Long categoryId;
}
