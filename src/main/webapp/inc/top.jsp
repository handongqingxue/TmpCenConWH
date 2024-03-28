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

function showUserOptionDiv(){
	var userOptionDiv=$("#user_option_div");
	var display=userOptionDiv.css("display");
	if(display=="none")
		userOptionDiv.css("display","block");
	else
		userOptionDiv.css("display","none");
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
	width: 1600px;
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

.top_div .user_info_div{
	width: 400px;
	height: 120px;
	line-height: 120px;
	margin-top: -120px;
	margin-right: 20px;
	color: #fff;
	font-size: 35px;
	float: right;
}
.top_div .user_info_div .role_span{
	margin-left: 50px;
}

.top_div .user_option_div{
	width: 300px;
	height: 200px;
	border: 1px solid #e6ebf5;
	margin-right: 120px;
	background-color:#fff;
	right: 10px;
	position:absolute;
	display: none;
}
.top_div .user_option_div .item_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-size: 35px;
	text-align: center;
	cursor: pointer;
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
		<a href="<%=basePath %>alaDia/goWms">
		<div class="warn_nav_div">
			<img class="nav_img" alt="" src="<%=basePath %>resource/image/007.png">
			<span class="text_span">报警诊断</span>
		</div>
		</a>
	</div>
	<div class="user_info_div">
		<span class="username_span" onclick="showUserOptionDiv()">${sessionScope.user.username }</span>
		<span class="role_span">超级管理员</span>
	</div>
	<div class="user_option_div" id="user_option_div">
		<div class="item_div">个人中心</div>
		<a href="<%=basePath%>main/exit">
			<div class="item_div">退出登录</div>
		</a>
	</div>
</div>
</body>
</html>