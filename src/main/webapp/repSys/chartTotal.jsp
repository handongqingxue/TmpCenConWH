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
var repNameRadDivWidth;
var repNameRadDivHeight;
var toolBarDivHeight;
$(function(){
	initTopDivSize();
	initLeftDivSize();
	initToolBarDivSize();
	
	initRepNameRadDivSize();
	showRepNameRadDiv();
	
	initEChartDiv();
	createEChart();
	
	initDataTabDiv();
});

function initToolBarDivSize(){
	var toolBarDiv=$("#tool_bar");
	toolBarDiv.width(bodyWidth-leftNavDivWidth-200);
	toolBarDiv.css("margin-top",-leftNavDivHeight+20+"px");
	toolBarDiv.css("margin-left",leftNavDivWidth+50+"px");
	
	toolBarDivHeight=toolBarDiv.height();
}

function initRepNameRadDivSize(){
	var repNameRadDiv=$(".rep_name_rad_div");
	repNameRadDiv.height(leftNavDivHeight/2);
	repNameRadDivWidth=repNameRadDiv.width();
	repNameRadDivHeight=repNameRadDiv.height();
}

function initEChartDiv(){
	var barChartDiv=$("#bar_chart_div");
	barChartDiv.width(bodyWidth-leftNavDivWidth-repNameRadDivWidth-300);
	barChartDiv.height(repNameRadDivHeight);
	barChartDiv.css("margin-top","50px");
	barChartDiv.css("margin-left",leftNavDivWidth+120+"px");
	
	var barChartDivWidth=barChartDiv.width();
	var barChartDivHeight=barChartDiv.height();
	var barChartDivMT=barChartDiv.css("margin-top");
	var barChartDivML=barChartDiv.css("margin-left");
	
	var lineChartDiv=$("#line_chart_div");
	lineChartDiv.width(barChartDivWidth);
	lineChartDiv.height(repNameRadDivHeight);
	lineChartDiv.css("margin-top",barChartDivMT);
	lineChartDiv.css("margin-left",barChartDivML);
	
	var pieChartDiv=$("#pie_chart_div");
	pieChartDiv.width(barChartDivWidth);
	pieChartDiv.height(repNameRadDivHeight);
	pieChartDiv.css("margin-top",barChartDivMT);
	pieChartDiv.css("margin-left",barChartDivML);
}

function initDataTabDiv(){
	var barChartDiv=$("#bar_chart_div");
	var barChartDivML=barChartDiv.css("margin-left");
	barChartDivML=barChartDivML.substring(0,barChartDivML.length-2);
	
	var repNameRadDiv=$(".rep_name_rad_div");
	var repNameRadDivMR=repNameRadDiv.css("margin-right");
	repNameRadDivMR=repNameRadDivMR.substring(0,repNameRadDivMR.length-2);
	
	var dataTabDiv=$("#data_tab_div");
	dataTabDiv.width(bodyWidth-barChartDivML-repNameRadDivMR);
	dataTabDiv.height(leftNavDivHeight-toolBarDivHeight-repNameRadDivHeight-120);
	dataTabDiv.css("margin-left",barChartDivML+"px");
}

function showRepNameRadDiv(){
	$(".rep_name_rad_div").css("display","none");
	
	var repType=$("#rep_type_sel").val();
	if(repType=="in_out"){
		$("#in_out_rep_name_rad_div").css("display","block");
	}
}

function createEChart(){
	var chartDiv=$(".chart_div");
	chartDiv.css("display","none");
	
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

function createTabCellStr(flag,val){
	var str;
	if(flag=="th")
		str="<th>"+val+"</th>";
	else if(flag=="td")
		str="<td>"+val+"</td>";
	return str;
}

function createDataTab(){
	var tabName;
	var radios = document.getElementsByName('rep_name_rad');
	for(var i = 0; i < radios.length; i++) {
	   if(radios[i].checked){
	      var id=radios[i].id;
	      if(id.indexOf("_rad")!=-1){
	    	  tabName=id.substring(0,id.indexOf("_rad"));
	      }
	      break;
	   }
    }
	var dataTabDiv=$("#data_tab_div");
	dataTabDiv.empty();
	if(tabName=="tab1"){
		
		var titleArr=["时间","入库数量(吨)","出库数量(吨)","库存数量(吨)","记录人签字","备注"];
		var appendStr="<table class=\"data_tab1\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab2"){
		var titleArr=["时间","入库数量(吨)","出库数量(吨)","库存数量(吨)","记录人签字","备注"];
		var appendStr="<table class=\"data_tab2\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab3"){
		var titleArr=["序号","出库日期","出库数量(吨)","出库签名","入库日期","入库数量(吨)","入库签名","总库存(kg)","出料人","备注"];
		var appendStr="<table class=\"data_tab3\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab4"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<table class=\"data_tab4\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab5"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","领料人","班组长","备注"];
		var appendStr="<table class=\"data_tab5\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab6"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<table class=\"data_tab6\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab7"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","领料人","班组长","备注"];
		var appendStr="<table class=\"data_tab7\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab8"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<table class=\"data_tab7\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab9"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<table class=\"data_tab7\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
	}
	else if(tabName=="tab10"){
		var titleArr=["序号","出入库日期","出库量(kg)","入库量(kg)","总库存(kg)","库房责任人","班组长","领料人","备注"];
		var appendStr="<table class=\"data_tab7\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
		appendStr+="<tr class=\"tr1\">";
		for(var i=0;i<titleArr.length;i++){
			appendStr+=createTabCellStr("th",titleArr[i]);
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
			appendStr+="<tr class=\"tr"+(i%2==0?2:3)+"\">";
			var dataKeys=Object.keys(dataArr[i])
			for(var j=0;j<dataKeys.length;j++){
				appendStr+=createTabCellStr("td",dataArr[i][dataKeys[j]]);
			}
			appendStr+="</tr>";
		}
		
		appendStr+="</table>";
		
		dataTabDiv.append(appendStr);
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
.tool_bar .choose_echart_text_span,
.tool_bar .choose_date_text_span{
	color: #111;
	font-size: 30px;
	font-style:italic;
	margin-left:50px;
}
.tool_bar .rep_type_sel,
.tool_bar .echart_name_sel{
	width:500px;
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
	display: none;
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


.chart_div{
	border:#EFEFEF solid 1px;
	display: none;
}

.data_tab_div{
	margin-top:50px;
	overflow: auto;
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
		<select class="rep_type_sel" id="rep_type_sel" onchange="showRepNameRadDiv()">
			<option value="in_out">出入库表</option>
			<option value="month_total">月统计表</option>
		</select>
		
		<span class="choose_echart_text_span">请选择图表</span>
		<select class="echart_name_sel" id="echart_name_sel" onchange="createEChart()">
			<option value="bar">柱状图</option>
			<option value="line">折线图</option>
			<option value="pie">饼状图</option>
		</select>
		
		<span class="choose_date_text_span">请选择日期</span>
		<input class="date_inp start_time_inp" type="date"/>
		<span class="to_text_span">至</span>
		<input class="date_inp end_time_inp" type="date"/>
		<!-- 
		<input class="cre_echart_but" type="button" value="生成图表" onclick="createEChart()"/>
		 -->
		
		
	</div>
	
	<div class="rep_name_rad_div" id="in_out_rep_name_rad_div">
		<div class="item_div tab1_item_div">
			<input type="radio" id="tab1_rad" name="rep_name_rad" checked="checked" onclick="createDataTab()"/>
			<span class="name_span">1#硝酸铵库房多孔粒状硝酸铵出入库登记簿</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab2_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab3_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-1醋酸出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab4_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-1柠檬酸出入库登记表</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab5_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-3国产油相出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab6_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-4硫脲出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab7_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-5碳酸钠出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab8_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-6亚硝酸钠出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab9_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-7乙二醇出入库登记表_文档1</span>
		</div>
		<div class="item_div">
			<input type="radio" id="tab10_rad" name="rep_name_rad" onclick="createDataTab()"/>
			<span class="name_span">15-9添加剂出入库登记表</span>
		</div>
	</div>
	
	<div class="chart_div" id="bar_chart_div">
	</div>
	<div class="chart_div" id="line_chart_div">
	</div>
	<div class="chart_div" id="pie_chart_div">
	</div>
	
	<div class="data_tab_div" id="data_tab_div">
	</div>
</div>
</body>
</html>