package com.example.zengye_springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.zengye_springboot.entity.Avatar;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AvatarMapper {
    @Insert("insert into zengye.avatar(type, size, url, md5) values(#{type},#{size},#{url},#{md5})")
    public void save(Avatar avatar);

    @Select("select * from zengye.avatar where md5 = #{md5}")
    public Avatar selectByMd5(String md5);

    @Select("select * from zengye.avatar where id = #{id}")
    public Avatar selectById(int id);

    @Delete("delete from avatar where id = #{id}")
    int delete(int id);
    @Select("select * from avatar limit #{index},#{pageSize}")
    List<Avatar> selectPage(int index,int pageSize);
    @Select("select count(*) from avatar")
    int getTotal();
}
