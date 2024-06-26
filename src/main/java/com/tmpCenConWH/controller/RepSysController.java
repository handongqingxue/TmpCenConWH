package com.tmpCenConWH.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.service.*;

@Controller
@RequestMapping(RepSysController.MODULE_NAME)
public class RepSysController {

	@Autowired
	private RepSysService repSysService;
	public static final String MODULE_NAME="/repSys";

	/**
	 * 跳转到统计图表(测试时用,现在暂时不用了)
	 * @return
	 */
	@RequestMapping(value="/goTotalChart")
	public String goTotalChart() {
		
		//http://localhost:8080/TmpCenConWH/repSys/goTotalChart
		
		return MODULE_NAME+"/totalChart";
	}

	/**
	 * 跳转到出入库报表
	 * @return
	 */
	@RequestMapping(value="/goInOut")
	public String goInOut() {
		
		//http://localhost:8080/TmpCenConWH/repSys/goInOut
		
		return MODULE_NAME+"/inOut";
	}

	/**
	 * 跳转到图表统计
	 * @return
	 */
	@RequestMapping(value="/goChartTotal")
	public String goChartTotal() {
		
		//http://localhost:8080/TmpCenConWH/repSys/goChartTotal
		
		return MODULE_NAME+"/chartTotal";
	}

	@RequestMapping(value="/goPrint")
	public String goPrint(HttpServletRequest request) {

		String time = request.getParameter("time");
		PrintRec pr=repSysService.selectPrintRecByTime(time);
		request.setAttribute("pr", pr);
		
		return MODULE_NAME+"/print";
	}

	@RequestMapping(value="/addPrintRec")
	@ResponseBody
	public Map<String, Object> addPrintRec(PrintRec pr) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=repSysService.addPrintRec(pr);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建打印记录成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建打印记录失败！");
		}
			
		return jsonMap;
	}
}
