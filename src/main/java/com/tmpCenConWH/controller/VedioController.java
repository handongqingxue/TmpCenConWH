package com.tmpCenConWH.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(VedioController.MODULE_NAME)
public class VedioController {

	public static final String MODULE_NAME="/vedio";

	/**
	 * 跳转到视频追踪
	 * @return
	 */
	@RequestMapping(value="/goTrack")
	public String goTrack() {
		
		//http://localhost:8080/TmpCenConWH/vedio/goTrack
		
		return MODULE_NAME+"/track";
	}
}
