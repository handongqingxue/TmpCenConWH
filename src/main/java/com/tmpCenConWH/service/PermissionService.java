package com.tmpCenConWH.service;

import java.util.List;

import com.tmpCenConWH.entity.*;

public interface PermissionService {

	int add(Permission permission);
	
	List<Permission> queryList(String name);
}
