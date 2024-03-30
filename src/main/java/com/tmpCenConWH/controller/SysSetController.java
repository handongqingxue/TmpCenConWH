package com.tmpCenConWH.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.service.*;
import com.tmpCenConWH.util.*;

@Controller
@RequestMapping(SysSetController.MODULE_NAME)
public class SysSetController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
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
	
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/addRole")
	@ResponseBody
	public Map<String, Object> addRole(Role role) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count=roleService.add(role);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建角色成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建角色失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建角色失败！");
		}
		finally {
			return jsonMap;
		}
	}
	
	/**
	 * 编辑角色
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/editRole")
	@ResponseBody
	public Map<String, Object> editRole(Role role) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=roleService.edit(role);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑角色成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑角色失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/queryRoleList")
	@ResponseBody
	public Map<String, Object> queryRoleList(String name) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<Role> roleList=roleService.queryList(name);
		
		if(roleList.size()>0) {
			jsonMap.put("status", "ok");
			jsonMap.put("roleList", roleList);
		}
		else {
			jsonMap.put("status", "no");
			jsonMap.put("message", "暂无角色信息");
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/queryPermissionList")
	@ResponseBody
	public Map<String, Object> queryPermissionList(String name) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<Permission> permissionList=permissionService.queryList(name);
		
		if(permissionList.size()>0) {
			jsonMap.put("status", "ok");
			jsonMap.put("permissionList", permissionList);
		}
		else {
			jsonMap.put("status", "no");
			jsonMap.put("message", "暂无权限信息");
		}
		
		return jsonMap;
	}
}
