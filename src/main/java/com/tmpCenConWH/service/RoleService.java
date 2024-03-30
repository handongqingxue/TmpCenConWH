package com.tmpCenConWH.service;

import java.util.List;

import com.tmpCenConWH.entity.*;

public interface RoleService {

	int add(Role role);

	int edit(Role role);

	List<Role> queryList(String name);
}
