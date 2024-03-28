package com.tmpCenConWH.dao;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface UserMapper {

	//通过用户信息查询用户
	User get(@Param("username") String username, @Param("password") String password);

	int add(User user);

	int getCountByUsername(@Param("username") String username);
}
