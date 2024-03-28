package com.tmpCenConWH.util;

import javax.servlet.http.HttpServletRequest;

import com.tmpCenConWH.entity.*;

public class Constant {

	/**
	 * 存放用户审核状态常量
	 * @param request
	 */
	public static void setUserStateInRequest(HttpServletRequest request) {
		
		request.setAttribute("noCheckState", User.NO_CHECK);
		request.setAttribute("checkedState", User.CHECKED);
		request.setAttribute("editingState", User.EDITING);
		
		request.setAttribute("noCheckStateName", User.NO_CHECK_NAME);
		request.setAttribute("checkedStateName", User.CHECKED_NAME);
		request.setAttribute("editingStateName", User.EDITING_NAME);
	}
}
