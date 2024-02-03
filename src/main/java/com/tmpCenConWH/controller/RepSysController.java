package com.tmpCenConWH.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(RepSysController.MODULE_NAME)
public class RepSysController {

	public static final String MODULE_NAME="/repSys";

	/**
	 * 跳转到统计图表
	 * @return
	 */
	@RequestMapping(value="/goTotalChart")
	public String goTotalChart() {
		
		//http://localhost:8080/TmpCenConWH/repSys/goTotalChart
		
		return MODULE_NAME+"/totalChart";
	}
}
