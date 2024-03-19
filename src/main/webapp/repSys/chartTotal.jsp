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
var repSysPath='<%=basePath %>repSys/';
$(function(){
	initTopDivSize();
	initLeftDivSize();
	initToolBarDivSize();
	initRepNameRadDivSize();
});

function initToolBarDivSize(){
	var toolBarDiv=$("#tool_bar");
	toolBarDiv.width(bodyWidth-leftNavDivWidth-200);
	toolBarDiv.css("margin-top",-leftNavDivHeight+20+"px");
	toolBarDiv.css("margin-left",leftNavDivWidth+50+"px");
}

function initRepNameRadDivSize(){
	
	var repNameRadDiv=$("#rep_name_rad_div");
	repNameRadDiv.height(leftNavDivHeight/2);
}

function createEChart(){
	var barChartDiv=$("#bar_chart_div");
	barChartDiv.css("display","none");
	
	var lineChartDiv=$("#line_chart_div");
	lineChartDiv.css("display","none");
	
	var pieChartDiv=$("#pie_chart_div");
	pieChartDiv.css("display","none");
	
	var tabName=$("#rep_name_sel").val();
	if(tabName=="tab1"){
		titDiv.text("1#硝酸铵库房多孔粒状硝酸铵出入库登记簿");
	}
	else if(tabName=="tab2"){
		titDiv.text("2#硝酸铵库房多孔粒状硝酸铵出入库登记簿");
	}
	else if(tabName=="tab3"){
		titDiv.text("15-1醋酸出入库登记表_文档1");
	}
	else if(tabName=="tab4"){
		titDiv.text("15-1柠檬酸出入库登记表");
	}
	else if(tabName=="tab5"){
		titDiv.text("15-3国产油相出入库登记表_文档1");
	}
	else if(tabName=="tab6"){
		titDiv.text("15-4硫脲出入库登记表_文档1");
	}
	else if(tabName=="tab7"){
		titDiv.text("15-5碳酸钠出入库登记表_文档1");
	}
	else if(tabName=="tab8"){
		titDiv.text("15-6亚硝酸钠出入库登记表_文档1");
	}
	else if(tabName=="tab9"){
		titDiv.text("15-7乙二醇出入库登记表_文档1");
	}
	else if(tabName=="tab10"){
		titDiv.text("15-9添加剂出入库登记表");
	}

	var echartName=$("#echart_name_sel").val();
	if(echartName=="bar")
		initBarChartDiv();
	else if(echartName=="line")
		initLineChartDiv();
	else if(echartName=="pie")
		initPieChartDiv();
}

function initBarChartDiv(){
	var barChartDiv=$("#bar_chart_div");
	barChartDiv.css("display","block");
	
	var dom = document.getElementById('bar_chart_div');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    var option;
    option = {
	  xAxis: {
	    type: 'category',
	    data: ['2024年1月23日', '2024年1月24日', '2024年1月25日', '2024年1月26日', '2024年1月27日', '2024年1月28日', '2024年1月29日']
	  },
	  yAxis: {
	    type: 'value'
	  },
	  series: [
	    {
	    	data: [120, 200, 150, 80, 70, 110, 130],
	        type: 'bar',
	        barGap: 0,
	    },
	    {
	    	data: [120, 200, 150, 80, 70, 110, 130],
	        type: 'bar'
	    }
	  ]
	};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }
}

function initLineChartDiv(){
	var lineChartDiv=$("#line_chart_div");
	lineChartDiv.css("display","block");
	
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
	    data: ['2024年1月23日', '2024年1月24日', '2024年1月25日', '2024年1月26日', '2024年1月27日', '2024年1月28日', '2024年1月29日']
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
	    top: '5%',
	    left: 'center'
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
	        borderWidth: 2
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
	        { value: 580, name: '滞留' },
	        { value: 484, name: '入库量' },
	        { value: 300, name: '出库量' }
	      ]
	    }
	  ]
	};

    if(option&&typeof option==='object') {
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
}
.tool_bar .choose_area_sel_img{
	margin-top: 10px;
	margin-left: 85px;
	position: absolute;
}
.tool_bar .choose_area_sel{
	width: 500px;
	height: 70px;
	margin-left:80px;
	padding-left: 100px;
	font-size:25px; 
	background-color: #CECECE;
	border: #4F4F4F solid 1px;
	border-radius:10px;
}
.tool_bar .choose_rep_text_span,
.tool_bar .choose_date_text_span{
	color: #111;
	font-size: 30px;
	font-style:italic;
	margin-left:50px;
}
.tool_bar .rep_name_sel{
	width:1000px;
	height:70px;
	color: #999;
	font-size: 28px;
	margin-left:50px;
	background-color: #fff;
	border: #eee solid 1px;
}
.tool_bar .date_inp{
	width: 400px;
	height:50px;
	color:#888;
	font-size:28px;
	border: #BBB solid 1px;
	border-radius:15px;
}
.tool_bar .start_time_inp{
	margin-left:50px;
}
.tool_bar .end_time_inp{
	margin-left:20px;
}
.tool_bar .to_text_span{
	color: #111;
	font-size: 30px;
	font-style:italic;
	margin-left:20px;
}

.rep_name_rad_div{
	width:20%;
	margin-top:50px;
	margin-right:100px;
	float:right;
	border:#EFEFEF solid 1px;
}
.rep_name_rad_div .item_div{
	width:80%;
	height:70px;
	line-height:70px;
	margin:auto;
	color:#666;
	font-size:25px;
}
.rep_name_rad_div .tab1_item_div{
	margin-top:20px;
}
.rep_name_rad_div .item_div input{
	width: 30px;
	height: 30px;
	margin-top:20px;
}
.rep_name_rad_div .item_div .name_span{
	margin-left:10px;
	font-size:30px;
}




.center_div .tool_bar .echart_name_sel{
	width:200px;
	height:50px;
	color: #999;
	font-size: 25px;
	margin-left:50px;
	background-color: #fff;
	border: #eee solid 1px;	
}
.center_div .tool_bar .cre_echart_but{
	width: 180px;
	height: 50px;
	margin-left:50px;
	font-size: 35px;
}
.center_div .bar_chart_div{
	width: 90%;
	height: 700px;
	margin:auto;
	display: none;
}
.center_div .line_chart_div{
	width: 90%;
	height: 800px;
	margin:auto;
	display: none;
}
.center_div .pie_chart_div{
	width: 600px;
	height: 500px;
	margin:auto;
	display: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="tool_bar" id="tool_bar">
		<img class="choose_area_sel_img" alt="" src="<%=basePath %>resource/image/013.png">
		<select class="choose_area_sel">
			<option>选择仓库</option>
		</select>
		<span class="choose_rep_text_span">请选择报表</span>
		<select class="rep_name_sel" id="rep_name_sel" onchange="showFilterCondDiv()">
			<option value="tab1">1#硝酸铵库房多孔粒状硝酸铵出入库登记簿</option>
			<option value="tab2">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</option>
			<option value="tab3">15-1醋酸出入库登记表_文档1</option>
			<option value="tab4">15-1柠檬酸出入库登记表_</option>
			<option value="tab5">15-3国产油相出入库登记表_文档1</option>
			<option value="tab6">15-4硫脲出入库登记表_文档1</option>
			<option value="tab7">15-5碳酸钠出入库登记表_文档1</option>
			<option value="tab8">15-6亚硝酸钠出入库登记表_文档1</option>
			<option value="tab9">15-7乙二醇出入库登记表_文档1</option>
			<option value="tab10">15-9添加剂出入库登记表</option>
		</select>
		<span class="choose_date_text_span">请选择日期</span>
		<input class="date_inp start_time_inp" type="date"/>
		<span class="to_text_span">至</span>
		<input class="date_inp end_time_inp" type="date"/>
		
		<!-- 
		<span class="choose_echart_text_span">请选择图表</span>
		<select class="echart_name_sel" id="echart_name_sel">
			<option value="bar">柱状图</option>
			<option value="line">折线图</option>
			<option value="pie">饼状图</option>
		</select>
		<input class="cre_echart_but" type="button" value="生成图表" onclick="createEChart()"/>
		 -->
		
		
	</div>
	
	<div class="rep_name_rad_div" id="rep_name_rad_div">
		<div class="item_div tab1_item_div">
			<input type="radio" id="tab1_rad" name="rep_name_rad" checked="checked"/>
			<span class="name_span">1#硝酸铵库房多孔粒状硝酸铵出入库登记簿</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab2_rad" name="rep_name_rad" checked="checked"/>
			<span class="name_span">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab3_rad" name="rep_name_rad" checked="checked"/>
			<span class="name_span">15-1醋酸出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab4_rad" name="rep_name_rad" checked="checked"/>
			<span class="name_span">15-1柠檬酸出入库登记表</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab5_rad" name="rep_name_rad" checked="checked"/>
			<span class="name_span">15-3国产油相出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab6_rad" checked="checked"/>
			<span class="name_span">15-4硫脲出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab7_rad" checked="checked"/>
			<span class="name_span">15-5碳酸钠出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab8_rad" checked="checked"/>
			<span class="name_span">15-6亚硝酸钠出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab9_rad" checked="checked"/>
			<span class="name_span">15-7乙二醇出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab10_rad" checked="checked"/>
			<span class="name_span">15-9添加剂出入库登记表</span>
		</div>
	</div>
	
	<div class="bar_chart_div" id="bar_chart_div">
	</div>
	<div class="line_chart_div" id="line_chart_div">
	</div>
	<div class="pie_chart_div" id="pie_chart_div">
	</div>
</div>
</body>
</html>