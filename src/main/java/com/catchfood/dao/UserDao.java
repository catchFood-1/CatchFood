package com.catchfood.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.UserDto;

@Mapper
public interface UserDao {
	public UserDto findByUserId(String userId); 
	
	// 회원가입
	public int registerProcess(UserDto user); 
	
    //login
    UserDto login(@Param("userId") String userId, @Param("userPasswd") String userPasswd);
}
