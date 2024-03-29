package com.tmpCenConWH.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface RoleMapper {

	List<Role> queryList(@Param("name") String name);
}
