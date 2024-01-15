package com.tmpCenConWH.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.service.*;

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
}
