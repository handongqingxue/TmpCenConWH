package com.tmpCenConWH.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionDao;

	@Override
	public int add(Permission permission) {
		// TODO Auto-generated method stub
		return permissionDao.add(permission);
	}

	@Override
	public int edit(Permission permission) {
		// TODO Auto-generated method stub
		return permissionDao.edit(permission);
	}
	
	@Override
	public List<Permission> queryList(String name) {
		// TODO Auto-generated method stub
		return permissionDao.queryList(name);
	}

}
