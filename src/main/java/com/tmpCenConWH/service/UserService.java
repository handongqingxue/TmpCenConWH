package com.tmpCenConWH.service;

import com.tmpCenConWH.entity.*;

public interface UserService {

	int add(User user);

	boolean checkUsernameIfExist(String username);
}
