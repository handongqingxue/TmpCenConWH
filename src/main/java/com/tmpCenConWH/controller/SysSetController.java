package com.tmpCenConWH.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tmpCenConWH.entity.User;
import com.tmpCenConWH.service.UserService;
import com.tmpCenConWH.util.*;

@Controller
@RequestMapping(SysSetController.MODULE_NAME)
public class SysSetController {

	@Autowired
	private UserService userService;
	public static final String MODULE_NAME="/sysSet";

	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/goUserList")
	public String goUserList(HttpServletRequest request) {
		
		//http://localhost:8080/TmpCenConWH/sysSet/goUserList
		Constant.setUserStateInRequest(request);
		
		return MODULE_NAME+"/userList";
	}
	
	/**
	 * 查询用户
	 * @param username
	 * @param startTime
	 * @param endTime
	 * @param state
	 * @return
	 */
	@RequestMapping(value="/queryUserList")
	@ResponseBody
	public Map<String, Object> queryUserList(String username, String startTime, String endTime, Integer state) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<User> userList=userService.queryList(username, startTime, endTime, state);
		
		if(userList.size()>0) {
			jsonMap.put("status", "ok");
			jsonMap.put("userList", userList);
		}
		else {
			jsonMap.put("status", "no");
			jsonMap.put("message", "暂无用户信息");
		}
		
		return jsonMap;
	}
}
