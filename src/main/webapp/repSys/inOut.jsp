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
	initLayoutDivSize();
	showFilterCondDiv();
});

function initLayoutDivSize(){
	var body=$("body");
	var bodyWidth=body.width();
	var bodyHeight=body.height();
	
	var topDiv=$("#top_div");
	var topDivHeight=topDiv.height();
	
	var leftNavDiv=$("#left_nav_div");
	var leftNavDivWidth=leftNavDiv.width();
	
	var rightDiv=$("#right_div");
	var rightDivWidth=rightDiv.width();

	var centerDiv=$("#center_div");
	centerDiv.width(bodyWidth-leftNavDivWidth-rightDivWidth-200);
	centerDiv.height(leftNavDiv.height());
	centerDiv.css("margin-top",-leftNavDivHeight+"px");
	centerDiv.css("margin-left",leftNavDivWidth+"px");

	rightDiv.height(centerDiv.height()-100);
	rightDiv.css("margin-top",-centerDiv.height()+80+"px");
	
	$(".filter_condition_div").height(rightDiv.height());
}

function showFilterCondDiv(){
	$("#right_div .filter_condition_div").css("display","none");
	
	var tabName=$("#rep_name_sel").val();
	if(tabName=="tab1"){
		$("#data_tab1_cond_div").css("display","block");
	}
	else if(tabName=="tab2"){
		$("#data_tab2_cond_div").css("display","block");
	}
	else if(tabName=="tab3"){
		$("#data_tab3_cond_div").css("display","block");
	}
	else if(tabName=="tab4"){
		$("#data_tab4_cond_div").css("display","block");
	}
	else if(tabName=="tab5"){
		$("#data_tab5_cond_div").css("display","block");
	}
	else if(tabName=="tab6"){
		$("#data_tab6_cond_div").css("display","block");
	}
	else if(tabName=="tab7"){
		$("#data_tab7_cond_div").css("display","block");
	}
	else if(tabName=="tab8"){
		$("#data_tab8_cond_div").css("display","block");
	}
	else if(tabName=="tab9"){
		$("#data_tab9_cond_div").css("display","block");
	}
	else if(tabName=="tab10"){
		$("#data_tab10_cond_div").css("display","block");
	}
}

function createEChart(){
	var echartName=$("#echart_name_sel").val();
	
	var barChartDiv=$("#bar_chart_div");
	barChartDiv.css("display","none");
	
	var lineChartDiv=$("#line_chart_div");
	lineChartDiv.css("display","none");
	
	var pieChartDiv=$("#pie_chart_div");
	pieChartDiv.css("display","none");
	
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

function createReportTab(){
	var tabName=$("#rep_name_sel").val();
	if(tabName=="tab1"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("1#硝酸铵库房多孔粒状硝酸铵出入库登记簿");
		
		var timeCbChecked=$("#data_tab1_cond_div #time_cb").prop("checked");
		var inCountCbChecked=$("#data_tab1_cond_div #in_count_cb").prop("checked");
		var outCountCbChecked=$("#data_tab1_cond_div #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#data_tab1_cond_div #save_count_cb").prop("checked");
		var recCbChecked=$("#data_tab1_cond_div #rec_cb").prop("checked");
		var memoCbChecked=$("#data_tab1_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab1\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 70px;\">";
			if(timeCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 25px;text-align: center;\" rowspan=\"2\">时间</td>";
			if(inCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">入库</td>";
			if(outCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">出库</td>";
			if(saveCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">库存</td>";
			if(recCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 25px;text-align: center;\" rowspan=\"2\">记录人签字</td>";
			if(memoCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\" rowspan=\"2\">备注</td>";
			appendStr+="</tr>";
			
			
		appendStr+="<tr style=\"height: 80px;\">";
		if(inCountCbChecked)
			appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">数量(吨)</td>";
		if(outCountCbChecked)
			appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">数量(吨)</td>";
		if(saveCountCbChecked)
			appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">数量(吨)</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={time:"2024年1月23日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月24日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月25日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月26日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月27日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月28日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月29日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月30日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月31日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 60px;\">";
			if(timeCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].time+"</td>";
			if(inCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].inCount+"</td>";
			if(outCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].outCount+"</td>";
			if(saveCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].saveCount+"</td>";
			if(recCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].rec+"</td>";
			if(memoCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab2"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("2#硝酸铵库房多孔粒状硝酸铵出入库登记簿");
		
		var timeCbChecked=$("#data_tab2_cond_div #time_cb").prop("checked");
		var inCountCbChecked=$("#data_tab2_cond_div #in_count_cb").prop("checked");
		var outCountCbChecked=$("#data_tab2_cond_div #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#data_tab2_cond_div #save_count_cb").prop("checked");
		var recCbChecked=$("#data_tab2_cond_div #rec_cb").prop("checked");
		var memoCbChecked=$("#data_tab2_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab2\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 70px;\">";
			if(timeCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 25px;text-align: center;\" rowspan=\"2\">时间</td>";
			if(inCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">入库</td>";
			if(outCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">出库</td>";
			if(saveCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">库存</td>";
			if(recCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 25px;text-align: center;\" rowspan=\"2\">记录人签字</td>";
			if(memoCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\" rowspan=\"2\">备注</td>";
			appendStr+="</tr>";
			
			
		appendStr+="<tr style=\"height: 80px;\">";
		if(inCountCbChecked)
			appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">数量(吨)</td>";
		if(outCountCbChecked)
			appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">数量(吨)</td>";
		if(saveCountCbChecked)
			appendStr+="<td style=\"width: 16.6%;font-size: 35px;text-align: center;\">数量(吨)</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={time:"2024年1月23日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月24日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月25日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月26日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月27日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月28日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月29日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月30日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月31日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 60px;\">";
			if(timeCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].time+"</td>";
			if(inCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].inCount+"</td>";
			if(outCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].outCount+"</td>";
			if(saveCountCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].saveCount+"</td>";
			if(recCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].rec+"</td>";
			if(memoCbChecked)
				appendStr+="<td style=\"width: 16.6%;font-size: 28px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab3"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-1醋酸出入库登记表_文档1");
		
		var noCbChecked=$("#data_tab3_cond_div #no_cb").prop("checked");
		var outRecCbChecked=$("#data_tab3_cond_div #out_rec_cb").prop("checked");
		var inRecCbChecked=$("#data_tab3_cond_div #in_rec_cb").prop("checked");
		var totalCbChecked=$("#data_tab3_cond_div #total_cb").prop("checked");
		var outGoodsCbChecked=$("#data_tab3_cond_div #out_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab3_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab3\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 70px;\">";
					if(noCbChecked)
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\" rowspan=\"2\">序号</td>";
					if(outRecCbChecked)
				appendStr+="<td style=\"width: 21%;font-size: 25px;text-align: center;\" colspan=\"3\">出库记录</td>";
					if(inRecCbChecked)
				appendStr+="<td style=\"width: 21%;font-size: 25px;text-align: center;\" colspan=\"3\">入库记录</td>";
					if(totalCbChecked)
				appendStr+="<td style=\"width: 15%;font-size: 25px;text-align: center;\" rowspan=\"2\">总库存(kg)</td>";
				if(outGoodsCbChecked)
					appendStr+="<td style=\"width: 15%;font-size: 25px;text-align: center;\" rowspan=\"2\">出料人</td>";
				if(memoCbChecked)
					appendStr+="<td style=\"width: 15%;font-size: 25px;text-align: center;\" rowspan=\"2\">备注</td>";
			appendStr+="</tr>";
			appendStr+="<tr style=\"height: 80px;\">";
			if(outRecCbChecked){
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\">日期</td>";
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\">数量(kg)</td>";
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\">签名</td>";
			}
			if(inRecCbChecked){
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\">日期</td>";
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\">数量(kg)</td>";
				appendStr+="<td style=\"width: 7%;font-size: 25px;text-align: center;\">签名</td>";
			}
			appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:4,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:5,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 70px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outRecCbChecked){
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].outDate+"</td>";
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].outCount+"</td>";
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].outSign+"</td>";
						}
						if(inRecCbChecked){
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].inDate+"</td>";
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].inCount+"</td>";
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].inSign+"</td>";
						}
						if(totalCbChecked)
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(outGoodsCbChecked)
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].outGoods+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"font-size: 25px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab4"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-1柠檬酸出入库登记表");
		
		var noCbChecked=$("#data_tab4_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab4_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab4_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab4_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab4_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab4_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab4_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab4_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab4_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab4\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab5"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-3国产油相出入库登记表_文档1");
		
		var noCbChecked=$("#data_tab5_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab5_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab5_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab5_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab5_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab5_cond_div #wh_master_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab5_cond_div #rec_goods_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab5_cond_div #gro_lea_cb").prop("checked");
		var memoCbChecked=$("#data_tab5_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab5\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab6"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-4硫脲出入库登记表_文档1");
		
		var noCbChecked=$("#data_tab6_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab6_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab6_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab6_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab6_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab6_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab6_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab6_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab6_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab6\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab7"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-5碳酸钠出入库登记表_文档1");
		
		var noCbChecked=$("#data_tab7_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab7_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab7_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab7_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab7_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab7_cond_div #wh_master_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab7_cond_div #rec_goods_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab7_cond_div #gro_lea_cb").prop("checked");
		var memoCbChecked=$("#data_tab7_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab7\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab8"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-6亚硝酸钠出入库登记表_文档1");
		
		var noCbChecked=$("#data_tab8_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab8_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab8_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab8_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab8_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab8_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab8_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab8_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab8_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab8\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab9"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-7乙二醇出入库登记表_文档1");
		
		var noCbChecked=$("#data_tab9_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab9_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab9_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab9_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab9_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab9_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab9_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab9_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab9_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab9\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
	else if(tabName=="tab10"){
		var creaRepDiaDiv=$("#crea_rep_dia_div");
		var creaRepTabDiv=creaRepDiaDiv.find("#crea_rep_div #tab_div");
		
		var tabNameDiv=creaRepTabDiv.find("#name_div");
		tabNameDiv.text("");
		
		var creaRepTab=creaRepTabDiv.find("table");
		creaRepTab.remove();
		
		tabNameDiv.text("15-9添加剂出入库登记表");
		
		var noCbChecked=$("#data_tab10_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab10_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab10_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab10_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab10_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab10_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab10_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab10_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab10_cond_div #memo_cb").prop("checked");

		var appendStr="<table id=\"rep_tab10\" style=\"width: 90%;margin:50px auto 0;border: 1px;\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr style=\"height: 120px;\">";
				if(noCbChecked)
		appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">序号</td>";
				if(outInDateCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出入库日期</td>";
				if(outCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">出库量(kg)</td>";
				if(inCountCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">入库量(kg)</td>";
				if(totalCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">总库存(kg)</td>";
				if(whMasterCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">库房责任人</td>";
				if(groLeaCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">班组长</td>";
				if(recGoodsCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">领料人</td>";
				if(memoCbChecked)
		appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">备注</td>";
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);

		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr style=\"height: 80px;\">";
						if(noCbChecked)
				appendStr+="<td style=\"width: 5%;font-size: 30px;text-align: center;\">"+dataArr[i].no+"</td>";
						if(outInDateCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outInDate+"</td>";
						if(outCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].outCount+"</td>";
						if(inCountCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].inCount+"</td>";
						if(totalCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].total+"</td>";
						if(whMasterCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].whMaster+"</td>";
						if(groLeaCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].groLea+"</td>";
						if(recGoodsCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].recGoods+"</td>";
						if(memoCbChecked)
				appendStr+="<td style=\"width: 10%;font-size: 30px;text-align: center;\">"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		creaRepTabDiv.append(appendStr);
		
		showCreaRepDiaDiv(true);
	}
}

function createTabCellStr(flag,val){
	var str;
	if(flag=="th")
		str="<th>"+val+"</th>";
	else if(flag=="td")
		str="<td>"+val+"</td>";
	return str;
}

function createDataTab(){
	var tabName=$("#rep_name_sel").val();
	if(tabName=="tab1"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();

		var timeCbChecked=$("#data_tab1_cond_div #time_cb").prop("checked");
		var inCountCbChecked=$("#data_tab1_cond_div #in_count_cb").prop("checked");
		var outCountCbChecked=$("#data_tab1_cond_div #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#data_tab1_cond_div #save_count_cb").prop("checked");
		var recCbChecked=$("#data_tab1_cond_div #rec_cb").prop("checked");
		var memoCbChecked=$("#data_tab1_cond_div #memo_cb").prop("checked");
		
		var titleArr=["时间","入库数量(吨)","出库数量(吨)","库存数量(吨)","记录人签字","备注"];
		var appendStr="<div class=\"tab_name_div\">1#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>";
			appendStr+="<table class=\"data_tab1\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
				appendStr+="<tr class=\"tr1\">";
				
		var colCount=0;
		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(timeCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(saveCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(recCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
			
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
		
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={time:"2024年1月23日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月24日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月25日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月26日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月27日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月28日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月29日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月30日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月31日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(timeCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].time);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(saveCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].saveCount);
				colCount++;
			}
			if(recCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].rec);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab2"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var timeCbChecked=$("#data_tab2_cond_div #time_cb").prop("checked");
		var inCountCbChecked=$("#data_tab2_cond_div #in_count_cb").prop("checked");
		var outCountCbChecked=$("#data_tab2_cond_div #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#data_tab2_cond_div #save_count_cb").prop("checked");
		var recCbChecked=$("#data_tab2_cond_div #rec_cb").prop("checked");
		var memoCbChecked=$("#data_tab2_cond_div #memo_cb").prop("checked");

		var titleArr=["时间","入库数量(吨)","出库数量(吨)","库存数量(吨)","记录人签字","备注"];
		var appendStr="<div class=\"tab_name_div\">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>";
			appendStr+="<table class=\"data_tab2\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
			
		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(timeCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(saveCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(recCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
					
		appendStr+="</tr>";
		
		var dataArr=[];
		var data={time:"2024年1月23日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月24日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月25日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月26日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月27日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月28日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月29日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月30日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={time:"2024年1月31日",inCount:111,outCount:222,saveCount:333,rec:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(timeCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].time);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(saveCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].saveCount);
				colCount++;
			}
			if(recCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].rec);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab3"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab3_cond_div #no_cb").prop("checked");
		var outRecCbChecked=$("#data_tab3_cond_div #out_rec_cb").prop("checked");
		var inRecCbChecked=$("#data_tab3_cond_div #in_rec_cb").prop("checked");
		var totalCbChecked=$("#data_tab3_cond_div #total_cb").prop("checked");
		var outGoodsCbChecked=$("#data_tab3_cond_div #out_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab3_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出库日期","出库数量(吨)","出库签名","入库日期","入库数量(吨)","入库签名","总库存(kg)","出料人","备注"];
		var appendStr="<div class=\"tab_name_div\">15-1醋酸出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab3\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";

		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(noCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
			case 2:
			case 3:
				if(outRecCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
			case 5:
			case 6:
				if(inRecCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 7:
				if(totalCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 8:
				if(outGoodsCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 9:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
					
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:4,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:5,outDate:"02-05",outCount:111,outSign:111,inDate:"02-03",inCount:222,inSign:222,total:333,outGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outRecCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outDate);
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				appendStr+=createTabCellStr("td",dataArr[i].outSign);
				colCount+=3;
			}
			if(inRecCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inDate);
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				appendStr+=createTabCellStr("td",dataArr[i].inSign);
				colCount+=3;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(outGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outGoods);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab4"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab4_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab4_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab4_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab4_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab4_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab4_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab4_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab4_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab4_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<div class=\"tab_name_div\">15-1柠檬酸出入库登记表</div>";
			appendStr+="<table class=\"data_tab4\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";

		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(noCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(outInDateCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(totalCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(whMasterCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 6:
				if(groLeaCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 7:
				if(recGoodsCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 8:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
		
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab5"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab5_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab5_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab5_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab5_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab5_cond_div #total_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab5_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab5_cond_div #rec_goods_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab5_cond_div #wh_master_cb").prop("checked");
		var memoCbChecked=$("#data_tab5_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","领料人","班组长","备注"];
		var appendStr="<div class=\"tab_name_div\">15-3国产油相出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab5\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
			
		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(noCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(outInDateCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(totalCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(groLeaCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 6:
				if(recGoodsCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 7:
				if(whMasterCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 8:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab6"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab6_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab6_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab6_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab6_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab6_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab6_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab6_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab6_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab6_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<div class=\"tab_name_div\">15-4硫脲出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab6\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";

			var colCount=0;

			for(var i=0;i<titleArr.length;i++){
				switch (i) {
				case 0:
					if(noCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 1:
					if(outInDateCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 2:
					if(outCountCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 3:
					if(inCountCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 4:
					if(totalCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 5:
					if(whMasterCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 6:
					if(groLeaCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 7:
					if(recGoodsCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 8:
					if(memoCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				}
			}
					
			if(colCount<titleArr.length){
				for(var i=0;i<titleArr.length-colCount;i++){
					appendStr+="<th></th>";
				}
			}
			appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab7"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab7_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab7_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab7_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab7_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab7_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab7_cond_div #wh_master_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab7_cond_div #rec_goods_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab7_cond_div #gro_lea_cb").prop("checked");
		var memoCbChecked=$("#data_tab7_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","领料人","班组长","备注"];
		var appendStr="<div class=\"tab_name_div\">15-5碳酸钠出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab7\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";

			var colCount=0;

			for(var i=0;i<titleArr.length;i++){
				switch (i) {
				case 0:
					if(noCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 1:
					if(outInDateCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 2:
					if(outCountCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 3:
					if(inCountCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 4:
					if(totalCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 5:
					if(whMasterCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 6:
					if(recGoodsCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 7:
					if(groLeaCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				case 8:
					if(memoCbChecked){
						appendStr+=createTabCellStr("th",titleArr[i]);
						colCount++;
					}
					break;
				}
			}
					
			if(colCount<titleArr.length){
				for(var i=0;i<titleArr.length-colCount;i++){
					appendStr+="<th></th>";
				}
			}
			appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab8"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab8_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab8_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab8_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab8_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab8_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab8_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab8_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab8_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab8_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<div class=\"tab_name_div\">15-6亚硝酸钠出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab8\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
			
		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(noCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(outInDateCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(totalCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(whMasterCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 6:
				if(groLeaCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 7:
				if(recGoodsCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 8:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab9"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab9_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab9_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab9_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab9_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab9_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab9_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab9_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab9_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab9_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<div class=\"tab_name_div\">15-7乙二醇出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab9\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
			
		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(noCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(outInDateCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(totalCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(whMasterCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 6:
				if(groLeaCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 7:
				if(recGoodsCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 8:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}

			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab10"){
		var dataTabDiv=$("#data_tab_div");
		dataTabDiv.empty();
		
		var noCbChecked=$("#data_tab10_cond_div #no_cb").prop("checked");
		var outInDateCbChecked=$("#data_tab10_cond_div #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#data_tab10_cond_div #out_count_cb").prop("checked");
		var inCountCbChecked=$("#data_tab10_cond_div #in_count_cb").prop("checked");
		var totalCbChecked=$("#data_tab10_cond_div #total_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab10_cond_div #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#data_tab10_cond_div #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab10_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab10_cond_div #memo_cb").prop("checked");

		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<div class=\"tab_name_div\">15-9添加剂出入库登记表</div>";
			appendStr+="<table class=\"data_tab10\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
			
		var colCount=0;

		for(var i=0;i<titleArr.length;i++){
			switch (i) {
			case 0:
				if(noCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 1:
				if(outInDateCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 2:
				if(outCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 3:
				if(inCountCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 4:
				if(totalCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 5:
				if(whMasterCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 6:
				if(groLeaCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 7:
				if(recGoodsCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			case 8:
				if(memoCbChecked){
					appendStr+=createTabCellStr("th",titleArr[i]);
					colCount++;
				}
				break;
			}
		}
				
		if(colCount<titleArr.length){
			for(var i=0;i<titleArr.length-colCount;i++){
				appendStr+="<th></th>";
			}
		}
		
		appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			colCount=0;
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			if(noCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].no);
				colCount++;
			}
			if(outInDateCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outInDate);
				colCount++;
			}
			if(outCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].outCount);
				colCount++;
			}
			if(inCountCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].inCount);
				colCount++;
			}
			if(totalCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].total);
				colCount++;
			}
			if(whMasterCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].whMaster);
				colCount++;
			}
			if(groLeaCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].groLea);
				colCount++;
			}
			if(recGoodsCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].recGoods);
				colCount++;
			}
			if(memoCbChecked){
				appendStr+=createTabCellStr("td",dataArr[i].memo);
				colCount++;
			}
			
			if(colCount<titleArr.length){
				for(var j=0;j<titleArr.length-colCount;j++){
					appendStr+="<td></td>";
				}
			}
			appendStr+="</tr>";
		}
		appendStr+="</table>";

		dataTabDiv.append(appendStr);
	}
}

function printRep(){
	var tabName=$("#rep_name_sel").val();
	var time=new Date().getTime();
	var printHtml = $("#rep_tab"+tabName.substring(3)).prop("outerHTML");//获得包括div本身在内的标签内容,参考链接:https://www.jb51.net/article/61916.htm
    $.post(repSysPath+"addPrintRec",
	  {time:time,html:printHtml},
   	  function(data){
	   	 if(data.message=="ok"){
	         window.open("goPrint?time="+time);
	   	 }
      }
    ,"json");
}

function exportExcel(){
	var tabName=$("#rep_name_sel").val();
	var table = $("#rep_tab"+tabName.substring(3));
    var excelContent = table[0].innerHTML;
    var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
    excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
    excelFile += "<body><table>";
    excelFile += excelContent;
    excelFile += "</table></body>";
    excelFile += "</html>";
    var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
    
    var fileName;
    if(tabName=="tab1"){
    	fileName="1#硝酸铵库房多孔粒状硝酸铵出入库登记簿";
    }
    else if(tabName=="tab2"){
    	fileName="2#硝酸铵库房多孔粒状硝酸铵出入库登记簿";
    }
    else if(tabName=="tab3"){
    	fileName="15-1醋酸出入库登记表_文档1";
    }
    else if(tabName=="tab4"){
    	fileName="15-1柠檬酸出入库登记表";
    }
    else if(tabName=="tab5"){
    	fileName="15-3国产油相出入库登记表_文档1";
    }
    else if(tabName=="tab6"){
    	fileName="15-4硫脲出入库登记表_文档1";
    }
    else if(tabName=="tab7"){
    	fileName="15-5碳酸钠出入库登记表_文档1";
    }
    else if(tabName=="tab8"){
    	fileName="15-6亚硝酸钠出入库登记表_文档1";
    }
    else if(tabName=="tab9"){
    	fileName="15-7乙二醇出入库登记表_文档1";
    }
    else if(tabName=="tab10"){
    	fileName="15-9添加剂出入库登记表";
    }
    var a = document.createElement("a");
    a.download = fileName+".xlsx";
    a.href = link;
    a.click();
}

function base64 (content) {
    return window.btoa(unescape(encodeURIComponent(content)));
}

function showCreaRepDiaDiv(flag){
	var creaRepDiaDiv=$("#crea_rep_dia_div");
	if(flag){
		creaRepDiaDiv.css("display","block");
	}
	else{
		creaRepDiaDiv.css("display","none");
	}
}

function showCreaEChartDiaDiv(flag){
	var creaEChartDiaDiv=$("#crea_echart_dia_div");
	if(flag){
		var creaEChartDiaDiv=$("#crea_echart_dia_div");
		
		var textSpan=creaEChartDiaDiv.find("#tit_div").find("#text_span");
		textSpan.text("");
		
		var tabName=$("#rep_name_sel").val();
		if(tabName=="tab1"){
			textSpan.text("1#硝酸铵库房多孔粒状硝酸铵出入库登记簿");
		}
		else if(tabName=="tab2"){
			textSpan.text("2#硝酸铵库房多孔粒状硝酸铵出入库登记簿");
		}
		else if(tabName=="tab3"){
			textSpan.text("15-1醋酸出入库登记表_文档1");
		}
		else if(tabName=="tab4"){
			textSpan.text("15-1柠檬酸出入库登记表");
		}
		else if(tabName=="tab5"){
			textSpan.text("15-3国产油相出入库登记表_文档1");
		}
		else if(tabName=="tab6"){
			textSpan.text("15-4硫脲出入库登记表_文档1");
		}
		else if(tabName=="tab7"){
			textSpan.text("15-5碳酸钠出入库登记表_文档1");
		}
		else if(tabName=="tab8"){
			textSpan.text("15-6亚硝酸钠出入库登记表_文档1");
		}
		else if(tabName=="tab9"){
			textSpan.text("15-7乙二醇出入库登记表_文档1");
		}
		else if(tabName=="tab10"){
			textSpan.text("15-9添加剂出入库登记表");
		}
		
		creaEChartDiaDiv.css("display","block");
	}
	else{
		creaEChartDiaDiv.css("display","none");
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

.center_div{
	border-right:#EFEFEF solid 1px;
	overflow-y: auto;
}
.center_div .tool_bar{
	width:100%;
	margin-top: 20px;
}
.crea_echart_dia_div .tool_bar{
	width:100%;
	height:180px;
	line-height:180px;
}
.center_div .tool_bar .choose_area_sel_img{
	margin-top: 10px;
	margin-left: 85px;
	position: absolute;
}
.center_div .tool_bar .choose_area_sel{
	width: 500px;
	height: 70px;
	margin-left:80px;
	padding-left: 100px;
	font-size:25px; 
	background-color: #CECECE;
	border: #4F4F4F solid 1px;
	border-radius:10px;
}
.center_div .tool_bar .choose_rep_text_span,
.crea_echart_dia_div .tool_bar .choose_echart_text_span{
	color: #111;
	font-size: 30px;
	font-style:italic;
	margin-left:50px;
}
.center_div .tool_bar .rep_name_sel{
	width:1000px;
	height:70px;
	color: #999;
	font-size: 28px;
	margin-left:50px;
	background-color: #fff;
	border: #eee solid 1px;
}
.center_div .tool_bar .sear_but_div{
	width: 180px;
	height: 70px;
	line-height: 70px;
	margin-top:-70px;
	margin-left:1970px;
	color:#fff;
	font-size: 28px;
	text-align:center;
	letter-spacing:15px;
	background-color: #4095E5;
	border-radius:10px;
	cursor: pointer;
}
.crea_echart_dia_div .tool_bar .create_but{
	width: 180px;
	height: 50px;
	margin-left:50px;
	font-size: 35px;
}

.data_tab_div{
	width: 93%;
	margin: auto;
}
.data_tab_div .tab_name_div {
    width: 100%;
	height: 200px;
	line-height: 200px;
    font-size: 40px;
    text-align: center;
    font-weight: bold;
}
.data_tab_div table{
	width: 100%;
	border: 1px;
}
.data_tab_div table tr{
	height:80px;
}
.data_tab1 .tr2,
.data_tab2 .tr2,
.data_tab3 .tr2,
.data_tab4 .tr2,
.data_tab5 .tr2,
.data_tab6 .tr2,
.data_tab7 .tr2,
.data_tab8 .tr2,
.data_tab9 .tr2,
.data_tab10 .tr2{
	background-color: #fff;
}
.data_tab1 .tr3,
.data_tab2 .tr3,
.data_tab3 .tr3,
.data_tab4 .tr3,
.data_tab5 .tr3,
.data_tab6 .tr3,
.data_tab7 .tr3,
.data_tab8 .tr3,
.data_tab9 .tr3,
.data_tab10 .tr3{
	background-color: #F2F2F2;
}
.data_tab_div table tr th{
	color:#fff;
	font-size: 25px;
	text-align: center;
	background-color: #6C6C6C;
	border: #DBDBDB solid 1px;
}
.data_tab_div table tr td{
	font-size: 25px;
	text-align: center;
	border: #DBDBDB solid 1px;
}
.data_tab1 tr td,
.data_tab2 tr td{
	width: 16.6%;
}
.data_tab3 tr td,
.data_tab4 tr td,
.data_tab5 tr td,
.data_tab6 tr td,
.data_tab7 tr td,
.data_tab8 tr td,
.data_tab9 tr td,
.data_tab10 tr td{
	width: 10%;
	font-size: 25px;
	text-align: center;
}

.crea_rep_dia_div{
	width: 100%;
	height: 100%;
	position:fixed;
	z-index: 1;
	display: none;
}
.crea_rep_dia_div .tit_div .text_span,
.crea_echart_dia_div .tit_div .text_span{
	font-size:30px;
	margin-left: 2.5%;
}
.crea_rep_dia_div .tit_div .close_but_div{
	width: 150px;
	height: 50px;
	line-height: 50px;
	color:#686868;
	font-size:25px;
	text-align:center;
	margin-top: 20px;
	margin-right: 2.5%;
	float: right;
	border: #686868 solid 1px;
	border-radius:5px;
	cursor: pointer;
}
.crea_rep_dia_div .tool_bar{
	width: 20%;
	height: 100%;
	background-color: #E4EDF1;
	float: right;
}
.crea_rep_dia_div .tool_bar .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	margin-left:50px;
	font-size:30px;
	font-weight:bold;
}
.crea_rep_dia_div .crea_rep_div{
	width: 80%;
	height: 100%;
	background-color:#ccc;
}
.crea_rep_dia_div .crea_rep_div .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	border-bottom: #B7B7B7 solid 1px;
}
.crea_rep_dia_div .crea_rep_div .tab_div{
	width: 95%;
	height: 88%;
	margin:1% auto 0;
	background-color:#fff;
	border: #6092E7 solid 5px;
}
.crea_rep_dia_div .crea_rep_div .tab_div .name_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-size:30px;
	text-align:center;
	border-bottom: #B7B7B7 solid 1px;
}


.crea_echart_dia_div .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-weight:bold;
	text-align:center;
	border-bottom: #F3F3F3 solid 1px;
}
.crea_echart_dia_div .tit_div .close_span{
	color:#999;
	font-size:25px;
	margin-right: 20px;
	float: right;
	cursor: pointer;
}
.crea_echart_dia_div{
	width: 2000px;
	height: 1400px;
	margin:auto;
	top:150px;
	left:0;
	right:0;
	background-color:#fff;
	border:#347CAF solid 1px;
	position:absolute;
	z-index: 1;
	display: none;
}
.crea_echart_dia_div .tool_bar .echart_name_sel{
	width:200px;
	height:50px;
	color: #999;
	font-size: 25px;
	margin-left:50px;
	background-color: #fff;
	border: #eee solid 1px;	
}
.crea_echart_dia_div .bar_chart_div{
	width: 90%;
	height: 700px;
	margin:auto;
	display: none;
}
.crea_echart_dia_div .line_chart_div{
	width: 90%;
	height: 800px;
	margin:auto;
	display: none;
}
.crea_echart_dia_div .pie_chart_div{
	width: 600px;
	height: 500px;
	margin:auto;
	display: none;
}

.right_div{
	width:500px;
	margin-right:50px;
	float: right;
}
.right_div .filter_condition_div{
	width:100%;
	height:900px;
	background-color:#fff;
	border-radius:10px;
	border:#5DA4DF solid 1px;
	padding-top: 1px;
	display: none;
}
.right_div .filter_condition_div .title_div{
	width:100%;
	height:100px;
	line-height:100px;
	margin-top:-3px;
	margin-left:-3px;
	background-color: #BEBEBE;
	border: #6C6C6C solid 1px;
	border-radius:5px; 
}
.right_div .filter_condition_div .title_div .title_span{
	margin-left:60px;
	color:#101010;
	font-size:35px;
}
.right_div .filter_condition_div .title_div .title_img{
	margin-top: 20px;
	margin-right: 50px;
	float: right;
}
.right_div .filter_condition_div .cho_time_scope_div{
	width:80%;
	height:70px;
	line-height:70px;
	margin:30px auto 0;
	color:#666;
	font-size:35px;
	font-style:italic;
}
.right_div .filter_condition_div .date_div{
	margin-top:30px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.right_div .filter_condition_div .date_div input{
	width:80%;
	height:40px;
	color:#888;
	font-size:25px;
	border: #BBB solid 1px;
	border-radius:15px; 
}
.right_div .filter_condition_div .but_div,
.crea_rep_dia_div .tool_bar .but_div{
	width:80%;
	height:90px;
	line-height:90px;
	color:#fff;
	font-size:28px;
	text-align:center;
	border-radius:25px;
	cursor: pointer;
}
.crea_rep_dia_div .tool_bar .output_exc_but_div{
	margin:50px auto 0;
	background-color: #53CB72;
}
.right_div .filter_condition_div .screen_but_div{
	margin:50px auto 0;
	letter-spacing:15px;
	background-color: #53CB72;
}
.right_div .filter_condition_div .cre_rep_but_div,
.crea_rep_dia_div .tool_bar .print_rep_but_div{
	margin:80px auto 0;
	letter-spacing:15px;
	background-color: #4095E5;
}
.right_div .filter_condition_div .line_div{
	width:80%;
	height: 3px;
	margin:40px auto 0; 
	background-color: #CECECE;
}

.right_div .filter_condition_div .row_div{
	width:80%;
	height:70px;
	line-height:70px;
	margin:auto;
	color:#666;
	font-size:25px;
}
.right_div .filter_condition_div .time_row_div,
.right_div .filter_condition_div .no_row_div{
	margin-top:30px;
}
.right_div .filter_condition_div .row_div input{
	width: 30px;
	height: 30px;
	margin-top:20px;
	position: absolute;
}
.right_div .filter_condition_div .row_div .col_text_span{
	margin-left:50px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="crea_rep_dia_div" id="crea_rep_dia_div">
	<div class="tool_bar" id="tool_bar">
		<div class="tit_div">报表设置</div>
		<div class="but_div print_rep_but_div" onclick="printRep()">打印报表</div>
		<div class="but_div output_exc_but_div" onclick="exportExcel('tab2')">导出Excel</div>
	</div>
	<div class="crea_rep_div" id="crea_rep_div">
		<div class="tit_div" id="tit_div">
			<span class="text_span" id="text_span">报表预览</span>
			<div class="close_but_div" onclick="showCreaRepDiaDiv(false)">退出预览</div>
		</div>
		<div class="tab_div" id="tab_div">
			<div class="name_div" id="name_div"></div>
		</div>
	</div>
</div>

<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="center_div" id="center_div">
		<div class="tool_bar" id="tool_bar">
			<img class="choose_area_sel_img" alt="" src="<%=basePath %>resource/image/013.png">
			<select class="choose_area_sel">
				<option>选择仓库</option>
			</select>
			<span class="choose_rep_text_span">请选择库区报表:</span>
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
			<div class="sear_but_div" onclick="createDataTab()">查询</div>
		</div>
		<div class="data_tab_div" id="data_tab_div">
		</div>
	</div>
	<div class="right_div" id="right_div">
		<div class="filter_condition_div" id="data_tab1_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div time_row_div">
				<input type="checkbox" id="time_cb" checked="checked"/>
				<span class="col_text_span">时间</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库数量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库数量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="save_count_cb" checked="checked"/>
				<span class="col_text_span">库存数量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_cb" checked="checked"/>
				<span class="col_text_span">记录人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		
		<div class="filter_condition_div" id="data_tab2_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div time_row_div">
				<input type="checkbox" id="time_cb" checked="checked"/>
				<span class="col_text_span">时间</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库数量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库数量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="save_count_cb" checked="checked"/>
				<span class="col_text_span">库存数量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_cb" checked="checked"/>
				<span class="col_text_span">记录人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab3_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_rec_cb" checked="checked"/>
				<span class="col_text_span">出库记录</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_rec_cb" checked="checked"/>
				<span class="col_text_span">入库记录</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_goods_cb" checked="checked"/>
				<span class="col_text_span">出料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab4_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab5_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab6_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab7_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab8_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab9_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
		<div class="filter_condition_div" id="data_tab10_cond_div">
			<div class="title_div">
				<span class="title_span">过滤条件选择</span>
				<img class="title_img" alt="" src="<%=basePath %>resource/image/013.png">
			</div>
			<div class="row_div no_row_div">
				<input type="checkbox" id="no_cb" checked="checked"/>
				<span class="col_text_span">序号</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>
				<span class="col_text_span">出入库日期</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="out_count_cb" checked="checked"/>
				<span class="col_text_span">出库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="in_count_cb" checked="checked"/>
				<span class="col_text_span">入库量</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="total_cb" checked="checked"/>
				<span class="col_text_span">总库存</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="wh_master_cb" checked="checked"/>
				<span class="col_text_span">库房责任人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>
				<span class="col_text_span">班组长</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>
				<span class="col_text_span">领料人</span>
			</div>
			<div class="row_div">
				<input type="checkbox" id="memo_cb" checked="checked"/>
				<span class="col_text_span">备注</span>
			</div>
			<div class="cho_time_scope_div">选择时间范围:</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="date_div">
				<input type="date"/>
			</div>
			<div class="but_div screen_but_div">筛选</div>
			<div class="line_div"></div>
			<div class="but_div cre_rep_but_div" onclick="createReportTab()">生成报表</div>
			<div class="but_div screen_but_div" onclick="showCreaEChartDiaDiv(true)">生成图表</div>
		</div>
	</div>
	
	<div class="crea_echart_dia_div" id="crea_echart_dia_div">
		<div class="tit_div" id="tit_div">
			<span class="text_span" id="text_span"></span>
			<span class="close_span" onclick="showCreaEChartDiaDiv(false)">X</span>
		</div>
		<div class="tool_bar" id="tool_bar">
			<span class="choose_echart_text_span">请选择图表</span>
			<select class="echart_name_sel" id="echart_name_sel">
				<option value="bar">柱状图</option>
				<option value="line">折线图</option>
				<option value="pie">饼状图</option>
			</select>
			<input class="create_but" type="button" value="生成" onclick="createEChart()"/>
		</div>
		<div class="bar_chart_div" id="bar_chart_div">
		</div>
		<div class="line_chart_div" id="line_chart_div">
		</div>
		<div class="pie_chart_div" id="pie_chart_div">
		</div>
	</div>
</div>
</body>
</html>