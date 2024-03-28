package com.tmpCenConWH.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(HomeController.MODULE_NAME)
public class HomeController {

	public static final String MODULE_NAME="/home";

	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/goHome")
	public String goHome() {
		
		//http://localhost:8080/TmpCenConWH/home/goHome
		
		return "home";
	}
}
