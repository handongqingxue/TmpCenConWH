package com.tmpCenConWH.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class ForkliftTrackFileServiceImpl implements ForkliftTrackFileService {

	@Autowired
	private ForkliftTrackFileMapper forkliftTrackFileDao;
	
	@Override
	public int addFromList(List<ForkliftTrackFile> ftfList) {
		// TODO Auto-generated method stub
		return forkliftTrackFileDao.addFromList(ftfList);
	}

	@Override
	public List<ForkliftTrackFile> getList(String tagId, Integer day) {
		// TODO Auto-generated method stub
		return forkliftTrackFileDao.getList(tagId,day);
	}

}
