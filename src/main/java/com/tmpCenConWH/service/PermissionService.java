package com.tmpCenConWH.service;

import java.util.List;

import com.tmpCenConWH.entity.*;

public interface PermissionService {

	List<Permission> queryList(String name);
}
