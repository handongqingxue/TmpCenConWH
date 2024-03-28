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
var phoneFlag,qqFlag,weixinFlag;
function checkSubmit(){
	if(checkUsername()){
		if(checkPassword()){
			if(checkPassword2()){
				if(checkPhone()){
					if(checkQq()){
						if(checkWeixin()){
							regist();
						}
					}
				}
			}
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
	var flag=false;
	var unErrDiv=$("#un_error_div");
	var username=$("#username").val();
	if(username==null||username==""){
		unErrDiv.text("用户名不能为空");
		unErrDiv.css("display","block");
    	flag=false;
	}
	else{
		$.ajaxSetup({async:false});
		$.post(path+"main/checkUsernameIfExist",
			{username:username},
			function(data){
				if(data.status==1)
			    	flag=true;
				else{
					unErrDiv.text(data.msg);
					unErrDiv.css("display","block");
			    	flag=false;
				}
			}
		,"json");
	}
	return flag;
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

function focusPassword2(){
	var pwd2ErrDiv=$("#pwd2_error_div");
	var pwd2ErrMsg = pwd2ErrDiv.text();
	if(pwd2ErrMsg=="确认密码不能为空"||pwd2ErrMsg=="两次密码不一致"){
		pwd2ErrDiv.text("");
		pwd2ErrDiv.css("display","none");
	}
}

//验证确认密码
function checkPassword2(){
	var pwd2ErrDiv=$("#pwd2_error_div");
	var password=$("#password").val();
	var password2=$("#password2").val();
	if(password2==null||password2==""){
		pwd2ErrDiv.text("确认密码不能为空");
		pwd2ErrDiv.css("display","block");
		return false;
	}
	else if(password!=password2){
		pwd2ErrDiv.text("两次密码不一致");
		pwd2ErrDiv.css("display","block");
		return false;
	}
	else
		return true;
}

function checkPhone(){
	var phone=$("#phone").val();
	if(phone==""||phone==null)
		phoneFlag=false;
	else
		phoneFlag=true;
	return true;
}

function checkQq(){
	var qq=$("#qq").val();
	if(qq==""||qq==null)
		qqFlag=false;
	else
		qqFlag=true;
	return true;
}

function checkWeixin(){
	var weixin=$("#weixin").val();
	if(weixin==""||weixin==null)
		weixinFlag=false;
	else
		weixinFlag=true;
	
	if(phoneFlag==false&qqFlag==false&weixinFlag==false){
		alert("电话、qq、微信号必须填写其中一个");
		return false;
	}
	else
		return true;
}

function regist(){
	var username=$("#username").val().trim();
	var password=MD5($("#password").val().trim()).toUpperCase();
	var phone=$("#phone").val().trim();
	var qq=$("#qq").val().trim();
	var weixin=$("#weixin").val().trim();
	var url=path+"/main/regist";
	$.post(url,
		{username:username,password:password,phone:phone,qq:qq,weixin:weixin},
		function(result){
			if(result.status==0){
				alert(result.msg);
				window.location.href=path+result.url;
			}
			else if(result.status==2){
				alert(result.msg);
			}
	},"json")
}
</script>
<style type="text/css">
body{
	margin:0;
}
.main_div{
	width:3840px;
	height:2160px;
	background-image: url("<%=basePath%>resource/image/019.png");
	-moz-background-size:100% 100%;
	background-size:100% 100%;
	padding-top: 1px;
}
.reg_div{
	width: 800px;
	height: 1330px;
	margin:100px auto 0;
	background-color: rgba(21,28,44,.5);
	padding-top: 1px;
}
.reg_div .tit_h3{
	margin: 60px 80px 60px;
	color: #fff;
	font-size: 35px;
	font-weight: 500;
	text-align: center;
}
.reg_div .form_item_div{
	height:160px;
	margin: 0 80px 0;
}
.reg_div .form_item_div .tit_div{
	margin-bottom: 10px;
  	margin-left: 20px;
	color: hsla(0,0%,100%,.4);
	font-size: 25px;
}
.reg_div .form_item_div .input_div{
	width: 100%;
	height: 64px;
	border: #1890ff solid 1px;
}
.reg_div .form_item_div .input_div input{
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
.reg_div .form_item_div .error_div{
	color: #ff4949;
	font-size: 25px;
	display: none;
}
.reg_div .submit_but_div{
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
	<div class="reg_div">
		<h3 class="tit_h3">准能炸药厂远程监控系统</h3>
		<div class="form_item_div">
			<div class="tit_div">用户名</div>
			<div class="input_div">
				<input type="text" id="username" onfocus="focusUsername()" onblur="checkUsername()"/>
			</div>
			<div class="error_div" id="un_error_div"></div>
		</div>
		<div class="form_item_div">
			<div class="tit_div">密码</div>
			<div class="input_div">
				<input type="password" id="password" onfocus="focusPassword()" onblur="checkPassword()"/>
			</div>
			<div class="error_div" id="pwd_error_div"></div>
		</div>
		<div class="form_item_div">
			<div class="tit_div">确认密码</div>
			<div class="input_div">
				<input type="password" id="password2" onfocus="focusPassword2()" onblur="checkPassword2()"/>
			</div>
			<div class="error_div" id="pwd2_error_div"></div>
		</div>
		<div class="form_item_div">
			<div class="tit_div">电话</div>
			<div class="input_div">
				<input type="text" id="phone"/>
			</div>
		</div>
		<div class="form_item_div">
			<div class="tit_div">qq</div>
			<div class="input_div">
				<input type="text" id="qq"/>
			</div>
		</div>
		<div class="form_item_div">
			<div class="tit_div">微信</div>
			<div class="input_div">
				<input type="text" id="weixin"/>
			</div>
		</div>
		<div class="submit_but_div" onclick="checkSubmit()">提交</div>
	</div>
</div>
</body>
</html>