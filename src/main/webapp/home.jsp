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
<style type="text/css">
body{
	margin:0;
}
.main_div{
	width:3840px;
	height:2160px;
	background-color:#0f0;
}
.top_div{
	width:100%;
	height:120px;
	background-color:#347CAF;
}
.system_name_img{
	width: 50px;
	height: 50px;
	margin-top: 30px;
	margin-left: 30px;
	position: absolute;
}
.system_name_span{
	margin-top: 30px;
	margin-left: 90px;
	color:#fff;
	font-size: 45px;
	position: absolute;
}
.nav_div{
	width: 800px;
	height:120px;
	margin-left:500px;
	border-left:#FFF solid 2px;
	/*
	background-color:#00F;
	*/
}
.nav_div .home_nav_div{
	width: 180px;
	height: 120px;
	line-height: 120px;
	margin-left:50px;
}
.nav_div .agv_nav_div{
	width: 350px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:230px;
}
.nav_div .video_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:530px;
}
.nav_div .rep_sys_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:790px;
}
.nav_div .sys_set_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:1050px;
}
.nav_div .warn_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:1310px;
}
.nav_div .selected{
	height: 117px;
	line-height: 117px;
	border-bottom:#FFF solid 3px;
	background-color: red;
}
.nav_div .home_nav_div .nav_img,
.nav_div .agv_nav_div .nav_img,
.nav_div .video_nav_div .nav_img,
.nav_div .rep_sys_nav_div .nav_img,
.nav_div .sys_set_nav_div .nav_img,
.nav_div .warn_nav_div .nav_img{
	width: 40px;
	height: 40px;
	margin-left:20px;
}
.nav_div .home_nav_div .text_span,
.nav_div .agv_nav_div .text_span,
.nav_div .video_nav_div .text_span,
.nav_div .rep_sys_nav_div .text_span,
.nav_div .sys_set_nav_div .text_span,
.nav_div .warn_nav_div .text_span{
	margin-left:10px;
	color:#fff;
	font-size:35px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="main_div">
	<div class="top_div">
		<img class="system_name_img" alt="" src="<%=basePath %>resource/image/001.png">
		<span class="system_name_span">远程集中监控系统</span>
		<div class="nav_div">
			<div class="home_nav_div${uri.contains('home.jsp')?' selected':'' }">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/002.png">
				<span class="text_span">首页</span>
			</div>
			<div class="agv_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/003.png">
				<span class="text_span">AGV车辆定位</span>
			</div>
			<div class="video_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/004.png">
				<span class="text_span">视频监控</span>
			</div>
			<div class="rep_sys_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/005.png">
				<span class="text_span">报表系统</span>
			</div>
			<div class="sys_set_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/006.png">
				<span class="text_span">系统设置</span>
			</div>
			<div class="warn_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/007.png">
				<span class="text_span">报警诊断</span>
			</div>
		</div>
	</div>
</div>
</body>
</html>