package com.tmpCenConWH.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionMapper positionDao;

	@Override
	public List<Position> getList() {
		// TODO Auto-generated method stub
		return positionDao.getList();
	}
}
