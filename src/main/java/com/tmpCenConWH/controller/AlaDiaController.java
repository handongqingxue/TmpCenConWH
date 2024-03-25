package com.tmpCenConWH.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(AlaDiaController.MODULE_NAME)
public class AlaDiaController {

	public static final String MODULE_NAME="/alaDia";

	@RequestMapping(value="/goWms")
	public String goWms() {
		
		//http://localhost:8080/TmpCenConWH/alaDia/wms
		
		return MODULE_NAME+"/wms";
	}
}
