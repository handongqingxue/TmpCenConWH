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
	initBarChartDiv();
	initPieChartDiv();
	initLineChartDiv();
});

function initBarChartDiv(){
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
	    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
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

function initPieChartDiv(){
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
.center_div .bar_chart_div{
	width: 600px;
	height: 500px;
}
.center_div .pie_chart_div{
	width: 600px;
	height: 500px;
	margin-top:-500px;
	margin-left:650px;
}
.center_div .line_chart_div{
	width: 600px;
	height: 500px;
	margin-top:-500px;
	margin-left:1300px;
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

.tab1_div,
.tab2_div{
	width: 2000px;
	display: none;
}
.tab1_div .name_div,
.tab2_div .name_div{
	font-size:35px;
	text-align: center;
}
.tab1,
.tab2{
	width: 100%;
	border: 1px;
}
.tab1 tr td,
.tab2 tr td{
	width: 16.6%;
	text-align: center;
}
.tab1 .tr1,
.tab2 .tr1{
	height:70px;
}
.tab1 .tr2,
.tab2 .tr2{
	height:80px;
}
.tab1 .tr1 .td1,
.tab1 .tr1 .td5,
.tab2 .tr1 .td1,
.tab2 .tr1 .td5{
	font-size: 25px;
}
.tab1 .tr1 .td2,
.tab1 .tr1 .td3,
.tab1 .tr1 .td4,
.tab1 .tr1 .td6,
.tab1 .tr2 .td1,
.tab1 .tr2 .td2,
.tab1 .tr2 .td3,
.tab2 .tr1 .td2,
.tab2 .tr1 .td3,
.tab2 .tr1 .td4,
.tab2 .tr1 .td6,
.tab2 .tr2 .td1,
.tab2 .tr2 .td2,
.tab2 .tr2 .td3{
	font-size: 35px;
}
.tab1 .tr3,
.tab2 .tr3{
	height:60px;
}
.tab1 .tr3 td,
.tab2 .tr3 td{
	font-size: 28px;
}

.tab3_div{
	width: 2000px;
	display: none;
}
.tab3_div .name_div{
	font-size:35px;
	text-align: center;
}
.tab3{
	width: 100%;
	border: 1px;
}
.tab3 tr td{
	text-align: center;
}
.tab3 .tr1,
.tab3 .tr3{
	height:70px;
}
.tab3 .tr2{
	height:80px;
}
.tab3 .tr1 .td1,
.tab3 .tr2 .td1,
.tab3 .tr2 .td2,
.tab3 .tr2 .td3,
.tab3 .tr2 .td4,
.tab3 .tr2 .td5,
.tab3 .tr2 .td6{
	width: 7%;
	font-size: 25px;
}
.tab3 .tr1 .td2,
.tab3 .tr1 .td3{
	width: 21%;
	font-size: 25px;
}
.tab3 .tr1 .td4,
.tab3 .tr1 .td5,
.tab3 .tr1 .td6{
	width: 15%;
	font-size: 25px;
}
.tab3 .tr3 td{
	font-size: 25px;
}

.tab4_div{
	width: 2000px;
	/* 
	display: none;
	*/
}
.tab4_div .name_div{
	font-size:35px;
	text-align: center;
}
.tab4_div .ylmc_div{
	height: 70px;
}
.tab4_div .ylmc_div .ylmc_span{
	font-size:35px;
}
.tab4_div .ylmc_div .nf_span{
	font-size:35px;
	float: right;
}
.tab4{
	width: 100%;
	border: 1px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="center_div">
		<div class="bar_chart_div" id="bar_chart_div">
		</div>
		<div class="pie_chart_div" id="pie_chart_div">
		</div>
		<div class="line_chart_div" id="line_chart_div">
		</div>
		
		<div class="tab1_div" id="tab1_div">
			<div class="name_div">1#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>
			<table class="tab1" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1" rowspan="2">时间</td>
					<td class="td2">入库</td>
					<td class="td3">出库</td>
					<td class="td4">库存</td>
					<td class="td5" rowspan="2">记录人签字</td>
					<td class="td6" rowspan="2">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">数量(吨)</td>
					<td class="td2">数量(吨)</td>
					<td class="td3">数量(吨)</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月23日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月24日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月25日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月26日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月27日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月28日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月29日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月30日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月31日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
			</table>
		</div>
		
		<div class="tab2_div" id="tab2_div">
			<div class="name_div">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>
			<table class="tab2" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1" rowspan="2">时间</td>
					<td class="td2">入库</td>
					<td class="td3">出库</td>
					<td class="td4">库存</td>
					<td class="td5" rowspan="2">记录人签字</td>
					<td class="td6" rowspan="2">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">数量(吨)</td>
					<td class="td2">数量(吨)</td>
					<td class="td3">数量(吨)</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月23日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月24日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月25日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月26日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月27日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月28日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月29日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月30日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2024年1月31日</td>
					<td class="td2">11</td>
					<td class="td3">11</td>
					<td class="td4">11</td>
					<td class="td5">天赐</td>
					<td class="td6">李天亯</td>
				</tr>
			</table>
		</div>
		
		<div class="tab3_div" id="tab3_div">
			<div class="name_div">制药车间化工原料（醋 酸）出入库登记表</div>
			<table class="tab3" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1" rowspan="2">序号</td>
					<td class="td2" colspan="3">出库记录</td>
					<td class="td3" colspan="3">入库记录</td>
					<td class="td4" rowspan="2">总库存(kg)</td>
					<td class="td5" rowspan="2">出料人</td>
					<td class="td6" rowspan="2">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">日期</td>
					<td class="td2">数量(kg)</td>
					<td class="td3">签名</td>
					<td class="td4">日期</td>
					<td class="td5">数量(kg)</td>
					<td class="td6">签名</td>
				</tr>
				<tr class="tr3">
					<td class="td1">1</td>
					<td class="td2">100</td>
					<td class="td3">1</td>
					<td class="td4">1</td>
					<td class="td5">10</td>
					<td class="td6">10</td>
					<td class="td7">1</td>
					<td class="td8">1</td>
					<td class="td9">10</td>
					<td class="td10">10</td>
				</tr>
				<tr class="tr3">
					<td class="td1">2</td>
					<td class="td2">100</td>
					<td class="td3">1</td>
					<td class="td4">1</td>
					<td class="td5">10</td>
					<td class="td6">10</td>
					<td class="td7">1</td>
					<td class="td8">1</td>
					<td class="td9">10</td>
					<td class="td10">10</td>
				</tr>
				<tr class="tr3">
					<td class="td1">3</td>
					<td class="td2">100</td>
					<td class="td3">1</td>
					<td class="td4">1</td>
					<td class="td5">10</td>
					<td class="td6">10</td>
					<td class="td7">1</td>
					<td class="td8">1</td>
					<td class="td9">10</td>
					<td class="td10">10</td>
				</tr>
				<tr class="tr3">
					<td class="td1">4</td>
					<td class="td2">100</td>
					<td class="td3">1</td>
					<td class="td4">1</td>
					<td class="td5">10</td>
					<td class="td6">10</td>
					<td class="td7">1</td>
					<td class="td8">1</td>
					<td class="td9">10</td>
					<td class="td10">10</td>
				</tr>
				<tr class="tr3">
					<td class="td1">5</td>
					<td class="td2">100</td>
					<td class="td3">1</td>
					<td class="td4">1</td>
					<td class="td5">10</td>
					<td class="td6">10</td>
					<td class="td7">1</td>
					<td class="td8">1</td>
					<td class="td9">10</td>
					<td class="td10">10</td>
				</tr>
			</table>
		</div>
		
		<div class="tab4_div" id="tab4_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：柠檬酸</span>
				<span class="nf_span">年份： 2024</span>
			</div>
			<table class="tab4" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1" rowspan="2">序号</td>
					<td class="td2" colspan="3">出库记录</td>
					<td class="td3" colspan="3">入库记录</td>
					<td class="td4" rowspan="2">总库存(kg)</td>
					<td class="td5" rowspan="2">出料人</td>
					<td class="td6" rowspan="2">备注</td>
				</tr>
			</table>
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