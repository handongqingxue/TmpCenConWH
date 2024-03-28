package com.tmpCenConWH.service;

import java.util.List;

import com.tmpCenConWH.entity.*;

public interface UserService {

	int add(User user);

	boolean checkUsernameIfExist(String username);

	List<User> queryList(String username, String startTime, String endTime, Integer state);
}
