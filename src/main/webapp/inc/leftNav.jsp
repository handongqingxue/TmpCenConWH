<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.left_nav_div{
	width: 250px;
	height: 550px;
	margin-top:60px;
	margin-left:20px;
	background-color: #EFEFEF;
	border: #5DA4DF solid 1px;
	border-radius: 10px;
}
.left_nav_div .item_div{
	width: 100%;
	height: 90px;
	line-height: 90px;
	color: #5DA4DF;
	font-size:25px;
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="left_nav_div">
	<div class="item_div">车辆信息</div>
	<div class="item_div">远程干预</div>
	<div class="item_div">预警信息</div>
	<div class="item_div" onclick="window.open('recLine.jsp')">历史路线</div>
	<div class="item_div">故障统计</div>
	<div class="item_div">库存预警</div>
</div>
</body>
</html>