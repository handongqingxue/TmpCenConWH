package com.tmpCenConWH.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.service.*;
import com.tmpCenConWH.util.LogUtil;

//eclipse搭建maven项目:https://blog.csdn.net/weixin_62332711/article/details/125630418
@Controller
@RequestMapping(MainController.MODULE_NAME)
public class MainController {

	@Autowired
	private BoxService boxService;
	@Autowired
	private CameraService cameraService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private ForkliftTrackService forkliftTrackService;
	private JSONArray ftTestJA;
	public static final String MODULE_NAME="/main";

	/**
	 * 跳转到地图模型测试页
	 * @return
	 */
	@RequestMapping(value="/goTestMap")
	public String goTestMap() {
		
		//http://localhost:8080/TmpCenConWH/main/goTestMap
		
		return "testMap";
	}

	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/goHome")
	public String goHome() {
		
		//http://localhost:8080/TmpCenConWH/main/goHome
		
		return "home";
	}
	
	@RequestMapping(value="/getBoxList")
	@ResponseBody
	public Map<String, Object> getBoxList() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<Box> boxList=boxService.getList();

		if(boxList.size()==0) {
			jsonMap.put("status", "no");
			jsonMap.put("info", "暂无信息");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("boxList", boxList);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/getCameraList")
	@ResponseBody
	public Map<String, Object> getCameraList() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<Camera> cameraList=cameraService.getList();

		if(cameraList.size()==0) {
			jsonMap.put("status", "no");
			jsonMap.put("info", "暂无信息");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("cameraList", cameraList);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/getPositionList")
	@ResponseBody
	public Map<String, Object> getPositionList() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<Position> positionList=positionService.getList();

		if(positionList.size()==0) {
			jsonMap.put("status", "no");
			jsonMap.put("info", "暂无信息");
		}
		else {
			jsonMap.put("status", "ok");
			jsonMap.put("positionList", positionList);
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/createForkHisTraFile")
	@ResponseBody
	public Map<String, Object> createForkHisTraFile() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();

		List<ForkliftTrack> ftList=forkliftTrackService.getYestList();
		if(ftList.size()>0) {
			Date nowDate = new Date();
			Calendar calendar=Calendar.getInstance();
			calendar.setTime(nowDate);
			calendar.add(Calendar.DATE, -1);
			Date yestDate = calendar.getTime();
			String yestDateFolderPath = "D:/resource/TmpCenConWH/ForkliftHisTrack/"+new SimpleDateFormat("YYYYMMdd").format(yestDate);
			System.out.println(yestDateFolderPath);
			File yestDateFolderFile = new File(yestDateFolderPath);
			System.out.println(yestDateFolderFile.exists());
			if(!yestDateFolderFile.exists()) {
				yestDateFolderFile.mkdir();
			}
			
			Map<String,List<ForkliftTrack>> ftMap=new HashMap<String,List<ForkliftTrack>>();
			for (int i = 0; i < ftList.size(); i++) {
				ForkliftTrack ft = ftList.get(i);
				String tagId = ft.getTagId();
				Set<String> ftMapKeySet = ftMap.keySet();
				Iterator<String> ftMapKeys = ftMapKeySet.iterator();
			}
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/getForkliftHisTrack")
	@ResponseBody
	public Map<String, Object> getForkliftHisTrack() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		String str = LogUtil.getHisTra();
		if(StringUtils.isEmpty(str)) {
			
		}
		else {
			JSONArray ja = JSONArray.parseArray(str);
			System.out.println("jasize==="+ja.size());
			/*
			for (int i = 0; i < ja.size(); i++) {
				System.out.println("getJSONObject==="+"i="+i+","+ja.getJSONObject(i).toString());
			}
			*/
			
			jsonMap.put("status", "ok");
			jsonMap.put("positionJA", ja);
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/addForkliftHisTrack")
	@ResponseBody
	public Map<String, Object> addForkliftHisTrack() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			if(ftTestJA==null) {
				String str = "[{\"tagId\":\"001\",\"longitude\":119.55172146974813,\"latitude\":37.04508329949785},{\"tagId\":\"002\",\"longitude\":119.55172146974813,\"latitude\":37.04508329949785},{\"tagId\":\"003\",\"longitude\":119.55172146974813,\"latitude\":37.04508329949785}]";
				System.out.println("str1==="+str);
				ftTestJA = JSONArray.parseArray(str);
			}
			for(int i=0;i<ftTestJA.size();i++) {
				JSONObject jo = ftTestJA.getJSONObject(i);
				//
				//System.out.println("jo==="+jo.toString());
				double longitude=jo.getDouble("longitude");
				longitude+=0.002;
				if(longitude>119.9) {
					longitude=119.55146106516342;
					double latitude=jo.getDouble("latitude");
					latitude+=0.01;
					jo.put("latitude", latitude);
				}
				jo.put("longitude", longitude);
			}
			
			forkliftTrackService.addFromJA(ftTestJA);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//LogUtil.createHisTra("");
		}
		finally {
			return jsonMap;
		}
	}

	@RequestMapping(value="/addForkliftHisTrackTest")
	@ResponseBody
	public Map<String, Object> addForkliftHisTrackTest() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			String str = LogUtil.getHisTra();
			System.out.println("str1==="+str);
	        if(!str.startsWith("[")) {
	        	str=str.substring(1);
	            StringBuffer currMsgSB=new StringBuffer();
	            currMsgSB.append("[");
	            currMsgSB.append(str);
	            str =currMsgSB.toString();
	    		System.out.println("str2==="+str);
	    		LogUtil.createHisTra(str);
	        }
			JSONArray ja = JSONArray.parseArray(str);
			JSONObject lastJO = ja.getJSONObject(ja.size()-1);
			//[{"longitude":119.55172146974813,"latitude":37.04508329949785}]
			//System.out.println("lastHisTrack==="+lastJO.toString());
			double longitude=lastJO.getDouble("longitude");
			longitude+=0.002;
			if(longitude>119.9) {
				longitude=119.55146106516342;
				double latitude=lastJO.getDouble("latitude");
				latitude+=0.01;
				lastJO.put("latitude", latitude);
			}
			lastJO.put("longitude", longitude);
			LogUtil.addHisTra(lastJO.toString());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//LogUtil.createHisTra("");
		}
		finally {
			return jsonMap;
		}
	}
}
