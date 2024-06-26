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
<script type="text/javascript">
var sysSetPath='<%=basePath %>sysSet/';
var centerDivWidthSpace=200;

var noCheckState;
var checkedState;
var editingState;

var noCheckStateName;
var checkedStateName;
var editingStateName;
$(function(){
	initStateVar();
	initTopDivSize();
	initLeftDivSize();
	initCenterDivStyle();
});

function initStateVar(){
	noCheckState=parseInt('${requestScope.noCheckState}');
	checkedState=parseInt('${requestScope.checkedState}');
	editingState=parseInt('${requestScope.editingState}');

	noCheckStateName='${requestScope.noCheckStateName}';
	checkedStateName='${requestScope.checkedStateName}';
	editingStateName='${requestScope.editingStateName}';
}

function initCenterDivStyle(){
	var centerDiv=$("#center_div");
	centerDiv.width(bodyWidth-leftNavDivWidth-centerDivWidthSpace);
	centerDiv.height(leftNavDivHeight);
	centerDiv.css("margin-top",-leftNavDivHeight+"px");
	centerDiv.css("margin-left",leftNavDivWidth+"px");
}

function initUserDataTab(){
	var dataTab=$(".user_page_div #data_tab");
	dataTab.find(".tr2").remove();
	dataTab.find(".tr3").remove();
	
	var username=$(".user_page_div #username").val();
	var startTime=$(".user_page_div #startTime").val();
	var endTime=$(".user_page_div #endTime").val();
	var state=$(".user_page_div #state_sel").val();
	
	$.post(sysSetPath+"queryUserList",
		{username:username,startTime:startTime,endTime:endTime,state:state},
		function(result){
			if(result.status=="ok"){
				var userList=result.userList;
				for(var i=0;i<userList.length;i++){
					var user=userList[i];
					var appendStr="<tr class=\"tr"+(i%2==0?2:3)+"\" id=\"tr"+user.id+"\">";
						appendStr+="<td>"+user.username+"</td>";
						appendStr+="<td>"+user.createTime+"</td>";
						appendStr+="<td>"+user.phone+"</td>";
						appendStr+="<td>"+user.qq+"</td>";
						appendStr+="<td>"+user.weixin+"</td>";
						appendStr+="<td>"+getStateNameById(user.state)+"</td>";
						appendStr+="<td>";
							appendStr+="<input class=\"detail_but\" type=\"button\" value=\"详情\" onclick=\"showDetailUserBgDiv(true,"+user.id+")\"/>";
						appendStr+="</td>";
					appendStr+="</tr>";
					
					dataTab.append(appendStr);
				}
			}
		}
	,"json");
}

function initRoleDataTab(){
	var dataTab=$(".role_page_div #data_tab");
	dataTab.find(".tr2").remove();
	dataTab.find(".tr3").remove();
	
	var name=$(".role_page_div #name").val();
	
	$.post(sysSetPath+"queryRoleList",
		{name:name},
		function(result){
			if(result.status=="ok"){
				var roleList=result.roleList;
				for(var i=0;i<roleList.length;i++){
					var role=roleList[i];
					var appendStr="<tr class=\"tr"+(i%2==0?2:3)+"\" id=\"tr"+role.id+"\">";
						appendStr+="<td>"+role.name+"</td>";
						appendStr+="<td>"+role.describe+"</td>";
						appendStr+="<td>";
							appendStr+="<input class=\"edit_but\" type=\"button\" value=\"编辑\" onclick=\"showEditRoleBgDiv(true,"+role.id+")\"/>";
						appendStr+="</td>";
					appendStr+="</tr>";
					
					dataTab.append(appendStr);
				}
			}
		}
	,"json");
}

function initPerDataTab(){
	var dataTab=$(".per_page_div #data_tab");
	dataTab.find(".tr2").remove();
	dataTab.find(".tr3").remove();
	
	var name=$(".per_page_div #name").val();
	
	$.post(sysSetPath+"queryPermissionList",
		{name:name},
		function(result){
			if(result.status=="ok"){
				var permissionList=result.permissionList;
				for(var i=0;i<permissionList.length;i++){
					var permission=permissionList[i];
					var appendStr="<tr class=\"tr"+(i%2==0?2:3)+"\" id=\"tr"+permission.id+"\">";
						appendStr+="<td>"+permission.name+"</td>";
						appendStr+="<td>"+permission.sort+"</td>";
						appendStr+="<td>"+permission.describe+"</td>";
						appendStr+="<td>";
							appendStr+="<input class=\"edit_but\" type=\"button\" value=\"编辑\" onclick=\"showEditPerBgDiv(true,"+permission.id+")\"/>";
						appendStr+="</td>";
					appendStr+="</tr>";
					
					dataTab.append(appendStr);
				}
			}
		}
	,"json");
}

function getStateNameById(stateId){
	var str;
	switch (stateId) {
	case noCheckState:
		str=noCheckStateName;//待审核
		break;
	case checkedState:
		str=checkedStateName;//审核通过
		break;
	case editingState:
		str=editingStateName;//编辑中
		break;
	}
	return str;
}

function showDetailUserBgDiv(show,id){
 	var detailUserBgDiv=$("#detail_user_bg_div");
	if(show){
		detailUserBgDiv.css("display","block");
		
		detailUserBgDiv.find("#id_hid").val(id);
		var tr=$(".user_page_div #data_tab #tr"+id);
		var tds=tr.find("td");
		
		detailUserBgDiv.find("#username_td").text(tds.eq(0).text());
		detailUserBgDiv.find("#createTime_td").text(tds.eq(1).text());
		detailUserBgDiv.find("#phone_td").text(tds.eq(2).text());
		detailUserBgDiv.find("#qq_td").text(tds.eq(3).text());
		detailUserBgDiv.find("#weixin_td").text(tds.eq(4).text());
		detailUserBgDiv.find("#state_td").text(tds.eq(5).text());
	}
	else{
		detailUserBgDiv.css("display","none");
		
		detailUserBgDiv.find("#username_td").text("");
		detailUserBgDiv.find("#createTime_td").text("");
		detailUserBgDiv.find("#phone_td").text("");
		detailUserBgDiv.find("#qq_td").text("");
		detailUserBgDiv.find("#weixin_td").text("");
		detailUserBgDiv.find("#state_td").text("");
	}
}

function showAddRoleBgDiv(show){
 	var addRoleBgDiv=$("#add_role_bg_div");
	if(show){
		addRoleBgDiv.css("display","block");
	}
	else{
		addRoleBgDiv.css("display","none");
		
		addRoleBgDiv.find("#name_inp").val("");
		addRoleBgDiv.find("#describe_inp").val("");
	}
}

function showEditRoleBgDiv(show,id){
 	var editRoleBgDiv=$("#edit_role_bg_div");
	if(show){
		editRoleBgDiv.css("display","block");

		editRoleBgDiv.find("#id_hid").val(id);
		var tr=$(".role_page_div #data_tab #tr"+id);
		var tds=tr.find("td");
		
		editRoleBgDiv.find("#name_inp").val(tds.eq(0).text());
		editRoleBgDiv.find("#describe_inp").val(tds.eq(1).text());
	}
	else{
		editRoleBgDiv.css("display","none");
		
		editRoleBgDiv.find("#name_inp").val("");
		editRoleBgDiv.find("#describe_inp").val("");
	}
}

function showAddPerBgDiv(show){
 	var addPerBgDiv=$("#add_per_bg_div");
	if(show){
		addPerBgDiv.css("display","block");
	}
	else{
		addPerBgDiv.css("display","none");
		
		addPerBgDiv.find("#name_inp").val("");
		addPerBgDiv.find("#sort_inp").val("");
		addPerBgDiv.find("#describe_inp").val("");
	}
}

function showEditPerBgDiv(show,id){
 	var editPerBgDiv=$("#edit_per_bg_div");
	if(show){
		editPerBgDiv.css("display","block");

		editPerBgDiv.find("#id_hid").val(id);
		var tr=$(".per_page_div #data_tab #tr"+id);
		var tds=tr.find("td");
		
		editPerBgDiv.find("#name_inp").val(tds.eq(0).text());
		editPerBgDiv.find("#sort_inp").val(tds.eq(1).text());
		editPerBgDiv.find("#describe_inp").val(tds.eq(2).text());
	}
	else{
		editPerBgDiv.css("display","none");
		
		editPerBgDiv.find("#name_inp").val("");
		editPerBgDiv.find("#sort_inp").val("");
		editPerBgDiv.find("#describe_inp").val("");
	}
}

function checkAddRole(){
	if(checkAddRoleName()){
		addRole();
	}
}

function focusAddRoleName(){
	var name = $("#add_role_div #name_inp").val();
	if(name=="名称不能为空"){
		$("#add_role_div #name_inp").val("");
		$("#add_role_div #name_inp").css("color", "#555555");
	}
}

//验证名称
function checkAddRoleName(){
	var name = $("#add_role_div #name_inp").val();
	if(name==null||name==""||name=="名称不能为空"){
		$("#add_role_div #name_inp").css("color","#E15748");
		$("#add_role_div #name_inp").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

function addRole(){
	var name = $("#add_role_div #name_inp").val();
	var describe = $("#add_role_div #describe_inp").val();
	
	$.post(sysSetPath+"addRole",
		{name:name,describe:describe},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				initRoleDataTab();
				showAddRoleBgDiv(false);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

function checkEditRole(){
	if(checkEditRoleName()){
		editRole();
	}
}

function focusEditRoleName(){
	var name = $("#edit_role_div #name_inp").val();
	if(name=="名称不能为空"){
		$("#edit_role_div #name_inp").val("");
		$("#edit_role_div #name_inp").css("color", "#555555");
	}
}

//验证名称
function checkEditRoleName(){
	var name = $("#edit_role_div #name_inp").val();
	if(name==null||name==""||name=="名称不能为空"){
		$("#edit_role_div #name_inp").css("color","#E15748");
		$("#edit_role_div #name_inp").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

function editRole(){
	var id = $("#edit_role_div #id_hid").val();
	var name = $("#edit_role_div #name_inp").val();
	var describe = $("#edit_role_div #describe_inp").val();
	
	$.post(sysSetPath+"editRole",
		{id:id,name:name,describe:describe},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				initRoleDataTab();
				showEditRoleBgDiv(false);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

function checkAddPer(){
	if(checkAddPerName()){
		addPermission();
	}
}

function focusAddPerName(){
	var name = $("#add_per_div #name_inp").val();
	if(name=="名称不能为空"){
		$("#add_per_div #name_inp").val("");
		$("#add_per_div #name_inp").css("color", "#555555");
	}
}

//验证名称
function checkAddPerName(){
	var name = $("#add_per_div #name_inp").val();
	if(name==null||name==""||name=="名称不能为空"){
		$("#add_per_div #name_inp").css("color","#E15748");
		$("#add_per_div #name_inp").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

function addPermission(){
	var name = $("#add_per_div #name_inp").val();
	var sort = $("#add_per_div #sort_inp").val();
	var describe = $("#add_per_div #describe_inp").val();
	
	$.post(sysSetPath+"addPermission",
		{name:name,sort:sort,describe:describe},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				initPerDataTab();
				showAddPerBgDiv(false);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

function checkEditPer(){
	if(checkEditPerName()){
		editPermission();
	}
}

function focusEditPerName(){
	var name = $("#edit_per_div #name_inp").val();
	if(name=="名称不能为空"){
		$("#edit_per_div #name_inp").val("");
		$("#edit_per_div #name_inp").css("color", "#555555");
	}
}

//验证名称
function checkEditPerName(){
	var name = $("#edit_per_div #name_inp").val();
	if(name==null||name==""||name=="名称不能为空"){
		$("#edit_per_div #name_inp").css("color","#E15748");
		$("#edit_per_div #name_inp").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

function editPermission(){
	var id = $("#edit_per_div #id_hid").val();
	var name = $("#edit_per_div #name_inp").val();
	var sort = $("#edit_per_div #sort_inp").val();
	var describe = $("#edit_per_div #describe_inp").val();
	
	$.post(sysSetPath+"editPermission",
		{id:id,name:name,sort:sort,describe:describe},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				initPerDataTab();
				showEditPerBgDiv(false);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

function changeTabPage(flag){
	$(".tab_page_div .item_div").removeClass("selected");
	$(".user_page_div").css("display","none");
	$(".role_page_div").css("display","none");
	$(".per_page_div").css("display","none");
	
	if(flag=="user"){
		$(".tab_page_div .user_item_div").addClass("selected");
		$(".user_page_div").css("display","block");
	}
	else if(flag=="role"){
		$(".tab_page_div .role_item_div").addClass("selected");
		$(".role_page_div").css("display","block");
	}
	else if(flag=="per"){
		$(".tab_page_div .per_item_div").addClass("selected");
		$(".per_page_div").css("display","block");
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

.detail_user_bg_div,
.add_role_bg_div,
.edit_role_bg_div,
.add_per_bg_div,
.edit_per_bg_div{
	width: 100%;
	height: 100%;
	background-color:rgba(0,0,0,0.5);
	position:fixed;
	z-index: 1;
	display: none;
}
.detail_user_div{
	width: 50%;
	height: 500px;
	margin: 200px auto 0;
	background-color:#fff;
}
.detail_user_div .tit_div,
.add_role_div .tit_div,
.edit_role_div .tit_div,
.add_per_div .tit_div,
.edit_per_div .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-size: 30px;
	border-bottom: #eee solid 1px;
}
.detail_user_div .tit_div .tit_span,
.add_role_div .tit_div .tit_span,
.edit_role_div .tit_div .tit_span,
.add_per_div .tit_div .tit_span,
.edit_per_div .tit_div .tit_span{
	margin-left: 50px;
}
.detail_user_div .tit_div .close_but_span,
.add_role_div .tit_div .close_but_span,
.edit_role_div .tit_div .close_but_span,
.add_per_div .tit_div .close_but_span,
.edit_per_div .tit_div .close_but_span{
	font-size: 30px;
	margin-right:50px;
	float: right;
	cursor: pointer;
}
.detail_user_div table,
.add_role_div table,
.edit_role_div table,
.add_per_div table,
.edit_per_div table{
	width: 90%;
	margin:50px auto 0;
}
.detail_user_div table tr,
.add_per_div table tr,
.edit_per_div table tr{
	height: 100px;
	font-size: 30px;
	text-align: center;
}

.add_role_div,
.edit_role_div,
.add_per_div,
.edit_per_div{
	width: 50%;
	height: 600px;
	margin: 200px auto 0;
	background-color:#fff;
}
.add_role_div table tr,
.edit_role_div table tr{
	height: 300px;
	font-size: 30px;
	text-align: center;
}
.add_role_div table tr td input,
.edit_role_div table tr td input,
.add_per_div table tr td input,
.edit_per_div table tr td input{
	width: 50%;
	height: 50px;
}
.add_role_div table tr td textarea,
.edit_role_div table tr td textarea,
.add_per_div table tr td textarea,
.edit_per_div table tr td textarea{
	width: 100%;
	height: 200px;
}
.add_role_div .but_div,
.edit_role_div .but_div,
.add_per_div .but_div,
.edit_per_div .but_div{
	width: 180px;
	height: 70px;
	line-height: 70px;
	font-size: 28px;
	text-align:center;
	letter-spacing:15px;
	border-radius:10px;
	float:right;
	cursor: pointer;
}
.add_role_div .cancel_but_div,
.edit_role_div .cancel_but_div,
.add_per_div .cancel_but_div,
.edit_per_div .cancel_but_div{
	margin-right:50px;
	color:#000;
	background-color: #fff;
	border: #000 solid 1px;
}
.add_role_div .confirm_but_div,
.edit_role_div .confirm_but_div,
.add_per_div .confirm_but_div,
.edit_per_div .confirm_but_div{
	margin-right:20px;
	color:#fff;
	background-color: #4095E5;
}

.center_div .tab_page_div{
	width:100%;
	height: 100px;
}
.center_div .tab_page_div .item_div{
	width: 200px;
	height: 100px;
	line-height: 100px;
	font-size: 30px;
	text-align:center;
	cursor: pointer;
}
.center_div .tab_page_div .selected{
	color: #fff;
	background-color: #4095E5;
}
.center_div .tab_page_div .role_item_div{
	margin-top: -100px;
	margin-left: 200px;
}
.center_div .tab_page_div .per_item_div{
	margin-top: -100px;
	margin-left: 400px;
}

.center_div .user_page_div,
.center_div .role_page_div,
.center_div .per_page_div{
	overflow-y: auto;
	display: none;
}
.center_div .user_page_div .tool_bar，
.center_div .role_page_div .tool_bar，
.center_div .per_page_div .tool_bar{
	width:100%;
	margin-top: 20px;
}
.center_div .user_page_div .tool_bar .un_text_span,
.center_div .user_page_div .tool_bar .ct_text_span,
.center_div .user_page_div .tool_bar .to_text_span,
.center_div .user_page_div .tool_bar .state_text_span,
.center_div .role_page_div .tool_bar .name_text_span,
.center_div .per_page_div .tool_bar .name_text_span{
	color: #111;
	font-size: 30px;
	font-style:italic;
	margin-left:50px;
}
.center_div .user_page_div .tool_bar .username_inp,
.center_div .role_page_div .tool_bar .name_inp,
.center_div .per_page_div .tool_bar .name_inp{
	width: 10%;
	height: 60px;
	margin-left:50px;
	color: #000;
	font-size: 25px;
	background-color: #fff;
	border: #eee solid 1px;
}
.center_div .user_page_div .tool_bar .st_date,
.center_div .user_page_div .tool_bar .et_date,
.center_div .user_page_div .tool_bar .state_sel{
	width:10%;
	height:40px;
	margin-left:50px;
	color:#888;
	font-size:25px;
	border: #BBB solid 1px;
	border-radius:15px; 
}
.center_div .user_page_div .tool_bar .sear_but_div{
	width: 180px;
	height: 70px;
	line-height: 70px;
	margin-top:-70px;
	margin-left:2250px;
	color:#fff;
	font-size: 28px;
	text-align:center;
	letter-spacing:15px;
	background-color: #4095E5;
	border-radius:10px;
	cursor: pointer;
}

.center_div .user_page_div .data_tab_div,
.center_div .role_page_div .data_tab_div,
.center_div .per_page_div .data_tab_div{
	width: 93%;
	margin: 50px auto 0;
}
.center_div .user_page_div .data_tab_div table,
.center_div .role_page_div .data_tab_div table,
.center_div .per_page_div .data_tab_div table{
	width: 100%;
	border: 1px;
}
.center_div .user_page_div .data_tab_div table tr,
.center_div .role_page_div .data_tab_div table tr,
.center_div .per_page_div .data_tab_div table tr{
	height:80px;
}
.center_div .user_page_div .data_tab_div table tr th,
.center_div .role_page_div .data_tab_div table tr th,
.center_div .per_page_div .data_tab_div table tr th{
	color:#fff;
	font-size: 25px;
	text-align: center;
	background-color: #6C6C6C;
	border: #DBDBDB solid 1px;
}
.center_div .user_page_div .data_tab_div table tr td,
.center_div .role_page_div .data_tab_div table tr td,
.center_div .per_page_div .data_tab_div table tr td{
	font-size: 25px;
	text-align: center;
	border: #DBDBDB solid 1px;
}
.center_div .user_page_div .data_tab .tr2,
.center_div .role_page_div .data_tab .tr2,
.center_div .per_page_div .data_tab .tr2{
	background-color: #fff;
}
.center_div .user_page_div .data_tab .tr3,
.center_div .role_page_div .data_tab .tr3,
.center_div .per_page_div .data_tab .tr3{
	background-color: #F2F2F2;
}
.center_div .user_page_div .data_tab_div table tr td .detail_but,
.center_div .role_page_div .data_tab_div table tr td .edit_but,
.center_div .per_page_div .data_tab_div table tr td .edit_but{
	font-size: 25px;
}

.center_div .role_page_div .tool_bar .sear_but_div,
.center_div .per_page_div .tool_bar .sear_but_div{
	width: 180px;
	height: 70px;
	line-height: 70px;
	margin-top:-70px;
	margin-left:580px;
	color:#fff;
	font-size: 28px;
	text-align:center;
	letter-spacing:15px;
	background-color: #4095E5;
	border-radius:10px;
	cursor: pointer;
}
.center_div .role_page_div .tool_bar .add_but_div,
.center_div .per_page_div .tool_bar .add_but_div{
	width: 180px;
	height: 70px;
	line-height: 70px;
	margin-top:-70px;
	margin-left:800px;
	color:#fff;
	font-size: 28px;
	text-align:center;
	letter-spacing:15px;
	background-color: #4095E5;
	border-radius:10px;
	cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="detail_user_bg_div" id="detail_user_bg_div">
	<div class="detail_user_div" id="detail_user_div">
		<div class="tit_div">
			<span class="tit_span">用户详情</span>
			<span class="close_but_span" onclick="showDetailUserBgDiv(false)">X</span>
		</div>
		<input type="hidden" id="id_hid"/>
		<table>
			<tr>
				<td>用户名</td>
				<td id="username_td"></td>
				<td>创建时间</td>
				<td id="createTime_td"></td>
			</tr>
			<tr>
				<td>电话</td>
				<td id="phone_td"></td>
				<td>qq</td>
				<td id="qq_td"></td>
			</tr>
			<tr>
				<td>微信</td>
				<td id="weixin_td"></td>
				<td>状态</td>
				<td id="state_td"></td>
			</tr>
		</table>
	</div>
</div>

<div class="add_role_bg_div" id="add_role_bg_div">
	<div class="add_role_div" id="add_role_div">
		<div class="tit_div">
			<span class="tit_span">添加角色</span>
			<span class="close_but_span" onclick="showAddRoleBgDiv(false)">X</span>
		</div>
		<table>
			<tr>
				<td>名称</td>
				<td>
					<input type="text" id="name_inp"/>
				</td>
				<td>描述</td>
				<td>
					<textarea rows="3" cols="10" id="describe_inp"></textarea>
				</td>
			</tr>
		</table>
		<div class="but_div cancel_but_div" onclick="showAddRoleBgDiv(false)">取消</div>
		<div class="but_div confirm_but_div" onclick="checkAddRole()">确定</div>
	</div>
</div>

<div class="edit_role_bg_div" id="edit_role_bg_div">
	<div class="edit_role_div" id="edit_role_div">
		<div class="tit_div">
			<span class="tit_span">编辑角色</span>
			<span class="close_but_span" onclick="showEditRoleBgDiv(false)">X</span>
		</div>
		<input type="hidden" id="id_hid"/>
		<table>
			<tr>
				<td>名称</td>
				<td>
					<input type="text" id="name_inp"/>
				</td>
				<td>描述</td>
				<td>
					<textarea rows="3" cols="10" id="describe_inp"></textarea>
				</td>
			</tr>
		</table>
		<div class="but_div cancel_but_div" onclick="showEditRoleBgDiv(false)">取消</div>
		<div class="but_div confirm_but_div" onclick="checkEditRole()">确定</div>
	</div>
</div>

<div class="add_per_bg_div" id="add_per_bg_div">
	<div class="add_per_div" id="add_per_div">
		<div class="tit_div">
			<span class="tit_span">添加权限</span>
			<span class="close_but_span" onclick="showAddPerBgDiv(false)">X</span>
		</div>
		<table>
			<tr>
				<td>名称</td>
				<td>
					<input type="text" id="name_inp"/>
				</td>
				<td>排序</td>
				<td>
					<input type="text" id="sort_inp"/>
				</td>
			</tr>
			<tr>
				<td>描述</td>
				<td>
					<textarea rows="3" cols="10" id="describe_inp"></textarea>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div class="but_div cancel_but_div" onclick="showAddPerBgDiv(false)">取消</div>
		<div class="but_div confirm_but_div" onclick="checkAddPer()">确定</div>
	</div>
</div>

<div class="edit_per_bg_div" id="edit_per_bg_div">
	<div class="edit_per_div" id="edit_per_div">
		<div class="tit_div">
			<span class="tit_span">编辑权限</span>
			<span class="close_but_span" onclick="showEditPerBgDiv(false)">X</span>
		</div>
		<input type="hidden" id="id_hid"/>
		<table>
			<tr>
				<td>名称</td>
				<td>
					<input type="text" id="name_inp"/>
				</td>
				<td>排序</td>
				<td>
					<input type="text" id="sort_inp"/>
				</td>
			</tr>
			<tr>
				<td>描述</td>
				<td>
					<textarea rows="3" cols="10" id="describe_inp"></textarea>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div class="but_div cancel_but_div" onclick="showEditPerBgDiv(false)">取消</div>
		<div class="but_div confirm_but_div" onclick="checkEditPer()">确定</div>
	</div>
</div>

<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="center_div" id="center_div">
		<div class="tab_page_div">
			<div class="item_div user_item_div" onclick="changeTabPage('user')">用户查询</div>
			<div class="item_div role_item_div" onclick="changeTabPage('role')">角色查询</div>
			<div class="item_div per_item_div" onclick="changeTabPage('per')">权限查询</div>
		</div>
		<div class="user_page_div">
			<div class="tool_bar" id="tool_bar">
				<span class="un_text_span">用户名:</span>
				<input class="username_inp" type="text" id="username" placeholder="请输入用户名"/>
				<span class="ct_text_span">创建时间:</span>
				<input class="st_date" type="date" id="startTime"/>
				<span class="to_text_span">至</span>
				<input class="et_date" type="date" id="endTime"/>
				<span class="state_text_span">状态:</span>
				<select class="state_sel" id="state_sel">
					<option value="${requestScope.noCheckState}">${requestScope.noCheckStateName}</option>
					<option value="${requestScope.checkedState}">${requestScope.checkedStateName}</option>
					<option value="${requestScope.editingState}">${requestScope.editingStateName}</option>
				</select>
				<div class="sear_but_div" onclick="initUserDataTab()">查询</div>
			</div>
			<div class="data_tab_div" id="data_tab_div">
				<table class="data_tab" id="data_tab" border="1" cellspacing="0">
					<tr class="tr1">
						<th>用户名</th>
						<th>创建时间</th>
						<th>电话</th>
						<th>qq</th>
						<th>微信</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="role_page_div">
			<div class="tool_bar" id="tool_bar">
				<span class="name_text_span">名称:</span>
				<input class="name_inp" type="text" id="name" placeholder="请输入名称"/>
				<div class="sear_but_div" onclick="initRoleDataTab()">查询</div>
				<div class="add_but_div" onclick="showAddRoleBgDiv(true)">添加</div>
			</div>
			<div class="data_tab_div" id="data_tab_div">
				<table class="data_tab" id="data_tab" border="1" cellspacing="0">
					<tr class="tr1">
						<th>名称</th>
						<th>描述</th>
						<th>操作</th>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="per_page_div">
			<div class="tool_bar" id="tool_bar">
				<span class="name_text_span">名称:</span>
				<input class="name_inp" type="text" id="name" placeholder="请输入名称"/>
				<div class="sear_but_div" onclick="initPerDataTab()">查询</div>
				<div class="add_but_div" onclick="showAddPerBgDiv(true)">添加</div>
			</div>
			<div class="data_tab_div" id="data_tab_div">
				<table class="data_tab" id="data_tab" border="1" cellspacing="0">
					<tr class="tr1">
						<th>名称</th>
						<th>排序</th>
						<th>描述</th>
						<th>操作</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>