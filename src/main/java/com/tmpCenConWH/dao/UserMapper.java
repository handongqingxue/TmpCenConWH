package com.tmpCenConWH.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface UserMapper {

	//通过用户信息查询用户
	User get(@Param("username") String username, @Param("password") String password);

	int add(User user);

	int getCountByUsername(@Param("username") String username);

	List<User> queryList(@Param("username") String username, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("state") Integer state);
}
