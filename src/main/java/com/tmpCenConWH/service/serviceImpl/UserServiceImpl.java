package com.tmpCenConWH.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userDao;
	
	@Override
	public int add(User user) {
		// TODO Auto-generated method stub
		return userDao.add(user);
	}

	@Override
	public boolean checkUsernameIfExist(String username) {
		// TODO Auto-generated method stub
		int count=userDao.getCountByUsername(username);
		return count==0?false:true;
	}

}
