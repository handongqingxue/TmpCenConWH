package com.tmpCenConWH.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface PermissionMapper {

	List<Permission> queryList(@Param("name") String name);
}
