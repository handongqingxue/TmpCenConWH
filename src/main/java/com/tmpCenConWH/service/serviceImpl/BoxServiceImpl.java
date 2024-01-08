package com.tmpCenConWH.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.Box;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.BoxService;

@Service
public class BoxServiceImpl implements BoxService {

	@Autowired
	private BoxMapper boxDao;
	
	@Override
	public List<Box> getList() {
		// TODO Auto-generated method stub
		return boxDao.getList();
	}

}
