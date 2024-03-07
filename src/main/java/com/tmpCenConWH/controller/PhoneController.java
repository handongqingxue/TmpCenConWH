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

@Controller
@RequestMapping(PhoneController.MODULE_NAME)
public class PhoneController {

	public static final String MODULE_NAME="/phone";
	
	@RequestMapping(value="/login")
	@ResponseBody
	public Map<String, Object> login(String username, String password) {
		
		System.out.println("username==="+username);
		System.out.println("password==="+password);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		if("admin".equals(username)&&"123456".equals(password)) {
			jsonMap.put("status", "ok");
		}
		else {
			jsonMap.put("status", "no");
			jsonMap.put("info", "暂无信息");
		}
		
		return jsonMap;
	}
}
