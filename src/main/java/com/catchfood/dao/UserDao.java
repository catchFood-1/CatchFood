package com.catchfood.dao;

import org.apache.ibatis.annotations.Mapper;

import com.catchfood.dto.UserDto;

@Mapper
public interface UserDao {
	UserDto findByUserId(String userId);
}
