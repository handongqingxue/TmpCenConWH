<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
var bodyHeight;
var topDivHeight;
var leftNavDivWidth;
var leftNavDivHeight;
$(function(){
	
});

function initLeftDivSize(){
	var leftNavDiv=$("#left_nav_div");
	leftNavDiv.height(bodyHeight-topDivHeight);
	leftNavDivWidth=leftNavDiv.width();
	leftNavDivHeight=leftNavDiv.height();
}
</script>
<style type="text/css">
.left_nav_div{
	width: 4.5%;
	text-align:center;
	margin-top:2px;
	background-color: #fff;
	border: #5DA4DF solid 1px;
	border-radius: 10px;
}
.left_nav_div .item_div{
	width: 100%;
	height: 190px;
	justify-content: center;
	align-items: center;
	display: flex;
}
.left_nav_div .item_div img{
	width:45%;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="left_nav_div" id="left_nav_div">
	<c:choose>
		<c:when test="${uri.contains('/agv/')}">
			<div class="item_div">车辆信息</div>
			<div class="item_div">远程干预</div>
			<div class="item_div">预警信息</div>
			<div class="item_div" onclick="window.open('recLine.jsp')">历史路线</div>
			<div class="item_div">故障统计</div>
			<div class="item_div">库存预警</div>
		</c:when>
		<c:when test="${uri.contains('/vedio/')}">
			<div class="item_div" onclick="showVedioDiv(true);">视频追踪</div>
			<div class="item_div">智能分析</div>
			<div class="item_div">区域画面</div>
			<div class="item_div">视频设置</div>
			<div class="item_div">故障统计</div>
			<div class="item_div">视频联动</div>
		</c:when>
		<c:when test="${uri.contains('/repSys/')}">
			<!-- 出入库报表 -->
			<a href="<%=basePath %>repSys/goInOut">
				<div class="item_div">
					<img alt="" src="<%=basePath %>resource/image/009.png">
				</div>
			</a>
			<!-- 统计报表 -->
			<a href="">
				<div class="item_div">
					<img alt="" src="<%=basePath %>resource/image/010.png">
				</div>
			</a>
			<!-- 叉车记录 -->
			<a href="">
				<div class="item_div">
					<img alt="" src="<%=basePath %>resource/image/011.png">
				</div>
			</a>
			<!-- 图表统计 -->
			<a href="<%=basePath %>repSys/goChartTotal">
				<div class="item_div">
					<img alt="" src="<%=basePath %>resource/image/012.png">
				</div>
			</a>
		</c:when>
	</c:choose>
</div>
</body>
</html>