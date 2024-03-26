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
	initPieChartDiv();
});

function initLayoutDivSize(){
	var toolBarDiv=$("#tool_bar_div");
	var toolBarDivML=leftNavDivWidth+leftNavDivWidth*0.5;
	toolBarDiv.width(bodyWidth-leftNavDivWidth-200);
	toolBarDiv.css("margin-top",-leftNavDivHeight+50+"px");
	toolBarDiv.css("margin-left",toolBarDivML+"px");
	
	var alarmCountDiv=$("#alarm_count_div");
	alarmCountDiv.css("margin-left",toolBarDivML+"px");
	
	var alarmCountItemDiv=alarmCountDiv.find(".item_div");
	var alarmCountDivHeight=alarmCountDiv.height();
	var alarmCountDivML=alarmCountDiv.css("margin-left");
	
	var alarmPercDiv=$("#alarm_perc_div");
	alarmPercDiv.height(alarmCountDivHeight);
	alarmPercDiv.css("margin-top",-alarmCountDivHeight+"px");
	alarmPercDiv.css("margin-left",convertPxStrToInt(alarmCountDivML)+alarmCountItemDiv.width()+20+"px");
	
	var alarmPercDivHeight=alarmPercDiv.height();
	
	var pieChartDiv=$("#pie_chart_div");
	pieChartDiv.height(alarmPercDivHeight);
}

function initPieChartDiv(){
	var pieChartDiv=$("#pie_chart_div");
	pieChartDiv.css("display","block");
	
	var dom = document.getElementById('pie_chart_div');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    var option;
    option = {
	  tooltip: {
	    trigger: 'item'
	  },
	  legend: {
		  orient: 'vertical',
	    top: '30%',
	    right: 50,
	    textStyle: {
	           //图例中文字的样式
	           fontSize: 25,
	         },
	  },
	  series: [
	    {
	      name: 'Access From',
	      type: 'pie',
	      radius: ['50%', '70%'],
	      avoidLabelOverlap: false,
	      itemStyle: {
	        borderRadius: 0,
	        borderColor: '#fff',
	        borderWidth: 2,
	        normal: {
               color: function (colors) {
                 var colorList = [
                   '#F53C08',
                   '#BD3124',
                   '#892BCF',
                 ];
                 return colorList[colors.dataIndex];
               }
	        },
	      },
	      label: {
	        show: false,
	        position: 'center'
	      },
	      emphasis: {
	        label: {
	          show: true,
	          fontSize: 40,
	          fontWeight: 'bold'
	        }
	      },
	      labelLine: {
	        show: false
	      },
	      data: [
	        { value: 580, name: '特级' },
	        { value: 484, name: '一级' },
	        { value: 300, name: '二级' }
	      ]
	    }
	  ]
	};

    if(option&&typeof option==='object') {
      myChart.setOption(option);
    }
}

function convertPxStrToInt(str){
	return parseInt(str.substring(0,str.length-2));
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
.main_div .tool_bar_div .time_div{
	width: 36%;
	height: 80px;
	margin-top:-80px;
	float: right;
}
.main_div .tool_bar_div .cho_time_text_span{
	height:70px;
	line-height:70px;
	font-size:35px;
	font-style:italic;
}
.main_div .tool_bar_div .time_inp{
	width:350px;
	height:40px;
	margin-left:15px;
	color:#888;
	font-size:25px;
	border: #BBB solid 1px;
	border-radius:15px; 
}
.main_div .tool_bar_div .to_text_span{
	margin-left:15px;
	font-size:35px;
	font-style:italic;
}
.main_div .tool_bar_div .sear_but_div{
	width: 180px;
	height: 80px;
	line-height: 80px;
	margin-top:-70px;
	margin-left:1050px;
	color:#fff;
	font-size: 28px;
	text-align:center;
	letter-spacing:15px;
	background-color: #4095E5;
	border-radius:10px;
	cursor: pointer;
}

.alarm_count_div{
	width: 18%;
	margin-top:50px;
}
.alarm_count_div .item_div{
	width: 100%;
	height: 200px;
	border-radius:10px;
}
.alarm_count_div .level_one_item_div{
	background-color: #E02817;
}
.alarm_count_div .level_two_item_div{
	margin-top: 20px;
	background-color: #892BCF;
}
.alarm_count_div .item_div .icon_img{
	margin-top: 50px;
	margin-left: 40px;
}
.alarm_count_div .item_div .count_span{
	margin-top: 20px;
	margin-left: 240px;
	color: #BEBEBE;
	font-size: 65px;
	position: absolute;
}
.alarm_count_div .item_div .name_span{
	margin-top: 110px;
	margin-left: 150px;
	color: #BEBEBE;
	font-size: 45px;
	position: absolute;
}

.alarm_perc_div{
	width: 22%;
	background-color: #EFEFEF;
	border-radius:10px;
}
.alarm_perc_div .pie_chart_div{
	width: 100%;
}
.alarm_perc_div .tit_span{
	margin-top: 20px;
	margin-left: 50px;
	font-size: 35px;
	position: absolute;
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
		<div class="time_div">
			<span class="cho_time_text_span">请选择日期</span>
			<input class="time_inp" type="date"/>
			<span class="to_text_span">至</span>
			<input class="time_inp" type="date"/>
			<div class="sear_but_div">查询</div>
		</div>
	</div>
	<div class="alarm_count_div" id="alarm_count_div">
		<div class="item_div level_one_item_div">
			<img class="icon_img" alt="" src="<%=basePath %>resource/image/017.png">
			<span class="count_span">300</span>
			<span class="name_span">一级以上报警</span>
		</div>
		<div class="item_div level_two_item_div">
			<img class="icon_img" alt="" src="<%=basePath %>resource/image/018.png">
			<span class="count_span">160</span>
			<span class="name_span">二级以下报警</span>
		</div>
	</div>
	<div class="alarm_perc_div" id="alarm_perc_div">
		<span class="tit_span">报警比例</span>
		<div class="pie_chart_div" id="pie_chart_div">
		</div>
	</div>
</div>
</body>
</html>