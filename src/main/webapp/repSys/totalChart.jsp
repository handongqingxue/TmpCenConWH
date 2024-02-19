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

function createDataTab(tabName){
	if(tabName=="tab1"){
		var dataTab1=$("#data_tab1");
		dataTab1.empty();
		
		var timeCbChecked=$("#tool_bar1 #time_cb").prop("checked");
		var inCountCbChecked=$("#tool_bar1 #in_count_cb").prop("checked");
		var outCountCbChecked=$("#tool_bar1 #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#tool_bar1 #save_count_cb").prop("checked");
		var recCbChecked=$("#tool_bar1 #rec_cb").prop("checked");
		var memoCbChecked=$("#tool_bar1 #memo_cb").prop("checked");
		
		var appendStr="<tr class=\"tr1\">";
				if(timeCbChecked)
					appendStr+="<td>时间</td>";
				if(inCountCbChecked)
					appendStr+="<td>入库数量(吨)</td>";
				if(outCountCbChecked)
					appendStr+="<td>出库数量(吨)</td>";
				if(saveCountCbChecked)
					appendStr+="<td>库存数量(吨)</td>";
				if(recCbChecked)
					appendStr+="<td>记录人签字</td>";
				if(memoCbChecked)
					appendStr+="<td>备注</td>";
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
			appendStr+="<tr>";
				if(timeCbChecked)
					appendStr+="<td>"+dataArr[i].time+"</td>";
				if(inCountCbChecked)
					appendStr+="<td>"+dataArr[i].inCount+"</td>";
				if(outCountCbChecked)
					appendStr+="<td>"+dataArr[i].outCount+"</td>";
				if(saveCountCbChecked)
					appendStr+="<td>"+dataArr[i].saveCount+"</td>";
				if(recCbChecked)
					appendStr+="<td>"+dataArr[i].rec+"</td>";
				if(memoCbChecked)
					appendStr+="<td>"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		
		dataTab1.append(appendStr);
	}
	else if(tabName=="tab2"){
		var dataTab2=$("#data_tab2");
		dataTab2.empty();
		
		var timeCbChecked=$("#tool_bar2 #time_cb").prop("checked");
		var inCountCbChecked=$("#tool_bar2 #in_count_cb").prop("checked");
		var outCountCbChecked=$("#tool_bar2 #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#tool_bar2 #save_count_cb").prop("checked");
		var recCbChecked=$("#tool_bar2 #rec_cb").prop("checked");
		var memoCbChecked=$("#tool_bar2 #memo_cb").prop("checked");
		
		var appendStr="<tr class=\"tr1\">";
				if(timeCbChecked)
					appendStr+="<td>时间</td>";
				if(inCountCbChecked)
					appendStr+="<td>入库数量(吨)</td>";
				if(outCountCbChecked)
					appendStr+="<td>出库数量(吨)</td>";
				if(saveCountCbChecked)
					appendStr+="<td>库存数量(吨)</td>";
				if(recCbChecked)
					appendStr+="<td>记录人签字</td>";
				if(memoCbChecked)
					appendStr+="<td>备注</td>";
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
			appendStr+="<tr>";
				if(timeCbChecked)
					appendStr+="<td>"+dataArr[i].time+"</td>";
				if(inCountCbChecked)
					appendStr+="<td>"+dataArr[i].inCount+"</td>";
				if(outCountCbChecked)
					appendStr+="<td>"+dataArr[i].outCount+"</td>";
				if(saveCountCbChecked)
					appendStr+="<td>"+dataArr[i].saveCount+"</td>";
				if(recCbChecked)
					appendStr+="<td>"+dataArr[i].rec+"</td>";
				if(memoCbChecked)
					appendStr+="<td>"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		
		dataTab2.append(appendStr);
	}
	else if(tabName=="tab3"){
		var dataTab3=$("#data_tab3");
		dataTab3.empty();
		
		var noCbChecked=$("#tool_bar3 #no_cb").prop("checked");
		var outRecCbChecked=$("#tool_bar3 #out_rec_cb").prop("checked");
		var inRecCbChecked=$("#tool_bar3 #in_rec_cb").prop("checked");
		var totalCbChecked=$("#tool_bar3 #total_cb").prop("checked");
		var outGoodsCbChecked=$("#tool_bar3 #out_goods_cb").prop("checked");
		var memoCbChecked=$("#tool_bar3 #memo_cb").prop("checked");
		
		var appendStr="<tr class=\"tr1\">";
			if(noCbChecked)
				appendStr+="<td>序号</td>";
			if(outRecCbChecked){
				appendStr+="<td>出库日期</td>";
				appendStr+="<td>出库数量(吨)</td>";
				appendStr+="<td>出库签名</td>";
			}
			if(inRecCbChecked){
				appendStr+="<td>入库日期</td>";
				appendStr+="<td>入库数量(吨)</td>";
				appendStr+="<td>入库签名</td>";
			}
			if(totalCbChecked)
				appendStr+="<td>总库存(kg)</td>";
			if(outGoodsCbChecked)
				appendStr+="<td>出料人</td>";
			if(memoCbChecked)
				appendStr+="<td>备注</td>";
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
			appendStr+="<tr>";
			if(noCbChecked)
				appendStr+="<td>"+dataArr[i].no+"</td>";
			if(outRecCbChecked){
				appendStr+="<td>"+dataArr[i].outDate+"</td>";
				appendStr+="<td>"+dataArr[i].outCount+"</td>";
				appendStr+="<td>"+dataArr[i].outSign+"</td>";
			}
			if(inRecCbChecked){
				appendStr+="<td>"+dataArr[i].inDate+"</td>";
				appendStr+="<td>"+dataArr[i].inCount+"</td>";
				appendStr+="<td>"+dataArr[i].inSign+"</td>";
			}
			if(totalCbChecked)
				appendStr+="<td>"+dataArr[i].total+"</td>";
			if(outGoodsCbChecked)
				appendStr+="<td>"+dataArr[i].outGoods+"</td>";
			if(memoCbChecked)
				appendStr+="<td>"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}
		
		dataTab3.append(appendStr);
	}
	else if(tabName=="tab4"){
		var dataTab4=$("#data_tab4");
		dataTab4.empty();
		
		var noCbChecked=$("#tool_bar4 #no_cb").prop("checked");
		var outInDateCbChecked=$("#tool_bar4 #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#tool_bar4 #out_count_cb").prop("checked");
		var inCountCbChecked=$("#tool_bar4 #in_count_cb").prop("checked");
		var totalCbChecked=$("#tool_bar4 #total_cb").prop("checked");
		var whMasterCbChecked=$("#tool_bar4 #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#tool_bar4 #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#tool_bar4 #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#tool_bar4 #memo_cb").prop("checked");

		var appendStr="<tr class=\"tr1\">";
			if(noCbChecked)
				appendStr+="<td>序号</td>";
			if(outInDateCbChecked)
				appendStr+="<td>出入库日期</td>";
			if(outCountCbChecked)
				appendStr+="<td>出库量(kg)</td>";
			if(inCountCbChecked)
				appendStr+="<td>入库量(kg)</td>";
			if(totalCbChecked)
				appendStr+="<td>总库存(kg)</td>";
			if(whMasterCbChecked)
				appendStr+="<td>库房责任人</td>";
			if(groLeaCbChecked)
				appendStr+="<td>班组长</td>";
			if(recGoodsCbChecked)
				appendStr+="<td>领料人</td>";
			if(memoCbChecked)
				appendStr+="<td>备注</td>";
			appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",groLea:"天赐",recGoods:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr>";
			if(noCbChecked)
				appendStr+="<td>"+dataArr[i].no+"</td>";
			if(outInDateCbChecked)
				appendStr+="<td>"+dataArr[i].outInDate+"</td>";
			if(outCountCbChecked)
				appendStr+="<td>"+dataArr[i].outCount+"</td>";
			if(inCountCbChecked)
				appendStr+="<td>"+dataArr[i].inCount+"</td>";
			if(totalCbChecked)
				appendStr+="<td>"+dataArr[i].total+"</td>";
			if(whMasterCbChecked)
				appendStr+="<td>"+dataArr[i].whMaster+"</td>";
			if(groLeaCbChecked)
				appendStr+="<td>"+dataArr[i].groLea+"</td>";
			if(recGoodsCbChecked)
				appendStr+="<td>"+dataArr[i].recGoods+"</td>";
			if(memoCbChecked)
				appendStr+="<td>"+dataArr[i].memo+"</td>";
			appendStr+="</tr>";
		}

		dataTab4.append(appendStr);
	}
}

function createReportTab(tabName){
	if(tabName=="tab1"){
		var tab1=$("#tab1");
		tab1.empty();
		
		var timeCbChecked=$("#tool_bar1 #time_cb").prop("checked");
		var inCountCbChecked=$("#tool_bar1 #in_count_cb").prop("checked");
		var outCountCbChecked=$("#tool_bar1 #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#tool_bar1 #save_count_cb").prop("checked");
		var recCbChecked=$("#tool_bar1 #rec_cb").prop("checked");
		var memoCbChecked=$("#tool_bar1 #memo_cb").prop("checked");
		
		var appendStr="<tr style=\"height: 70px;\">";
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
		
		tab1.append(appendStr);
	}
	else if(tabName=="tab2"){
		var tab2=$("#tab2");
		tab2.empty();
		
		var timeCbChecked=$("#tool_bar2 #time_cb").prop("checked");
		var inCountCbChecked=$("#tool_bar2 #in_count_cb").prop("checked");
		var outCountCbChecked=$("#tool_bar2 #out_count_cb").prop("checked");
		var saveCountCbChecked=$("#tool_bar2 #save_count_cb").prop("checked");
		var recCbChecked=$("#tool_bar2 #rec_cb").prop("checked");
		var memoCbChecked=$("#tool_bar2 #memo_cb").prop("checked");
		
		var appendStr="<tr style=\"height: 70px;\">";
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
		
		tab2.append(appendStr);
	}
	else if(tabName=="tab3"){
		var tab3=$("#tab3");
		tab3.empty();
		
		var noCbChecked=$("#tool_bar3 #no_cb").prop("checked");
		var outRecCbChecked=$("#tool_bar3 #out_rec_cb").prop("checked");
		var inRecCbChecked=$("#tool_bar3 #in_rec_cb").prop("checked");
		var totalCbChecked=$("#tool_bar3 #total_cb").prop("checked");
		var outGoodsCbChecked=$("#tool_bar3 #out_goods_cb").prop("checked");
		var memoCbChecked=$("#tool_bar3 #memo_cb").prop("checked");
		
		var appendStr="<tr style=\"height: 70px;\">";
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
		
		tab3.append(appendStr);
	}
	else if(tabName=="tab4"){
		var tab4=$("#tab4");
		tab4.empty();
		
		var noCbChecked=$("#tool_bar4 #no_cb").prop("checked");
		var outInDateCbChecked=$("#tool_bar4 #out_in_date_cb").prop("checked");
		var outCountCbChecked=$("#tool_bar4 #out_count_cb").prop("checked");
		var inCountCbChecked=$("#tool_bar4 #in_count_cb").prop("checked");
		var totalCbChecked=$("#tool_bar4 #total_cb").prop("checked");
		var whMasterCbChecked=$("#tool_bar4 #wh_master_cb").prop("checked");
		var groLeaCbChecked=$("#tool_bar4 #gro_lea_cb").prop("checked");
		var recGoodsCbChecked=$("#tool_bar4 #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#tool_bar4 #memo_cb").prop("checked");

		var appendStr="<tr style=\"height: 120px;\">";
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
		
		tab4.append(appendStr);
	}
}

function exportExcel(tabName){
	alert(tabName)
	var table = $("#"+tabName);
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
    	fileName="制药车间化工原料（醋 酸）出入库登记表";
    }
    else if(tabName=="tab4"){
    	fileName="制药车间化工原料出入库登记表";
    }
    var a = document.createElement("a");
    a.download = fileName+".xlsx";
    a.href = link;
    a.click();
}

function base64 (content) {
    return window.btoa(unescape(encodeURIComponent(content)));
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
	margin-top:-3575px;
	margin-right:-1550px;
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
	margin-top: 50px;
	/* display: none; */
}
.tab1_div .name_div,
.tab2_div .name_div{
	font-size:35px;
	text-align: center;
}
.data_tab1,
.data_tab2,
.data_tab3,
.data_tab4,
.tab1,
.tab2,
.tab3,
.tab4,
.tab5,
.tab6,
.tab7,
.tab8,
.tab9,
.tab10,
.tab11{
	width: 100%;
	border: 1px;
}
.data_tab1 tr td,
.data_tab2 tr td,
.tab1 tr td,
.tab2 tr td{
	width: 16.6%;
	text-align: center;
}
.data_tab3 tr td,
.data_tab4 tr td{
	width: 10%;
	text-align: center;
}
.data_tab1 .tr1,
.data_tab2 .tr1,
.data_tab3 .tr1,
.data_tab4 .tr1,
.tab1 .tr1,
.tab2 .tr1{
	height:70px;
}
.tab1 .tr2,
.tab2 .tr2{
	height:80px;
}
.data_tab1 tr td,
.data_tab2 tr td,
.data_tab3 tr td,
.data_tab4 tr td,
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
	margin-top: 100px;
	/* display: none; */
}
.tab3_div .name_div{
	font-size:35px;
	text-align: center;
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

.tab4_div,
.tab5_div,
.tab6_div,
.tab7_div,
.tab8_div,
.tab9_div{
	width: 2000px;
	/* display: none; */
}
.tab4_div .name_div,
.tab5_div .name_div,
.tab6_div .name_div,
.tab7_div .name_div,
.tab8_div .name_div,
.tab9_div .name_div{
	font-size:35px;
	text-align: center;
}

.tab1_div .tool_bar,
.tab2_div .tool_bar,
.tab3_div .tool_bar,
.tab4_div .tool_bar{
	font-size: 35px;
}
.tab1_div .tool_bar input,
.tab2_div .tool_bar input,
.tab3_div .tool_bar input,
.tab4_div .tool_bar input{
	width: 30px;
	height: 30px;
}
.tab1_div .tool_bar .sear_but,
.tab2_div .tool_bar .sear_but,
.tab3_div .tool_bar .sear_but,
.tab4_div .tool_bar .sear_but{
	width: 100px;
	height: 50px;
	font-size: 35px;
}
.tab1_div .tool_bar .report_but,
.tab1_div .output_exc_but,
.tab2_div .tool_bar .report_but,
.tab2_div .output_exc_but,
.tab3_div .tool_bar .report_but,
.tab3_div .output_exc_but,
.tab4_div .tool_bar .report_but,
.tab4_div .output_exc_but{
	width: 180px;
	height: 50px;
	font-size: 35px;
}

.tab4_div .ylmc_div,
.tab5_div .ylmc_div,
.tab6_div .ylmc_div,
.tab7_div .ylmc_div,
.tab8_div .ylmc_div,
.tab9_div .ylmc_div{
	height: 70px;
}
.tab4_div .ylmc_div .ylmc_span,
.tab5_div .ylmc_div .ylmc_span,
.tab6_div .ylmc_div .ylmc_span,
.tab7_div .ylmc_div .ylmc_span,
.tab8_div .ylmc_div .ylmc_span,
.tab9_div .ylmc_div .ylmc_span{
	font-size:35px;
}
.tab4_div .ylmc_div .nf_span,
.tab5_div .ylmc_div .nf_span,
.tab6_div .ylmc_div .nf_span,
.tab7_div .ylmc_div .nf_span,
.tab8_div .ylmc_div .nf_span,
.tab9_div .ylmc_div .nf_span{
	font-size:35px;
	float: right;
}
.tab4 tr td,
.tab5 tr td,
.tab6 tr td,
.tab7 tr td,
.tab8 tr td,
.tab9 tr td{
	text-align: center;
}
.tab4 .tr1,
.tab5 .tr1,
.tab6 .tr1,
.tab7 .tr1,
.tab8 .tr1,
.tab9 .tr1{
	height:120px;
}
.tab4 .tr1 .td1,
.tab4 .tr2 .td1,
.tab5 .tr1 .td1,
.tab5 .tr2 .td1,
.tab6 .tr1 .td1,
.tab6 .tr2 .td1,
.tab7 .tr1 .td1,
.tab7 .tr2 .td1,
.tab8 .tr1 .td1,
.tab8 .tr2 .td1,
.tab9 .tr1 .td1,
.tab9 .tr2 .td1{
	width: 5%;
	font-size: 30px;
}
.tab4 .tr1 .td2,
.tab4 .tr1 .td3,
.tab4 .tr1 .td4,
.tab4 .tr1 .td5,
.tab4 .tr1 .td6,
.tab4 .tr1 .td7,
.tab4 .tr1 .td8,
.tab4 .tr1 .td9,
.tab4 .tr2 .td2,
.tab4 .tr2 .td3,
.tab4 .tr2 .td4,
.tab4 .tr2 .td5,
.tab4 .tr2 .td6,
.tab4 .tr2 .td7,
.tab4 .tr2 .td8,
.tab4 .tr2 .td9,
.tab5 .tr1 .td2,
.tab5 .tr1 .td3,
.tab5 .tr1 .td4,
.tab5 .tr1 .td5,
.tab5 .tr1 .td6,
.tab5 .tr1 .td7,
.tab5 .tr1 .td8,
.tab5 .tr1 .td9,
.tab5 .tr2 .td2,
.tab5 .tr2 .td3,
.tab5 .tr2 .td4,
.tab5 .tr2 .td5,
.tab5 .tr2 .td6,
.tab5 .tr2 .td7,
.tab5 .tr2 .td8,
.tab5 .tr2 .td9,
.tab6 .tr1 .td2,
.tab6 .tr1 .td3,
.tab6 .tr1 .td4,
.tab6 .tr1 .td5,
.tab6 .tr1 .td6,
.tab6 .tr1 .td7,
.tab6 .tr1 .td8,
.tab6 .tr1 .td9,
.tab6 .tr2 .td2,
.tab6 .tr2 .td3,
.tab6 .tr2 .td4,
.tab6 .tr2 .td5,
.tab6 .tr2 .td6,
.tab6 .tr2 .td7,
.tab6 .tr2 .td8,
.tab6 .tr2 .td9,
.tab7 .tr1 .td2,
.tab7 .tr1 .td3,
.tab7 .tr1 .td4,
.tab7 .tr1 .td5,
.tab7 .tr1 .td6,
.tab7 .tr1 .td7,
.tab7 .tr1 .td8,
.tab7 .tr1 .td9,
.tab7 .tr2 .td2,
.tab7 .tr2 .td3,
.tab7 .tr2 .td4,
.tab7 .tr2 .td5,
.tab7 .tr2 .td6,
.tab7 .tr2 .td7,
.tab7 .tr2 .td8,
.tab7 .tr2 .td9,
.tab8 .tr1 .td2,
.tab8 .tr1 .td3,
.tab8 .tr1 .td4,
.tab8 .tr1 .td5,
.tab8 .tr1 .td6,
.tab8 .tr1 .td7,
.tab8 .tr1 .td8,
.tab8 .tr1 .td9,
.tab8 .tr2 .td2,
.tab8 .tr2 .td3,
.tab8 .tr2 .td4,
.tab8 .tr2 .td5,
.tab8 .tr2 .td6,
.tab8 .tr2 .td7,
.tab8 .tr2 .td8,
.tab8 .tr2 .td9,
.tab9 .tr1 .td2,
.tab9 .tr1 .td3,
.tab9 .tr1 .td4,
.tab9 .tr1 .td5,
.tab9 .tr1 .td6,
.tab9 .tr1 .td7,
.tab9 .tr1 .td8,
.tab9 .tr1 .td9,
.tab9 .tr2 .td2,
.tab9 .tr2 .td3,
.tab9 .tr2 .td4,
.tab9 .tr2 .td5,
.tab9 .tr2 .td6,
.tab9 .tr2 .td7,
.tab9 .tr2 .td8,
.tab9 .tr2 .td9{
	width: 10%;
	font-size: 30px;
}
.tab4 .tr2,
.tab5 .tr2,
.tab6 .tr2,
.tab7 .tr2,
.tab8 .tr2,
.tab9 .tr2{
	height:80px;
}

.tab10_div{
	width: 1000px;
	display: none;
}
.tab10_div .name_div{
	font-size:35px;
	text-align: center;
}
.tab10_div .lotNo_div{
	width: 200px;
	font-size:25px;
	float: right;
}
.tab10_div .date_div,
.tab10_div .temp_div,
.tab10_div .free_point_div,
.tab10_div .oper_sign_div,
.tab10_div .mon_sign_div{
	width: 200px;
	margin-top: 80px;
	font-size:25px;
}
.tab10_div .operator_div{
	width: 200px;
	font-size:25px;
	float: right;
}
.tab10 tr td{
	width: 33%;
	height:120px;
	font-size:30px;
	text-align: center;
}

.tab11_div{
	width: 1500px;
	display: none;
}
.tab11_div .name_div{
	font-size:35px;
	text-align: center;
}
.tab11 .tr1,
.tab11 .tr2{
	height:90px;
}
.tab11 .tr1 .td1,
.tab11 .tr1 .td3,
.tab11 .tr2 .td1,
.tab11 .tr3 .td1,
.tab11 .tr4 .td1,
.tab11 .tr4 .td3,
.tab11 .tr5 .td2,
.tab11 .tr6 .td1,
.tab11 .tr6 .td3,
.tab11 .tr9 .td1,
.tab11 .tr10 .td1,
.tab11 .tr10 .td3,
.tab11 .tr11 .td1{
	width: 20%;
	font-size: 30px;
	text-align: center;
}
.tab11 .tr1 .td2,
.tab11 .tr1 .td4,
.tab11 .tr4 .td2,
.tab11 .tr4 .td4,
.tab11 .tr5 .td1,
.tab11 .tr5 .td3{
	width: 30%;
	font-size: 30px;
	text-align: center;
}
.tab11 .tr2 .td2,
.tab11 .tr9 .td2,
.tab11 .tr11 .td2{
	width: 80%;
	font-size: 30px;
}
.tab11 .tr3,
.tab11 .tr11{
	height:180px;
}
.tab11 .tr4,
.tab11 .tr5,
.tab11 .tr6,
.tab11 .tr7,
.tab11 .tr8{
	height:70px;
}
.tab11 .tr6 .td2,
.tab11 .tr7 .td1,
.tab11 .tr8 .td1{
	width: 60%;
	font-size: 30px;
}
.tab11 .tr9,
.tab11 .tr10{
	height:140px;
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
			
			<div class="tool_bar" id="tool_bar1">
				显示列:
				<input type="checkbox" id="time_cb" checked="checked"/>时间
				<input type="checkbox" id="in_count_cb" checked="checked"/>入库数量
				<input type="checkbox" id="out_count_cb" checked="checked"/>出库数量
				<input type="checkbox" id="save_count_cb" checked="checked"/>库存数量
				<input type="checkbox" id="rec_cb" checked="checked"/>记录人
				<input type="checkbox" id="memo_cb" checked="checked"/>备注
				<input class="sear_but" type="button" value="查询" onclick="createDataTab('tab1')"/>
				<input class="report_but" type="button" value="生成报表" onclick="createReportTab('tab1')"/>
			</div>
			
			<table class="data_tab1" id="data_tab1" border="1" cellspacing="0">
				<!-- 
				<tr class="tr1">
					<td>时间</td>
					<td>入库数量(吨)</td>
					<td>出库数量(吨)</td>
					<td>库存数量(吨)</td>
					<td>记录人签字</td>
					<td>备注</td>
				</tr>
				<tr>
					<td>2024年1月23日</td>
					<td>11</td>
					<td>11</td>
					<td>11</td>
					<td>天赐</td>
					<td>李天亯</td>
				</tr>
				<tr>
					<td>2024年1月24日</td>
					<td>11</td>
					<td>11</td>
					<td>11</td>
					<td>天赐</td>
					<td>李天亯</td>
				</tr>
				<tr>
					<td>2024年1月25日</td>
					<td>11</td>
					<td>11</td>
					<td>11</td>
					<td>天赐</td>
					<td>李天亯</td>
				</tr>
				 -->
			</table>
			
			<input class="output_exc_but" type="button" value="导出Excel" onclick="exportExcel('tab1')"/>
			
			<!-- 
			<table class="tab1" id="tab1" border="1" cellspacing="0">
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
			 -->
			
			<table id="tab1" style="width: 100%;border: 1px;" border="1" cellspacing="0">
				<!-- 
				<tr style="height: 70px;">
					<td style="width: 16.6%;font-size: 25px;text-align: center;" rowspan="2">时间</td>
					<td style="width: 16.6%;font-size: 35px;text-align: center;">入库</td>
					<td style="width: 16.6%;font-size: 35px;text-align: center;">出库</td>
					<td style="width: 16.6%;font-size: 35px;text-align: center;">库存</td>
					<td style="width: 16.6%;font-size: 25px;text-align: center;" rowspan="2">记录人签字</td>
					<td style="width: 16.6%;font-size: 35px;text-align: center;" rowspan="2">备注</td>
				</tr>
				<tr style="height: 80px;">
					<td style="width: 16.6%;font-size: 35px;text-align: center;">数量(吨)</td>
					<td style="width: 16.6%;font-size: 35px;text-align: center;">数量(吨)</td>
					<td style="width: 16.6%;font-size: 35px;text-align: center;">数量(吨)</td>
				</tr>
				<tr style="height: 60px;">
					<td style="width: 16.6%;font-size: 28px;text-align: center;">2024年1月23日</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">天赐</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">李天亯</td>
				</tr>
				<tr style="height: 60px;">
					<td style="width: 16.6%;font-size: 28px;text-align: center;">2024年1月24日</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">天赐</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">李天亯</td>
				</tr>
				<tr style="height: 60px;">
					<td style="width: 16.6%;font-size: 28px;text-align: center;">2024年1月25日</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">天赐</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">李天亯</td>
				</tr>
				<tr style="height: 60px;">
					<td style="width: 16.6%;font-size: 28px;text-align: center;">2024年1月26日</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">11</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">天赐</td>
					<td style="width: 16.6%;font-size: 28px;text-align: center;">李天亯</td>
				</tr>
				 -->
			</table>
		</div>
		
		<div class="tab2_div" id="tab2_div">
			<div class="name_div">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>
			
			<div class="tool_bar" id="tool_bar2">
				显示列:
				<input type="checkbox" id="time_cb" checked="checked"/>时间
				<input type="checkbox" id="in_count_cb" checked="checked"/>入库数量
				<input type="checkbox" id="out_count_cb" checked="checked"/>出库数量
				<input type="checkbox" id="save_count_cb" checked="checked"/>库存数量
				<input type="checkbox" id="rec_cb" checked="checked"/>记录人
				<input type="checkbox" id="memo_cb" checked="checked"/>备注
				<input class="sear_but" type="button" value="查询" onclick="createDataTab('tab2')"/>
				<input class="report_but" type="button" value="生成报表" onclick="createReportTab('tab2')"/>
			</div>
			
			<table class="data_tab2" id="data_tab2" border="1" cellspacing="0">
			</table>
			
			<input class="output_exc_but" type="button" value="导出Excel" onclick="exportExcel('tab2')"/>
			
			<table class="tab2" id="tab2" border="1" cellspacing="0">
				<!-- 
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
				 -->
			</table>
		</div>
		
		<div class="tab3_div" id="tab3_div">
			<div class="name_div">制药车间化工原料（醋 酸）出入库登记表</div>
			
			<div class="tool_bar" id="tool_bar3">
				显示列:
				<input type="checkbox" id="no_cb" checked="checked"/>序号
				<input type="checkbox" id="out_rec_cb" checked="checked"/>出库记录
				<input type="checkbox" id="in_rec_cb" checked="checked"/>入库记录
				<input type="checkbox" id="total_cb" checked="checked"/>总库存
				<input type="checkbox" id="out_goods_cb" checked="checked"/>出料人
				<input type="checkbox" id="memo_cb" checked="checked"/>备注
				<input class="sear_but" type="button" value="查询" onclick="createDataTab('tab3')"/>
				<input class="report_but" type="button" value="生成报表" onclick="createReportTab('tab3')"/>
			</div>
			
			<table class="data_tab3" id="data_tab3" border="1" cellspacing="0">
			</table>
			
			<input class="output_exc_but" type="button" value="导出Excel" onclick="exportExcel('tab3')"/>
			
			<!-- 
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
			 -->
			
			<table id="tab3" style="width:100%;border: 1px;" border="1" cellspacing="0">
				<!-- 
				<tr style="height: 70px;">
					<td style="width: 7%;font-size: 25px;text-align: center;" rowspan="2">序号</td>
					<td style="width: 21%;font-size: 25px;text-align: center;" colspan="3">出库记录</td>
					<td style="width: 21%;font-size: 25px;text-align: center;" colspan="3">入库记录</td>
					<td style="width: 15%;font-size: 25px;text-align: center;" rowspan="2">总库存(kg)</td>
					<td style="width: 15%;font-size: 25px;text-align: center;" rowspan="2">出料人</td>
					<td style="width: 15%;font-size: 25px;text-align: center;" rowspan="2">备注</td>
				</tr>
				<tr style="height: 80px;">
					<td style="width: 7%;font-size: 25px;text-align: center;">日期</td>
					<td style="width: 7%;font-size: 25px;text-align: center;">数量(kg)</td>
					<td style="width: 7%;font-size: 25px;text-align: center;">签名</td>
					<td style="width: 7%;font-size: 25px;text-align: center;">日期</td>
					<td style="width: 7%;font-size: 25px;text-align: center;">数量(kg)</td>
					<td style="width: 7%;font-size: 25px;text-align: center;">签名</td>
				</tr>
				<tr style="height: 70px;">
					<td style="font-size: 25px;text-align: center;">1</td>
					<td style="font-size: 25px;text-align: center;">100</td>
					<td style="font-size: 25px;text-align: center;">1</td>
					<td style="font-size: 25px;text-align: center;">1</td>
					<td style="font-size: 25px;text-align: center;">10</td>
					<td style="font-size: 25px;text-align: center;">10</td>
					<td style="font-size: 25px;text-align: center;">1</td>
					<td style="font-size: 25px;text-align: center;">1</td>
					<td style="font-size: 25px;text-align: center;">10</td>
					<td style="font-size: 25px;text-align: center;">10</td>
				</tr>
				 -->
			</table>
		</div>
		
		<div class="tab4_div" id="tab4_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：柠檬酸</span>
				<span class="nf_span">年份： 2024</span>
			</div>
			
			<div class="tool_bar" id="tool_bar4">
				显示列:
				<input type="checkbox" id="no_cb" checked="checked"/>序号
				<input type="checkbox" id="out_in_date_cb" checked="checked"/>出入库日期
				<input type="checkbox" id="out_count_cb" checked="checked"/>出库量
				<input type="checkbox" id="in_count_cb" checked="checked"/>入库量
				<input type="checkbox" id="total_cb" checked="checked"/>总库存
				<input type="checkbox" id="wh_master_cb" checked="checked"/>库房责任人
				<input type="checkbox" id="gro_lea_cb" checked="checked"/>班组长
				<input type="checkbox" id="rec_goods_cb" checked="checked"/>领料人
				<input type="checkbox" id="memo_cb" checked="checked"/>备注
				<input class="sear_but" type="button" value="查询" onclick="createDataTab('tab4')"/>
				<input class="report_but" type="button" value="生成报表" onclick="createReportTab('tab4')"/>
			</div>
			
			<table class="data_tab4" id="data_tab4" border="1" cellspacing="0">
			</table>
			
			<input class="output_exc_but" type="button" value="导出Excel" onclick="exportExcel('tab4')"/>
			
			<!-- 
			<table class="tab4" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">序号</td>
					<td class="td2">出入库日期</td>
					<td class="td3">出库量(kg)</td>
					<td class="td4">入库量(kg)</td>
					<td class="td5">总库存(kg)</td>
					<td class="td6">库房责任人</td>
					<td class="td7">班组长</td>
					<td class="td8">领料人</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">1</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">2</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">3</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
			</table>
			 -->
			<table id="tab4" style="width: 100%;border: 1px;" border="1" cellspacing="0">
			</table>
		</div>
		
		<div class="tab5_div" id="tab5_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：国产油相</span>
				<span class="nf_span">年份： 2024</span>
			</div>
			<table class="tab5" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">序号</td>
					<td class="td2">出入库日期</td>
					<td class="td3">出库量(kg)</td>
					<td class="td4">入库量(kg)</td>
					<td class="td5">总库存(kg)</td>
					<td class="td6">库房责任人</td>
					<td class="td7">领料人</td>
					<td class="td8">班组长</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">1</td>
					<td class="td2"></td>
					<td class="td3">875</td>
					<td class="td4">875</td>
					<td class="td5">875</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">2</td>
					<td class="td2"></td>
					<td class="td3">875</td>
					<td class="td4">875</td>
					<td class="td5">875</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">3</td>
					<td class="td2"></td>
					<td class="td3">875</td>
					<td class="td4">875</td>
					<td class="td5">875</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
			</table>
		</div>
		
		<div class="tab6_div" id="tab6_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：硫脲</span>
				<span class="nf_span">年份： 2024</span>
			</div>
			<table class="tab6" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">序号</td>
					<td class="td2">出入库日期</td>
					<td class="td3">出库量(kg)</td>
					<td class="td4">入库量(kg)</td>
					<td class="td5">总库存(kg)</td>
					<td class="td6">库房责任人</td>
					<td class="td7">班组长</td>
					<td class="td8">领料人</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">1</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">2</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">3</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
			</table>
		</div>
		
		<div class="tab7_div" id="tab7_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：碳酸钠</span>
				<span class="nf_span">年份： 2024</span>
			</div>
			<table class="tab7" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">序号</td>
					<td class="td2">出入库日期</td>
					<td class="td3">出库量(kg)</td>
					<td class="td4">入库量(kg)</td>
					<td class="td5">总库存(kg)</td>
					<td class="td6">库房责任人</td>
					<td class="td7">领料人</td>
					<td class="td8">班组长</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">1</td>
					<td class="td2"></td>
					<td class="td3">875</td>
					<td class="td4">875</td>
					<td class="td5">875</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">2</td>
					<td class="td2"></td>
					<td class="td3">875</td>
					<td class="td4">875</td>
					<td class="td5">875</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">3</td>
					<td class="td2"></td>
					<td class="td3">875</td>
					<td class="td4">875</td>
					<td class="td5">875</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
			</table>
		</div>
		
		<div class="tab8_div" id="tab8_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：乙二醇</span>
				<span class="nf_span">年份： 2022</span>
			</div>
			<table class="tab8" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">序号</td>
					<td class="td2">出入库日期</td>
					<td class="td3">出库量(kg)</td>
					<td class="td4">入库量(kg)</td>
					<td class="td5">总库存(kg)</td>
					<td class="td6">库房责任人</td>
					<td class="td7">班组长</td>
					<td class="td8">领料人</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">1</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">2</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">3</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
			</table>
		</div>
		
		<div class="tab9_div" id="tab9_div">
			<div class="name_div">制药车间化工原料出入库登记表</div>
			<div class="ylmc_div">
				<span class="ylmc_span">原料名称：添加剂</span>
				<span class="nf_span">年份： 2022</span>
			</div>
			<table class="tab9" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">序号</td>
					<td class="td2">出入库日期</td>
					<td class="td3">出库量(kg)</td>
					<td class="td4">入库量(kg)</td>
					<td class="td5">总库存(kg)</td>
					<td class="td6">库房责任人</td>
					<td class="td7">班组长</td>
					<td class="td8">领料人</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">1</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">2</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
				<tr class="tr2">
					<td class="td1">3</td>
					<td class="td2"></td>
					<td class="td3">25</td>
					<td class="td4">25</td>
					<td class="td5">25</td>
					<td class="td6">天赐</td>
					<td class="td7">天赐</td>
					<td class="td8">天赐</td>
					<td class="td9">备注</td>
				</tr>
			</table>
		</div>
		
		<div class="tab10_div" id="tab10_div">
			<div class="name_div">添加剂制备记录</div>
			<div class="lotNo_div">批次序号:</div>
			<div class="date_div">日期:</div>
			<div class="operator_div">操作工:</div>
			<table class="tab10" border="1" cellspacing="0">
				<tr>
					<td>成分</td>
					<td>标准(kg)</td>
					<td>加入量(kg)</td>
				</tr>
				<tr>
					<td>添加剂</td>
					<td>100-3000</td>
					<td></td>
				</tr>
				<tr>
					<td>水</td>
					<td>300-9000</td>
					<td></td>
				</tr>
				<tr>
					<td>乙二醇</td>
					<td>300-9000</td>
					<td></td>
				</tr>
				<tr>
					<td>总计</td>
					<td>12000</td>
					<td></td>
				</tr>
			</table>
			<div class="temp_div">当天气温：</div>
			<div class="free_point_div">冰点（℃）：</div>
			<div class="oper_sign_div">操作工签字：</div>
			<div class="mon_sign_div">班组长签字：</div>
		</div>
		
		<div class="tab11_div" id="tab11_div">
			<div class="name_div">制药车间废矿物油到货验收确认单</div>
			<table class="tab11" border="1" cellspacing="0">
				<tr class="tr1">
					<td class="td1">接收日期</td>
					<td class="td2"></td>
					<td class="td3">运输车辆车牌号</td>
					<td class="td4" colspan="2"></td>
				</tr>
				<tr class="tr2">
					<td class="td1">产生单位</td>
					<td class="td2" colspan="4"></td>
				</tr>
				<tr class="tr3">
					<td class="td1">物资类别	</td>
					<td class="td2" colspan="4"></td>
				</tr>
				<tr class="tr4">
					<td class="td1" rowspan="2">到货重量(kg)</td>
					<td class="td2">毛重</td>
					<td class="td3">皮重</td>
					<td class="td4" colspan="2">净重</td>
				</tr>
				<tr class="tr5">
					<td class="td1">11kg</td>
					<td class="td2">11kg</td>
					<td class="td3" colspan="2">11kg</td>
				</tr>
				<tr class="tr6">
					<td class="td1" rowspan="3">验收内容</td>
					<td class="td2" colspan="3">1.包装无破损，无跑冒滴漏现象；</td>
					<td class="td3"></td>
				</tr>
				<tr class="tr7">
					<td class="td1" colspan="3">2.到货废物矿油是否为废机油、液压油、废柴油；</td>
					<td></td>
				</tr>
				<tr class="tr8">
					<td class="td1" colspan="3">3.废机油、液压油、废柴油无杂物；</td>
					<td></td>
				</tr>
				<tr class="tr9">
					<td class="td1">验收意见</td>
					<td class="td2" colspan="4">同意接收口 拒绝接收口 拒收理由</td>
				</tr>
				<tr class="tr10">
					<td class="td1">验收人签字</td>
					<td class="td2"></td>
					<td class="td3">送货人签字</td>
					<td class="td4" colspan="2"></td>
				</tr>
				<tr class="tr11">
					<td class="td1">接收单位负责人签字</td>
					<td class="td2" colspan="4">年月日</td>
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