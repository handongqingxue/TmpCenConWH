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
	/*
	background-color:#0f0;
	*/
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

.aear_real_data_div{
	width:3840px;
	height:2040px;
}
.aear_real_data_div .title_div{
	width: 100%;
	height:100px;
	line-height:100px;
	border-bottom:#F0F0F0 solid 1px;
	padding-top: 1px;
}
.aear_real_data_div .title_div .icon_div{
	width:20px;
	height:50px;
	margin-top:20px;
	margin-left:40px;
	background-color:#BD3124;
}
.aear_real_data_div .title_div .text_span{
	margin-top: -73px;
	margin-left: 90px;
	color:#50505A;
	font-size: 35px;
	position: absolute;
}
.aear_real_data_div .content_div{
	width: 100%;
	height:1940px;
}
.aear_real_data_div .content_div .aear_div{
	width:2540px;
	height:1940px;
	border-right: #F0F0F0 solid 3px;
}
.aear_real_data_div .content_div .aear_div .name_div{
	width: 100%;
	height:150px;
	line-height:150px;
	text-align:center;
	border-bottom:#F0F0F0 solid 1px;
}
.aear_real_data_div .content_div .aear_div .name_div .name_span{
	color:#4F5257;
	font-size:45px;
}
.aear_real_data_div .content_div .aear_div .name_div .right_point_img{
	width: 50px;
	height: 74px;
	margin-top: 40px;
	margin-left: 50px;
	position: absolute;
	cursor: pointer;
}
.aear_real_data_div .content_div .data_div{
	width: 1300px;
	height:1940px;
	margin-top:-1940px;
	float: right;
}
.aear_real_data_div .content_div .data_div .angle_div{
	width:100%;
	height:230px;
	padding-top: 1px;
}
.aear_real_data_div .content_div .data_div .angle_div .title_span,
.aear_real_data_div .content_div .data_div .real_data_div .title_span{
	margin-top: 40px;
	margin-left: 80px;
	font-size:35px;
	position: absolute;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div{
	width:1000px;
	height:100px;
	margin-top:120px;
	margin-left:80px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div{
	width:300px;
	height:100px;
	line-height:100px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .fs_item_div{
	margin-top:-100px;
	margin-left: 330px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .cs_item_div{
	margin-top:-100px;
	margin-left: 660px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div .sel_div{
	width:40px;
	height:40px;
	line-height:40px;
	color:#fff;
	font-size:25px;
	text-align:center;
	margin-top:20px;
	margin-left:20px;
	border: #F0F0F0 solid 1px;
	position: absolute;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div .selected{
	background-color:#1684FC;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div .name_span{
	font-size: 30px;
	margin-left:100px;
}
.aear_real_data_div .content_div .data_div .real_data_div{
	width:100%;
	height:695px;
	margin-top:20px;
	/*
	background-color:#00f;
	*/
	padding-top: 1px;
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div{
	width:1000px;
	height:542px;
	margin-top:120px;
	margin-left:80px;
	border: #5DA4DF solid 1px;
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div .row_div{
	width:100%;
	height:100px;
	padding-top:1px; 
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div .row_div .key_div{
	width:250px;
	height:60px;
	line-height:60px;
	margin-top: 20px;
	font-size: 30px;
	text-align: right;
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div .row_div .val_div{
	width:350px;
	height:60px;
	line-height:60px;
	margin-top: -60px;
	margin-left: 300px;
	color:#5DA4E9;
	font-size: 30px;
	border-bottom: #C8C8C8 solid 1px;
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
	<div class="aear_real_data_div">
		<div class="title_div">
			<div class="icon_div"></div>
			<span class="text_span">库区实时数据</span>
		</div>
		<div class="content_div">
			<div class="aear_div">
				<div class="name_div">
					<span class="name_span">一号仓库</span>
					<img class="right_point_img" alt="" src="<%=basePath %>resource/image/008.png">
				</div>
			</div>
			<div class="data_div">
				<div class="angle_div">
					<span class="title_span">选择视角</span>
					<div class="angle_but_list_div">
						<div class="item_div">
							<div class="sel_div selected">√</div>
							<span class="name_span">主视</span>
						</div>
						<div class="item_div fs_item_div">
							<div class="sel_div">√</div>
							<span class="name_span">俯视</span>
						</div>
						<div class="item_div cs_item_div">
							<div class="sel_div">√</div>
							<span class="name_span">侧视</span>
						</div>
					</div>
				</div>
				<div class="real_data_div">
					<span class="title_span">实时数据</span>
					<div class="content_div">
						<div class="row_div">
							<div class="key_div">库存总量</div>
							<div class="val_div">601件</div>
						</div>
						<div class="row_div">
							<div class="key_div">今日入库量</div>
							<div class="val_div">301件</div>
						</div>
						<div class="row_div">
							<div class="key_div">今日出库量</div>
							<div class="val_div">301件</div>
						</div>
						<div class="row_div">
							<div class="key_div">叉车数量</div>
							<div class="val_div">3辆</div>
						</div>
						<div class="row_div">
							<div class="key_div">库存报警</div>
							<div class="val_div">1起</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>