package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catchfood.dto.MenuDto;
@Mapper
public interface MenuDao {
    List<MenuDto> getMenusByCategory(int categoryNum); 
}