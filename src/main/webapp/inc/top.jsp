<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
var bodyWidth;
var bodyHeight;
var topDivHeight;
function initTopDivSize(){
	bodyWidth=$("body").width();
	bodyHeight=$("body").height();
	
	topDivHeight=$("#top_div").height();
}
</script>
<title>Insert title here</title>
<style type="text/css">
a{
	text-decoration: none;
}
.top_div{
	width:100%;
	height:120px;
	background-color:#347CAF;
}
.top_div .system_name_img{
	width: 50px;
	height: 50px;
	margin-top: 30px;
	margin-left: 30px;
	position: absolute;
}
.top_div .system_name_span{
	margin-top: 30px;
	margin-left: 90px;
	color:#fff;
	font-size: 45px;
	position: absolute;
}
.top_div .nav_div{
	width: 800px;
	height:120px;
	margin-left:500px;
	border-left:#FFF solid 2px;
	/*
	background-color:#00F;
	*/
}
.top_div .nav_div .home_nav_div{
	width: 180px;
	height: 120px;
	line-height: 120px;
	margin-left:50px;
}
.top_div .nav_div .agv_nav_div{
	width: 320px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:230px;
}
.top_div .nav_div .video_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:530px;
}
.top_div .nav_div .rep_sys_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:790px;
}
.top_div .nav_div .sys_set_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:1050px;
}
.top_div .nav_div .warn_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:1310px;
}
.top_div .nav_div .selected{
	height: 117px;
	line-height: 117px;
	border-bottom:#FFF solid 3px;
	background-color: red;
}
.top_div .nav_div .home_nav_div .nav_img,
.top_div .nav_div .agv_nav_div .nav_img,
.top_div .nav_div .video_nav_div .nav_img,
.top_div .nav_div .rep_sys_nav_div .nav_img,
.top_div .nav_div .sys_set_nav_div .nav_img,
.top_div .nav_div .warn_nav_div .nav_img{
	width: 40px;
	height: 40px;
	margin-left:20px;
}
.top_div .nav_div .home_nav_div .text_span,
.top_div .nav_div .agv_nav_div .text_span,
.top_div .nav_div .video_nav_div .text_span,
.top_div .nav_div .rep_sys_nav_div .text_span,
.top_div .nav_div .sys_set_nav_div .text_span,
.top_div .nav_div .warn_nav_div .text_span{
	margin-left:10px;
	color:#fff;
	font-size:35px;
}
</style>
</head>
<body>
<div class="top_div" id="top_div">
	<img class="system_name_img" alt="" src="<%=basePath %>resource/image/001.png">
	<span class="system_name_span">远程集中监控系统</span>
	<div class="nav_div">
		<a href="<%=basePath %>main/goHome">
		<div class="home_nav_div${uri.contains('home.jsp')?' selected':'' }">
			<img class="nav_img" alt="" src="<%=basePath %>resource/image/002.png">
			<span class="text_span">首页</span>
		</div>
		</a>
		<a href="<%=basePath %>agv/goInfo">
		<div class="agv_nav_div${uri.contains('info.jsp')?' selected':'' }">
			<img class="nav_img" alt="" src="<%=basePath %>resource/image/003.png">
			<span class="text_span">AGV车辆定位</span>
		</div>
		</a>
		<a href="<%=basePath %>vedio/goTrack">
		<div class="video_nav_div${uri.contains('track.jsp')?' selected':'' }">
			<img class="nav_img" alt="" src="<%=basePath %>resource/image/004.png">
			<span class="text_span">视频监控</span>
		</div>
		</a>
		<a href="<%=basePath %>repSys/goInOut">
		<div class="rep_sys_nav_div${uri.contains('totalChart.jsp')?' selected':'' }">
			<img class="nav_img" alt="" src="<%=basePath %>resource/image/005.png">
			<span class="text_span">报表系统</span>
		</div>
		</a>
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
</body>
</html>