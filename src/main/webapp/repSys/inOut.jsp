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
	centerDiv.height(bodyHeight-topDivHeight);
	
	rightDiv.css("margin-top",-centerDiv.height()+"px");
	
	
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
		
		var appendStr="<div class=\"tab_name_div\">1#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>";
			appendStr+="<table class=\"data_tab1\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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

		var appendStr="<div class=\"tab_name_div\">2#硝酸铵库房多孔粒状硝酸铵出入库登记簿</div>";
			appendStr+="<table class=\"data_tab2\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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

		var appendStr="<div class=\"tab_name_div\">15-1醋酸出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab3\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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

		var appendStr="<div class=\"tab_name_div\">15-1柠檬酸出入库登记表</div>";
			appendStr+="<table class=\"data_tab4\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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
		var whMasterCbChecked=$("#data_tab5_cond_div #wh_master_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab5_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab5_cond_div #memo_cb").prop("checked");


		var appendStr="<div class=\"tab_name_div\">15-3国产油相出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab5\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			if(recGoodsCbChecked)
				appendStr+="<td>领料人</td>";
			if(groLeaCbChecked)
				appendStr+="<td>班组长</td>";
			if(memoCbChecked)
				appendStr+="<td>备注</td>";
			appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr class=\"tr2\">";
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
			if(recGoodsCbChecked)
				appendStr+="<td>"+dataArr[i].recGoods+"</td>";
			if(groLeaCbChecked)
				appendStr+="<td>"+dataArr[i].groLea+"</td>";
			if(memoCbChecked)
				appendStr+="<td>"+dataArr[i].memo+"</td>";
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

		var appendStr="<div class=\"tab_name_div\">15-4硫脲出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab6\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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
		var groLeaCbChecked=$("#data_tab7_cond_div #gro_lea_cb").prop("checked");
		var whMasterCbChecked=$("#data_tab7_cond_div #wh_master_cb").prop("checked");
		var recGoodsCbChecked=$("#data_tab7_cond_div #rec_goods_cb").prop("checked");
		var memoCbChecked=$("#data_tab7_cond_div #memo_cb").prop("checked");

		var appendStr="<div class=\"tab_name_div\">15-5碳酸钠出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab7\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			if(recGoodsCbChecked)
				appendStr+="<td>领料人</td>";
			if(groLeaCbChecked)
				appendStr+="<td>班组长</td>";
			if(memoCbChecked)
				appendStr+="<td>备注</td>";
			appendStr+="</tr>";
			
		var dataArr=[];
		var data={no:1,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:2,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		var data={no:3,outInDate:"02-05",outCount:111,inCount:222,total:333,whMaster:"天赐",recGoods:"天赐",groLea:"天赐",memo:"李天亯"};
		dataArr.push(data);
		
		for(var i=0;i<dataArr.length;i++){
			appendStr+="<tr class=\"tr2\">";
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
			if(recGoodsCbChecked)
				appendStr+="<td>"+dataArr[i].recGoods+"</td>";
			if(groLeaCbChecked)
				appendStr+="<td>"+dataArr[i].groLea+"</td>";
			if(memoCbChecked)
				appendStr+="<td>"+dataArr[i].memo+"</td>";
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

		var appendStr="<div class=\"tab_name_div\">15-6亚硝酸钠出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab8\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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

		var appendStr="<div class=\"tab_name_div\">15-7乙二醇出入库登记表_文档1</div>";
			appendStr+="<table class=\"data_tab9\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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

		var appendStr="<div class=\"tab_name_div\">15-9添加剂出入库登记表</div>";
			appendStr+="<table class=\"data_tab10\" id=\"data_tab\" border=\"1\" cellspacing=\"0\">";
			appendStr+="<tr class=\"tr1\">";
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
			appendStr+="<tr class=\"tr2\">";
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

.center_div{
	margin-top:-550px;
	margin-left:300px;
	overflow-y: auto;
}
.center_div .tool_bar{
}
.center_div .tool_bar .choose_rep_text_span{
	color: #111;
	font-size: 25px;
	margin-left:50px;
}
.center_div .tool_bar .rep_name_sel{
	width:1000px;
	height:50px;
	color: #999;
	font-size: 25px;
	margin-left:50px;
	background-color: #fff;
	border: #eee solid 1px;
}
.center_div .tool_bar .sear_but,
.center_div .tool_bar .report_but,
.center_div .tool_bar .print_rep_but,
.center_div .tool_bar .output_exc_but{
	width: 180px;
	height: 50px;
	margin-left:50px;
	font-size: 35px;
}

.data_tab_div{
	width: 100%;
}
.data_tab_div .tab_name_div {
    width: 100%;
	height: 150px;
	line-height: 150px;
    font-size: 35px;
    text-align: center;
}
.data_tab1,
.data_tab2,
.data_tab3,
.data_tab4,
.data_tab5,
.data_tab6,
.data_tab7,
.data_tab8,
.data_tab9,
.data_tab10{
	width: 100%;
	border: 1px;
}
.data_tab1 .tr1,
.data_tab2 .tr1,
.data_tab3 .tr1,
.data_tab4 .tr1,
.data_tab5 .tr1,
.data_tab6 .tr1,
.data_tab7 .tr1,
.data_tab8 .tr1,
.data_tab9 .tr1,
.data_tab10 .tr1{
	height:70px;
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
	height:60px;
}
.data_tab1 tr td,
.data_tab2 tr td{
	width: 16.6%;
	font-size: 25px;
	text-align: center;
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

.right_div{
	width:500px;
	height:2160px;
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
	height:80px;
	line-height:80px;
	margin-top:30px;
	color:#666;
	font-size:35px;
	text-align:center;
}
.right_div .filter_condition_div .data_choose_div,
.right_div .filter_condition_div .row_div{
	width:80%;
	height:70px;
	line-height:70px;
	margin:auto;
	color:#666;
	font-size:25px;
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
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="center_div" id="center_div">
		<div class="tool_bar" id="tool_bar">
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
			<input class="sear_but" type="button" value="查询" onclick="createDataTab()"/>
			<input class="report_but" type="button" value="生成报表" onclick="createReportTab('tab1')"/>
			<input class="print_rep_but" type="button" value="打印报表" onclick="printRep('tab2')"/>
			<input class="output_exc_but" type="button" value="导出Excel" onclick="exportExcel('tab2')"/>
		</div>
		<div class="data_tab_div" id="data_tab_div">
		</div>
	</div>
	<div class="right_div" id="right_div">
		<div class="filter_condition_div" id="data_tab1_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab2_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab3_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab4_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab5_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab6_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab7_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab8_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab9_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
		<div class="filter_condition_div" id="data_tab10_cond_div">
			<div class="title_div">过滤条件</div>
			<div class="data_choose_div">数据选择</div>
			<div class="row_div">
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
		</div>
	</div>
</div>
</body>
</html>