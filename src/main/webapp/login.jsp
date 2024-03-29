<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/MD5.js"></script>
<script type="text/javascript">
var path='<%=basePath %>';
function checkLogin(){
	if(checkUsername()){
		if(checkPassword()){
			login();
		}
	}
}

function focusUsername(){
	var unErrDiv=$("#un_error_div");
	var unErrMsg = unErrDiv.text();
	if(unErrMsg=="用户名不能为空"){
		unErrDiv.text("");
		unErrDiv.css("display","none");
	}
}

//验证用户名
function checkUsername(){
	var unErrDiv=$("#un_error_div");
	var username=$("#username").val();
	if(username==null||username==""){
		unErrDiv.text("用户名不能为空");
		unErrDiv.css("display","block");
		return false;
	}
	else
		return true;
}

function focusPassword(){
	var pwdErrDiv=$("#pwd_error_div");
	var pwdErrMsg = pwdErrDiv.text();
	if(pwdErrMsg=="密码不能为空"){
		pwdErrDiv.text("");
		pwdErrDiv.css("display","none");
	}
}

//验证密码
function checkPassword(){
	var pwdErrDiv=$("#pwd_error_div");
	var password=$("#password").val();
	if(password==null||password==""){
		pwdErrDiv.text("密码不能为空");
		pwdErrDiv.css("display","block");
  		return false;
	}
	else
		return true;
}

function login(){
	var username=$("#username").val();
	var password=MD5($("#password").val()).toUpperCase();
	$.post(path+"main/login",
		{username:username,password:password},
		function(result){
        	if(result.status==0){
        		//alert(result.msg);
        		//layer.msg(json.msg, {icon: 6});
        		window.location.href=path+result.url;
        	}else if(result.status==1){
        		alert(result.msg);
        		//layer.alert(json.msg,{icon:5});
        	}
		}
	,"json");
}
</script>
<style type="text/css">
body{
	margin:0;
}
a{
	text-decoration: none;
}
.main_div{
	width:3840px;
	height:2160px;
	background-image: url("<%=basePath%>resource/image/019.png");
	-moz-background-size:100% 100%;
	background-size:100% 100%;
	padding-top: 1px;
}
.login_div{
	width: 800px;
	height: 960px;
	margin:100px auto 0;
	background-color: rgba(21,28,44,.5);
	padding-top: 1px;
}
.login_div .tit_h3{
	margin: 60px 80px 60px;
	color: #fff;
	font-size: 35px;
	font-weight: 500;
	text-align: center;
}
.login_div .form_item_div{
	height:160px;
	margin: 0 80px 0;
}
.login_div .form_item_div .tit_div{
	margin-bottom: 10px;
  	margin-left: 20px;
	color: hsla(0,0%,100%,.4);
	font-size: 25px;
}
.login_div .form_item_div .input_div{
	width: 100%;
	height: 64px;
	border: #1890ff solid 1px;
}
.login_div .form_item_div .input_div input{
	width:95%;
	height: 50px;
	margin-top:7px; 
	padding-left: 15px;
	padding-right: 15px;
	color: #fff;
	font-size: 28px;
	background-color: hsla(0, 100%, 50%, 0);
	border: none;
}
.login_div .form_item_div .error_div{
	color: #ff4949;
	font-size: 25px;
	display: none;
}
.login_div .login_but_div,
.login_div .reg_but_div{
	height: 64px;
	line-height: 64px;
	margin: 50px 80px 0;
	color: #fff;
	font-size: 28px;
	text-align:center;
	background-image: linear-gradient(90deg,#015afe,#04afff);
  	border-radius: 4px;
  	cursor: pointer;
}
</style>
</head>
<body>
<div class="main_div">
	<div class="login_div">
		<h3 class="tit_h3">准能炸药厂远程监控系统</h3>
		<div class="form_item_div">
			<div class="tit_div">用户名</div>
			<div class="input_div">
				<input type="text" id="username" value="admin" onfocus="focusUsername()" onblur="checkUsername()"/>
			</div>
			<div class="error_div" id="un_error_div"></div>
		</div>
		<div class="form_item_div">
			<div class="tit_div">密码</div>
			<div class="input_div">
				<input type="password" id="password" value="123456" onfocus="focusPassword()" onblur="checkPassword()"/>
			</div>
			<div class="error_div" id="pwd_error_div"></div>
		</div>
		<div class="login_but_div" onclick="checkLogin()">登录</div>
		<a href="<%=basePath%>main/goRegist">
			<div class="reg_but_div">注册</div>
		</a>
	</div>
</div>
</body>
</html>