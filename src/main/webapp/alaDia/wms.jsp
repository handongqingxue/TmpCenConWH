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
	initTodayAlarmData();
	initDenLineData();
	initHisAlarmData();
	initHisAlarmLineChartDiv()
});

function initLayoutDivSize(){
	var toolBarDiv=$("#tool_bar_div");
	var toolBarDivML=leftNavDivWidth+leftNavDivWidth*0.5;
	var toolBarDivWidth=bodyWidth-leftNavDivWidth-200;
	toolBarDiv.width(toolBarDivWidth);
	toolBarDiv.css("margin-top",-leftNavDivHeight+50+"px");
	toolBarDiv.css("margin-left",toolBarDivML+"px");
	
	var alarmCountDiv=$("#alarm_count_div");
	alarmCountDiv.css("margin-left",toolBarDivML+"px");
	var alarmCountDivWidth=alarmCountDiv.width();
	
	var alarmCountItemDiv=alarmCountDiv.find(".item_div");
	var alarmCountDivHeight=alarmCountDiv.height();
	var alarmCountDivML=alarmCountDiv.css("margin-left");
	
	var alarmPercDiv=$("#alarm_perc_div");
	alarmPercDiv.height(alarmCountDivHeight);
	alarmPercDiv.css("margin-top",-alarmCountDivHeight+"px");
	var alarmPercDivMT=convertPxStrToInt(alarmCountDivML)+alarmCountItemDiv.width()+20+"px";
	alarmPercDiv.css("margin-left",alarmPercDivMT);
	
	var alarmPercDivWidth=alarmPercDiv.width();
	var alarmPercDivHeight=alarmPercDiv.height();
	
	var pieChartDiv=$("#pie_chart_div");
	pieChartDiv.height(alarmPercDivHeight);

	var todayAlarmListDiv=$("#today_alarm_list_div");
	todayAlarmListDiv.width(toolBarDivWidth-alarmCountDivWidth-alarmPercDivWidth);
	todayAlarmListDiv.height(alarmCountDivHeight);
	todayAlarmListDiv.css("margin-top",-alarmCountDivHeight+"px");
	todayAlarmListDiv.css("margin-left",convertPxStrToInt(alarmPercDivMT)+alarmPercDivWidth+20+"px");

	var alarmDenDiv=$("#alarm_den_div");
	alarmDenDiv.width(toolBarDivWidth);
	alarmDenDiv.css("margin-left",toolBarDivML+"px");
	
	var hisAlarmDiv=$("#his_alarm_div");
	hisAlarmDiv.width(toolBarDivWidth);
	hisAlarmDiv.height(leftNavDivHeight-toolBarDiv.height()-alarmCountDivHeight-alarmDenDiv.height()-200);
	hisAlarmDiv.css("margin-left",toolBarDivML+"px");

	var hisAlarmLineChartDiv=$("#his_alarm_line_chart_div");
	hisAlarmLineChartDiv.width(toolBarDivWidth-$("#his_alarm_list_tab").width()-200);
	hisAlarmLineChartDiv.height(hisAlarmDiv.height());
	hisAlarmLineChartDiv.css("margin-top",-$("#his_alarm_list_tab").height()+"px");
	hisAlarmLineChartDiv.css("margin-left",convertPxStrToInt($("#his_alarm_list_tab").css("margin-left"))+$("#his_alarm_list_tab").width()+"px");
}

function initDenLineData(){
	var denLineDiv=$("#den_line_div");
	var denLineDivWidth=denLineDiv.width();
	var denLineDivHeight=denLineDiv.height();
	var itemCount=24;
	var denLineItemDivWidth=denLineDivWidth/itemCount;
	
	var dlidML=0;
	for(var i=0;i<itemCount;i++){
		var bgColor;
		if(i>=0&i<=7||i>=17)
			bgColor="#141F01";
		else if(i>=8&i<=12)
			bgColor="#E02817";
		else if(i>=13&i<=16)
			bgColor="#FCCA00";
		var itemStr="<div class=\"item_div\" style=\"width:"+denLineItemDivWidth+"px;margin-top:"+(i==0?"0":"-"+denLineDivHeight)+"px;margin-left:"+dlidML+"px;\">";
			itemStr+="<div style=\"width:100%;height:70px;background-color:"+bgColor+"\"></div>";
			itemStr+="<div style=\"width:100%;height:60px;line-height:60px;font-size:28px;text-align:center;\">"+i+"</div>";
		itemStr+="</div>";
		
		denLineDiv.append(itemStr);
		
		dlidML+=denLineItemDivWidth;
	}
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

function initTodayAlarmData(){
	var todayAlarmListTab=$("#today_alarm_list_tab");
	todayAlarmListTab.find(".content_tr").remove();
	for(var i=0;i<2;i++){
		var appendStr="<tr class=\"content_tr\" style=\"background-color:#"+(i%2==0?"fff":"F2F2F2")+"\">";
			appendStr+="<td>"+(i+1)+"</td>";
			if(i%2==0)
				appendStr+="<td style=\"color:#fff;background-color: red;\">柠檬酸库存超上限</td>";
			else
				appendStr+="<td style=\"color:#fff;background-color: #365403;\">仓库闲置率过高</td>";
			appendStr+="<td>2023-01-10 01:00:00</td>";
			if(i%2==0)
				appendStr+="<td>一级</td>";
			else
				appendStr+="<td>二级</td>";
		appendStr+="</tr>";
		
		todayAlarmListTab.append(appendStr);
	}
}

function initHisAlarmData(){
	var hisAlarmListTab=$("#his_alarm_list_tab");
	hisAlarmListTab.find(".content_tr").remove();
	for(var i=0;i<2;i++){
		var appendStr="<tr class=\"content_tr\" style=\"background-color:#"+(i%2==0?"fff":"F2F2F2")+"\">";
			appendStr+="<td>"+(i+1)+"</td>";
			if(i%2==0)
				appendStr+="<td style=\"color:#fff;background-color: red;\">柠檬酸库存超上限</td>";
			else
				appendStr+="<td style=\"color:#fff;background-color: #365403;\">仓库闲置率过高</td>";
			appendStr+="<td>2023-01-10 01:00:00</td>";
			if(i%2==0)
				appendStr+="<td>一级</td>";
			else
				appendStr+="<td>二级</td>";
		appendStr+="</tr>";
		
		hisAlarmListTab.append(appendStr);
	}
}

function initHisAlarmLineChartDiv(){
	var dom = document.getElementById('his_alarm_line_chart_div');
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
	    data: ['报警数量']
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
	    data: ['2024年1月23日', '2024年1月24日', '2024年1月25日', '2024年1月26日', '2024年1月27日', '2024年1月28日', '2024年1月29日']
	  },
	  yAxis: {
	    type: 'value'
	  },
	  series: [
	    {
	      name: '报警数量',
	      type: 'line',
	      stack: 'Total',
	      data: [320, 332, 301, 334, 390, 330, 320]
	    }
	  ]
	};

    if(option&&typeof option === 'object') {
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

.today_alarm_list_div{
	background-color: #EFEFEF;
	border-radius:10px;
}
.today_alarm_list_div .tit_div,
.his_alarm_div .tit_div{
	width: 93%;
	height: 80px;
	line-height: 80px;
	margin: auto;
	font-size: 30px;
}
.today_alarm_list_div .today_alarm_list_tab{
	width: 90%; 
	margin:auto; 
	border: #DBDBDB solid 1px;
}
.today_alarm_list_div .today_alarm_list_tab tr,
.his_alarm_div .his_alarm_list_tab tr{
	height:70px;
}
.today_alarm_list_div .today_alarm_list_tab .tit_tr,
.his_alarm_div .his_alarm_list_tab .tit_tr{
	color:#fff;
	font-size: 30px;
	background-color: #333333;
}
.today_alarm_list_div .today_alarm_list_tab .content_tr,
.his_alarm_div .his_alarm_list_tab .content_tr{
	color:#000;
	font-size: 25px;
	text-align: center;
}

.alarm_den_div{
	height: 200px;
	margin-top:20px;
	background-color: #EFEFEF;
	border-radius:10px;
}
.alarm_den_div .label_div{
	width: 98%;
	height:70px;
	line-height:70px;
	margin:auto; 
}
.alarm_den_div .label_div .tit_span{
	font-size: 25px;
}
.alarm_den_div .label_div .black_item_div{
	width:330px;
	margin-left: 450px;
}
.alarm_den_div .label_div .yellow_item_div{
	width:450px;
	margin-left: 850px;
}
.alarm_den_div .label_div .red_item_div{
	width:350px;
	margin-left: 1350px;
}
.alarm_den_div .label_div .item_div .icon_div{
	width: 60px;
	height: 30px;
	border-radius:15px;
}
.alarm_den_div .label_div .black_item_div .icon_div{
	margin-top: -50px;
	background-color:#141F01;
}
.alarm_den_div .label_div .yellow_item_div .icon_div{
	margin-top: -30px;
	background-color:#FCCA00;
}
.alarm_den_div .label_div .red_item_div .icon_div{
	margin-top: -30px;
	background-color:#E02817;
}
.alarm_den_div .label_div .item_div .name_span{
	margin-top: -50px;
	margin-left: 90px;
	font-size: 25px;
	position: absolute;
}
.alarm_den_div .den_line_div{
	width: 98%;
	height:130px;
	margin: auto;
}
.alarm_den_div .den_line_div .item_div{
	height:130px;
}

.his_alarm_div{
	margin-top: 50px;
	background-color: #EFEFEF;
	border-radius:10px;
}
.his_alarm_div .his_alarm_list_tab{
	width: 40%;
	margin-left:3.5%;
	border: #DBDBDB solid 1px;
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
	<div class="today_alarm_list_div" id="today_alarm_list_div">
		<div class="tit_div">当日活动报警列表</div>
		<table class="today_alarm_list_tab" id="today_alarm_list_tab" border="1" cellspacing="0">
			<tr class="tit_tr">
				<th>序号</th>
				<th>报警名称</th>
				<th>报警时间</th>
				<th>等级</th>
			</tr>
		</table>
	</div>
	<div class="alarm_den_div" id="alarm_den_div">
		<div class="label_div">
			<span class="tit_span">24小时报警密度分布</span>
			<div class="item_div black_item_div">
				<div class="icon_div"></div>
				<span class="name_span">每小时报警数量<5</span>
			</div>
			<div class="item_div yellow_item_div">
				<div class="icon_div"></div>
				<span class="name_span">每小时报警数量>=5且<=10</span>
			</div>
			<div class="item_div red_item_div">
				<div class="icon_div"></div>
				<span class="name_span">每小时报警数量>10</span>
			</div>
		</div>
		<div class="den_line_div" id="den_line_div">
		</div>
	</div>
	<div class="his_alarm_div" id="his_alarm_div">
		<div class="tit_div">历史报警列表以及统计曲线</div>
		<table class="his_alarm_list_tab" id="his_alarm_list_tab" border="1" cellspacing="0">
			<tr class="tit_tr">
				<th>序号</th>
				<th>报警名称</th>
				<th>报警时间</th>
				<th>等级</th>
			</tr>
		</table>
		<div class="his_alarm_line_chart_div" id="his_alarm_line_chart_div">
		</div>
	</div>
</div>
</body>
</html>