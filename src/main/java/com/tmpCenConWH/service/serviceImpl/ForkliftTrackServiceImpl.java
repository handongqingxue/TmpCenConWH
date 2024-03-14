package com.tmpCenConWH.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.*;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class ForkliftTrackServiceImpl implements ForkliftTrackService {

	@Autowired
	private ForkliftTrackMapper forkliftTrackDao;

	@Override
	public int addFromJA(JSONArray ja) {
		// TODO Auto-generated method stub
		List<ForkliftTrack> ftList=new ArrayList<ForkliftTrack>();
		ForkliftTrack ft=null;
		for (int i = 0; i < ja.size(); i++) {
			JSONObject jo = ja.getJSONObject(i);
			String tagId = jo.getString("tagId");
			double longitude = jo.getDouble("longitude");
			double latitude = jo.getDouble("latitude");
			
			ft=new ForkliftTrack();
			ft.setTagId(tagId);
			ft.setLongitude(longitude);
			ft.setLatitude(latitude);
			
			ftList.add(ft);
		}
		return forkliftTrackDao.addFromList(ftList);
	}

	@Override
	public List<ForkliftTrack> getYestList() {
		// TODO Auto-generated method stub
		return forkliftTrackDao.getYestList();
	}
}
