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
							appendStr+="<input class=\"detail_but\" type=\"button\" value=\"详情\" onclick=\"showDetailRoleBgDiv(true,"+role.id+")\"/>";
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
		
		addRoleBgDiv.find("#username_td").text("");
		addRoleBgDiv.find("#createTime_td").text("");
	}
}

function checkAddRole(){
	
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
.add_role_bg_div{
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
.add_role_div .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-size: 30px;
	border-bottom: #eee solid 1px;
}
.detail_user_div .tit_div .tit_span,
.add_role_div .tit_div .tit_span{
	margin-left: 50px;
}
.detail_user_div .tit_div .close_but_span,
.add_role_div .tit_div .close_but_span{
	font-size: 30px;
	margin-right:50px;
	float: right;
	cursor: pointer;
}
.detail_user_div table,
.add_role_div table{
	width: 90%;
	margin:50px auto 0;
}
.detail_user_div table tr{
	height: 100px;
	font-size: 30px;
	text-align: center;
}

.add_role_div{
	width: 50%;
	height: 600px;
	margin: 200px auto 0;
	background-color:#fff;
}
.add_role_div table tr{
	height: 300px;
	font-size: 30px;
	text-align: center;
}
.add_role_div table tr td input{
	width: 50%;
	height: 50px;
}
.add_role_div table tr td textarea{
	width: 100%;
	height: 200px;
}
.add_role_div .but_div{
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
.add_role_div .cancel_but_div{
	margin-right:50px;
	color:#000;
	background-color: #fff;
	border: #000 solid 1px;
}
.add_role_div .confirm_but_div{
	margin-right:20px;
	color:#fff;
	background-color: #4095E5;
}

.center_div .user_page_div{
	overflow-y: auto;
	display: none;
}
.center_div .user_page_div .tool_bar，
.center_div .role_page_div .tool_bar{
	width:100%;
	margin-top: 20px;
}
.center_div .user_page_div .tool_bar .un_text_span,
.center_div .user_page_div .tool_bar .ct_text_span,
.center_div .user_page_div .tool_bar .to_text_span,
.center_div .user_page_div .tool_bar .state_text_span,
.center_div .role_page_div .tool_bar .name_text_span{
	color: #111;
	font-size: 30px;
	font-style:italic;
	margin-left:50px;
}
.center_div .user_page_div .tool_bar .username_inp,
.center_div .role_page_div .tool_bar .name_inp{
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
.center_div .role_page_div .data_tab_div{
	width: 93%;
	margin: 50px auto 0;
}
.center_div .user_page_div .data_tab_div table,
.center_div .role_page_div .data_tab_div table{
	width: 100%;
	border: 1px;
}
.center_div .user_page_div .data_tab_div table tr,
.center_div .role_page_div .data_tab_div table tr{
	height:80px;
}
.center_div .user_page_div .data_tab_div table tr th,
.center_div .role_page_div .data_tab_div table tr th{
	color:#fff;
	font-size: 25px;
	text-align: center;
	background-color: #6C6C6C;
	border: #DBDBDB solid 1px;
}
.center_div .user_page_div .data_tab_div table tr td,
.center_div .role_page_div .data_tab_div table tr td{
	font-size: 25px;
	text-align: center;
	border: #DBDBDB solid 1px;
}
.center_div .user_page_div .data_tab .tr2,
.center_div .role_page_div .data_tab .tr2{
	background-color: #fff;
}
.center_div .user_page_div .data_tab .tr3,
.center_div .role_page_div .data_tab .tr3{
	background-color: #F2F2F2;
}
.center_div .user_page_div .data_tab_div table tr td .detail_but,
.center_div .role_page_div .data_tab_div table tr td .detail_but{
	font-size: 25px;
}

.center_div .role_page_div .tool_bar .sear_but_div{
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
.center_div .role_page_div .tool_bar .add_but_div{
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

<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="center_div" id="center_div">
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
	</div>
</div>
</body>
</html>