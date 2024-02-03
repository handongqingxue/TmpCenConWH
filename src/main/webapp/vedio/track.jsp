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
<script src="<%=basePath %>resource/cesiumjs/releases/1.83/Build/Cesium/Cesium.js"></script>
<link href="<%=basePath %>resource/cesiumjs/releases/1.83/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
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

.cesuim_div{
	width:3500px;
	height:1600px;
	margin-top:-550px;
	margin-left:300px;
	/*
	background-color:#0f0;
	*/
}

.real_frame_div{
	width: 1600px;
	height: 1400px;
	background-color:#fff;
	position: fixed;
	z-index: 1;
	display: none;
}
.real_frame_div .tit_div{
	width: 100%;
	height: 40px;
	line-height: 40px;
	border-bottom: #666 solid 1px;
}
.real_frame_div .tit_div .text_span{
	margin-left: 15px;
}
.real_frame_div .tit_div .close_span{
	color:#999;
	margin-right: 20px;
	float: right;
	cursor: pointer;
}
.real_frame_div iframe{
	width: 100%;
	height: 1360px;
}

.vedio_div{
	width: 800px;
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
.vedio_div .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-weight:bold;
	text-align:center;
	border-bottom: #F3F3F3 solid 1px;
}
.vedio_div .tit_div .text_span{
	font-size:30px;
}
.vedio_div .tit_div .close_span{
	color:#999;
	font-size:25px;
	margin-right: 20px;
	float: right;
	cursor: pointer;
}
.vedio_div .inp_div{
	width: 90%;
	height: 100px;
	line-height: 100px;
	margin:auto;
}
.vedio_div .inp_div .key_span{
	font-size:25px;
}
.vedio_div .inp_div .val_inp{
	width: 400px;
	height: 50px;
	margin-top:20px;
	margin-right:20px;
	color:#347CAF;
	font-size:25px;
	border-top:0px;
	border-right:0px;
	border-left:0px;
	float: right;
}
.vedio_div .sea_but_div{
	width: 90%;
	height: 80px;
	line-height: 80px;
	margin:auto;
	color:#fff;
	font-size:25px;
	text-align:center;
	background-color:#34F043;
	border-radius:10px;
	cursor: pointer;
}
.vedio_div .real_vedio_div{
	width: 93%;
	height: 900px;
	margin:80px auto 0;
}
.vedio_div .real_vedio_div .tit_div{
	width: 100%;
	height: 100px;
	line-height: 100px;
	margin:auto;
	color:#1F1A57;
	font-size:25px;
	letter-spacing:5px;
	border: #CBCBCB solid 1px;
}
.vedio_div .real_vedio_div iframe{
	width: 100%;
	height: 750px;
	margin-top: 10px;
}
</style>
<title>Insert title here</title>
<script>  
var path='<%=basePath%>';
var areaWidth=1000;
var areaHeight=1000;
var areaX1Long=119.55051952014225;
var areaY1Lat=37.039877776142845;

var areaX2Long=119.55517546999079;
var areaY2Lat=37.04368329953588;

var agvPositionList=[];

var viewer;
Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkZWIzYTUxYy0xMmRkLTRiYTEtODE1My1kMjE1NzAyZDQwMmIiLCJpZCI6NzMyNDUsImlhdCI6MTYzNjY5NTEzOX0.rgwvu7AcuwqpYTO3kTKuZ7Pzebn1WNu2x8bKiqgbTcM';
$(function(){
	initViewer();
	initIframe();
	loadTileset();
	getCameraList();
	initAgvPositionList();
});

function initAgvPositionList(){
	var agv1Position={"tagId":"001","longitude":119.55475873865358,"latitude":37.041692536161385};
	var agv2Position={"tagId":"002","longitude":119.55393797552341,"latitude":37.042449888214016};
	var agv3Position={"tagId":"003","longitude":119.55172649976066,"latitude":37.04286573848189};
	
	agvPositionList.push(agv1Position);
	agvPositionList.push(agv2Position);
	agvPositionList.push(agv3Position);
}

function initIframe(){
	$("#real_frame_div").append("<iframe src=\"\" />");
}

function initViewer(){
	viewer = new Cesium.Viewer('cesuim_div',{
		//需要进行可视化的数据源的集合
		animation: false,//是否显示动画控件(左下角仪表)
		baseLayerPicker: false ,//是否显示图层选择控件
		fullscreenButton: false,//是否显示全屏按钮
		geocoder: false,//是否显示地名查找控件
		homeButton: false,//是否显示Home按钮
		infoBox: false,//是否显示点击要素之后显示的信息
		sceneModePicker: false,//是否显示投影方式控件
		selectionIndicator: false,//是否显示选取指示器组件
		timeline: false,//是否显示时间线控件
		navigationHelpButton: false,//是否显示帮助信息控件
		requestRenderMode: true,//启用请求渲染模式
		scene3DOnly: false,//每个几何实例将只能以3D渲染以节省GPU内存
		sceneMode: 3, //初始场景模式 1 2D模式 2 2D循环模式 3 3D模式  Cesium.SceneMode
	});
	
	var scene=viewer.scene;
    var canvas=scene.canvas;
    var handler=new Cesium.ScreenSpaceEventHandler(canvas);
    handler.setInputAction(function(click){
    	var pick = viewer.scene.pick(click.position);
    	//选中某模型   pick选中的对象
        if(pick && pick.id){
        	if(pick.id._id.startsWith("camera")){
        		var camera=getCameraFromListById(pick.id._id.substring(6));
        		$("#real_frame_div iframe").attr("src",camera.url)
        		showRealFrameDiv(true);
        	}
        }
    },Cesium.ScreenSpaceEventType.LEFT_CLICK);
}

function loadTileset(){
	var tileset = new Cesium.Cesium3DTileset({
	   url: "http://localhost:8080/TmpCenConWH/upload/b3dm/tileset.json",
	   shadows:Cesium.ShadowMode.DISABLED,//去除阴影
	});
	console.log(tileset)
	viewer.scene.primitives.add(tileset);
	tileset.readyPromise.then(function(tileset) {
	   viewer.camera.viewBoundingSphere(tileset.boundingSphere, new Cesium.HeadingPitchRange(0, -0.5, 0));
	   //viewer.scene.primitives.remove(tileset);
	}).otherwise(function(error) {
	    throw(error);
	});
}

function getCameraList(){
	$.post(path+"main/getCameraList",
		function(result){
			if(result.status=="ok"){
				cameraList=result.cameraList;
				for(var i=0;i<cameraList.length;i++){
					var camera=cameraList[i];
					addCamera(camera.id,camera.tagId,camera.longitude,camera.latitude,camera.z);
				}
			}
		}
	,"json");
}

function addCamera(id,tagId,longitude,latitude,z){
	var position = Cesium.Cartesian3.fromDegrees(longitude,latitude,z);
	var xyJS=convertLongLatToXY(longitude,latitude);
	
	viewer.entities.add({
	   id:"camera"+id,
       position : position,
       billboard:{
    	   image:'http://localhost:8080/TmpCenConWH/upload/camera.jpg',
    	   color:Cesium.Color.WHITE.withAlpha(0.8),
    	   width:40,
    	   height:40,
    	   verticalOrigin:Cesium.VerticalOrigin.CENTER,
    	   horizontalOrigin:Cesium.HorizontalOrigin.CENTER
       },
	   label: { //文字标签
	       text: tagId+"("+xyJS.x+","+xyJS.y+")",
	       font: '500 20px Helvetica',// 15pt monospace
	       scale: 1,
	       style: Cesium.LabelStyle.FILL,
	       fillColor: Cesium.Color.WHITE,
	       // pixelOffset: new Cesium.Cartesian2(0, 0),//偏移量
	       eyeOffset: new Cesium.Cartesian3(0.0, 10.0, -20.0),
	       // horizontalOrigin: Cesium.HorizontalOrigin.LEFT,
	       verticalOrigin: Cesium.VerticalOrigin.BOTTOM,
	       showBackground: true,
	       disableDepthTestDistance:Number.POSITIVE_INFINITY,
	       // heightReference: Cesium.HeightReference.CLAMP_TO_GROUND,
	       // disableDepthTestDistance: Number.POSITIVE_INFINITY,
	       // backgroundColor: new Cesium.Color(26 / 255, 196 / 255, 228 / 255, 1.0)//背景顔色
	   }
    });
}

function getCameraFromListById(id){
	var cam;
	for (var i = 0; i < cameraList.length; i++) {
		var camera=cameraList[i];
		if(id==camera.id){
			cam=camera;
			break;
		}
	}
	return cam;
}

//将经纬度转换为坐标
function convertLongLatToXY(longitude,latitude){
	var x=areaWidth/(areaX2Long-areaX1Long)*(longitude-areaX1Long);
	var y=areaHeight/(areaY2Lat-areaY1Lat)*(latitude-areaY1Lat);
	return JSON.parse("{\"x\":"+x.toFixed(2)+",\"y\":"+y.toFixed(2)+"}");
}

function showRealFrameDiv(flag){
	var realFrameDiv=$("#real_frame_div");
	if(flag){
		realFrameDiv.css("display","block");
	}
	else{
		realFrameDiv.find("iframe").attr("src","");
		realFrameDiv.css("display","none");
	}
}

function showVedioDiv(flag){
	var vedioDiv=$("#vedio_div");
	if(flag){
		vedioDiv.css("display","block");
	}
	else{
		vedioDiv.css("display","none");
	}
}

function showVedioInDiv(){
	var tagId=$("#agv_inp").val();
	if(tagId==""||tagId==null){
		alert("请选择叉车");
		return false;
	}
	var agvPosition=getAGVPositionFromListByTagId(tagId);
	console.log(agvPosition)
	var xyJS=convertLongLatToXY(agvPosition.longitude,agvPosition.latitude);
	checkInCameraScopeByList(xyJS.x,xyJS.y);
}

function getAGVPositionFromListByTagId(tagId){
	var agvPos;
	for (var i = 0; i < agvPositionList.length; i++) {
		var agvPosition=agvPositionList[i];
		if(tagId==agvPosition.tagId){
			agvPos=agvPosition;
			break;
		}
	}
	return agvPos;
}

//遍历所有监控，验证是否在监控范围
function checkInCameraScopeByList(x,y){
	var openCameras="";
	var openCameraUrls="";
	for(var i=0;i<cameraList.length;i++){
		var camera=cameraList[i];
		var cameraX=camera.x;
		var cameraY=camera.y;
		var cameraZ=camera.z;
		var distIrr=camera.distIrr;
		var k=camera.k;
		var b=camera.b;
		if(checkInCameraScope(x,y,cameraX,cameraY,cameraZ,distIrr,k,b)){
			openCameras+=","+camera.tagId;
			openCameraUrls+=","+camera.url;
		}
	}
	if(openCameras!=""){
		openCameras=openCameras.substring(1);
		openCameraUrls=openCameraUrls.substring(1);
		
		alert(openCameraUrls.split(",")[0])
		$("#vedio_div iframe").attr("src",openCameraUrls.split(",")[0]);
		
		openCameras="";
		openCameraUrls="";
	}
}

//验证是否在监控范围
function checkInCameraScope(x,y,cameraX,cameraY,cameraZ,distIrr,k,b){
	var inScope=false;
	var distanceToCameraZ=getLineDistance(cameraX,cameraZ,x,0);
	if(distanceToCameraZ<=distIrr){
		var distanceToCameraY=getLineDistance(cameraX,cameraY,x,y);
		if(distanceToCameraY<=distIrr){
			var yScope=k*x+b;
			if(y<=yScope){
				inScope=true;
			}
		}
	}
	return inScope;
}

//https://www.qttc.net/171-javascript-get-two-points-distance.html
//获取两个坐标之间的距离
function getLineDistance(x1,y1,x2,y2){
	var a;
	var b;
	if(x1>x2)
		a=x1-x2;
	else
		a=x2-x1;
		
	if(y1>y2)
		b=y1-y2;
	else
		b=y2-y1;
	return Math.sqrt(a*a+b*b);
}
</script>
</head>
<body>

<div class="real_frame_div" id="real_frame_div">
	<div class="tit_div">
		<span class="text_span">实时画面</span>
		<span class="close_span" onclick="showRealFrameDiv(false)">X</span>
	</div>
</div>

<div class="vedio_div" id="vedio_div">
	<div class="tit_div">
		<span class="text_span">无人叉车视频追踪</span>
		<span class="close_span" onclick="showVedioDiv(false)">X</span>
	</div>
	<div class="inp_div">
		<span class="key_span">请输入叉车编号：</span>
		<input class="val_inp" id="agv_inp" type="text"/>
	</div>
	<div class="sea_but_div" onclick="showVedioInDiv()">点击搜索</div>
	<div class="real_vedio_div">
		<div class="tit_div">实时视频画面</div>
		<iframe></iframe>
	</div>
</div>
 
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="cesuim_div" id="cesuim_div">
	</div>
</div>
</body>
</html>