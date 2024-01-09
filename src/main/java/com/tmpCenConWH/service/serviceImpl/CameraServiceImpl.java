package com.tmpCenConWH.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class CameraServiceImpl implements CameraService {

	@Autowired
	private CameraMapper cameraDao;

	@Override
	public List<Camera> getList() {
		// TODO Auto-generated method stub
		return cameraDao.getList();
	}
}
