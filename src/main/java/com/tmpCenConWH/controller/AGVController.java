package com.tmpCenConWH.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(AGVController.MODULE_NAME)
public class AGVController {

	public static final String MODULE_NAME="/agv";

	/**
	 * 跳转到车辆信息
	 * @return
	 */
	@RequestMapping(value="/goInfo")
	public String goInfo() {
		
		//http://localhost:8080/TmpCenConWH/agv/goInfo
		
		return MODULE_NAME+"/info";
	}
}
