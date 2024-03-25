<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="uri" value="<%=request.getRequestURI() %>"></c:set>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/echarts.min.js"></script>
<script type="text/javascript">
var alaDiaPath='<%=basePath %>alaDia/';
$(function(){
	initTopDivSize();
	initLeftDivSize();
	initLayoutDivSize();
});

function initLayoutDivSize(){
	var toolBarDiv=$("#tool_bar_div");
	toolBarDiv.width(bodyWidth-leftNavDivWidth-200);
	toolBarDiv.css("margin-top",-leftNavDivHeight+50+"px");
	toolBarDiv.css("margin-left",leftNavDivWidth+leftNavDivWidth*0.5+"px");
	
}
</script>
<style type="text/css">
body{
	margin:0;
}
.main_div{
	width:3840px;
	height:2160px;
}
.main_div .tool_bar_div{
	/*
	background-color: red;
	*/
}
.main_div .tool_bar_div .wms_ala_text_div{
	width: 20%;
	height: 80px;
	line-height: 80px;
	font-size:35px;
	font-weight:bold; 
	text-align:center; 
	background-color:#BEBEBE;
	border: #6C6C6C solid 1px;
	border-radius:15px;
}
.main_div .tool_bar_div .wms_ala_icon_img{
	margin-top: -70px;
	margin-left: 15px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="tool_bar_div" id="tool_bar_div">
		<div class="wms_ala_text_div">
			报警诊断/WMS报警页面
		</div>
		<img class="wms_ala_icon_img" alt="" src="<%=basePath %>resource/image/016.png">
	</div>
</div>
</body>
</html>