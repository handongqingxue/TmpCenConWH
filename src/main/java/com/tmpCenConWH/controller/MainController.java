package com.tmpCenConWH.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//eclipse搭建maven项目:https://blog.csdn.net/weixin_62332711/article/details/125630418
@Controller
@RequestMapping(MainController.MODULE_NAME)
public class MainController {

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
}
