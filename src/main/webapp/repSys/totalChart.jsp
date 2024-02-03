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
$(function(){
	initLineChartDiv();
});

function initLineChartDiv(){
	var dom = document.getElementById('line_chart_div');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    var option;
    option = {
	  title: {
	    text: 'Stacked Line'
	  },
	  tooltip: {
	    trigger: 'axis'
	  },
	  legend: {
	    data: ['出库量','入库量']
	  },
	  grid: {
	    left: '3%',
	    right: '4%',
	    bottom: '3%',
	    containLabel: true
	  },
	  toolbox: {
	    feature: {
	      saveAsImage: {}
	    }
	  },
	  xAxis: {
	    type: 'category',
	    boundaryGap: false,
	    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
	  },
	  yAxis: {
	    type: 'value'
	  },
	  series: [
	    {
	      name: '出库量',
	      type: 'line',
	      stack: 'Total',
	      data: [320, 332, 301, 334, 390, 330, 320]
	    },
	    {
	      name: '入库量',
	      type: 'line',
	      stack: 'Total',
	      data: [820, 932, 901, 934, 1290, 1330, 1320]
	    }
	  ]
	};

    if(option&&typeof option === 'object') {
      myChart.setOption(option);
    }
}
</script>
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

.center_div{
	width: 2000px;
	height: 2160px;
	margin-top:-550px;
	margin-left:300px;
}
.center_div .line_chart_div{
	width: 600px;
	height: 500px;
}

.right_div{
	width:500px;
	height:2160px;
	margin-top:-2160px;
	margin-right:50px;
	float: right;
}
.right_div .in_out_real_data_div{
	width:100%;
	height:700px;
	background-color:#EFEFEF;
	border-radius:10px;
	padding-top: 1px;
}
.right_div .in_out_real_data_div .title_div{
	width:90%;
	height:80px;
	line-height:80px;
	margin:30px auto 0;
	font-size:35px;
	text-align:center;
	background-color:#BEBEBE;
	border-radius: 30px;
}
.right_div .in_out_real_data_div .content_div{
	width:90%;
	height:542px;
	margin: auto;
}
.right_div .in_out_real_data_div .content_div .row_div{
	width:100%;
	height:100px;
	padding-top:1px; 
}
.right_div .in_out_real_data_div .content_div .row_div .key_div{
	width:150px;
	height:60px;
	line-height:60px;
	margin-top: 20px;
	font-size: 30px;
	text-align: right;
}
.right_div .in_out_real_data_div .content_div .row_div .val_div{
	width:260px;
	height:60px;
	line-height:60px;
	margin-top: -60px;
	margin-left: 180px;
	color:#5DA4E9;
	font-size: 30px;
	border-bottom: #C8C8C8 solid 1px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="center_div">
		<div class="line_chart_div" id="line_chart_div">
		</div>
	</div>
	<div class="right_div">
		<div class="in_out_real_data_div">
			<div class="title_div">出入库实时数据</div>
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
</body>
</html>