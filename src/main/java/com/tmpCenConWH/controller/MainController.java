package com.tmpCenConWH.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	@Autowired
	private ForkliftTrackFileService forkliftTrackFileService;
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

		try {
			List<ForkliftTrack> ftList=forkliftTrackService.getYestList();
			if(ftList.size()>0) {
				Date nowDate = new Date();
				Calendar calendar=Calendar.getInstance();
				calendar.setTime(nowDate);
				calendar.add(Calendar.DATE, -3);
				Date yestDate = calendar.getTime();
				String yestDateFmt = new SimpleDateFormat("YYYYMMdd").format(yestDate);
				String yestDateFolderPath = "D:/resource/TmpCenConWH/ForkliftHisTrack/"+yestDateFmt;
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
					boolean exist=false;
					for (String ftMapKey : ftMapKeySet) {
						//System.out.println("ftMapKey==="+ftMapKey);
						if(ftMapKey.equals(tagId)) {
							exist=true;
							break;
						}
					}
					if(exist) {
						List<ForkliftTrack> ftMapList=(List<ForkliftTrack>)ftMap.get(tagId);
						ftMapList.add(ft);
					}
					else {
						List<ForkliftTrack> ftMapList=new ArrayList<ForkliftTrack>();
						ftMapList.add(ft);
						ftMap.put(tagId, ftMapList);
					}
				}
				
				List<ForkliftTrackFile> ftfList=new ArrayList<ForkliftTrackFile>();
				ForkliftTrackFile ftf=null;
				Set<String> ftMapKeySet = ftMap.keySet();
				for (String ftMapKey : ftMapKeySet) {
					String yestDateFileName = yestDateFolderPath+"/"+ftMapKey+".txt";
					File yestDateFile = new File(yestDateFileName);
					if(!yestDateFile.exists()) {
						yestDateFile.createNewFile();
					}
					List<ForkliftTrack> ftMapList=(List<ForkliftTrack>)ftMap.get(ftMapKey);
					String ftJAStr = JSONArray.toJSONString(ftMapList);
					System.out.println("ftJAStr==="+ftJAStr);
					LogUtil.createHisTra(yestDateFileName,ftJAStr);
					
					ftf=new ForkliftTrackFile();
					ftf.setPath(yestDateFileName);
					ftf.setTagId(ftMapKey);
					ftf.setDate(yestDateFmt);
					
					ftfList.add(ftf);
				}
				
				forkliftTrackFileService.addFromList(ftfList);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/getForkliftHisTrack")
	@ResponseBody
	public Map<String, Object> getForkliftHisTrack(String tagId, String startDate, String endDate) {
		
		System.out.println("tagId==="+tagId);
		System.out.println("startDate==="+startDate);
		System.out.println("endDate==="+endDate);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<ForkliftTrack> ftList = new ArrayList<ForkliftTrack>();
		List<ForkliftTrackFile> ftfList=forkliftTrackFileService.getList(tagId,startDate,endDate);
		for (int i = 0; i < ftfList.size(); i++) {
			ForkliftTrackFile ftf = ftfList.get(i);
			String path = ftf.getPath();
			String str = LogUtil.getHisTra(path);
			JSONArray ja = JSONArray.parseArray(str);
			List<ForkliftTrack> ftJAList = ja.toJavaList(ForkliftTrack.class);
			System.out.println("ftJAListsize==="+ftJAList.size());
			ftList.addAll(ftJAList);
		}

		System.out.println("ftListsize==="+ftList.size());
		jsonMap.put("status", "ok");
		jsonMap.put("forkliftTrackList", ftList);
		
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
			String str = LogUtil.getHisTra("D:/resource/TmpCenConWH/aaa.txt");
			System.out.println("str1==="+str);
	        if(!str.startsWith("[")) {
	        	str=str.substring(1);
	            StringBuffer currMsgSB=new StringBuffer();
	            currMsgSB.append("[");
	            currMsgSB.append(str);
	            str =currMsgSB.toString();
	    		System.out.println("str2==="+str);
	    		LogUtil.createHisTra("D:/resource/TmpCenConWH/aaa.txt",str);
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
