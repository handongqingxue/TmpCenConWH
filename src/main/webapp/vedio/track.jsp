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
	margin-top:-2160px;
	background-color:#fff;
	position: absolute;
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
.close_span{
	color:#999;
	margin-right: 20px;
	float: right;
	cursor: pointer;
}
.real_frame_div iframe{
	width: 100%;
	height: 1360px;
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

var viewer;
Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkZWIzYTUxYy0xMmRkLTRiYTEtODE1My1kMjE1NzAyZDQwMmIiLCJpZCI6NzMyNDUsImlhdCI6MTYzNjY5NTEzOX0.rgwvu7AcuwqpYTO3kTKuZ7Pzebn1WNu2x8bKiqgbTcM';
$(function(){
	initViewer();
	loadTileset();
	getCameraList();
});

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
</script>
</head>
<body>
<div class="main_div">
	<%@include file="../inc/top.jsp"%>
	<%@include file="../inc/leftNav.jsp"%>
	<div class="cesuim_div" id="cesuim_div">
	</div>
</div>

<div class="real_frame_div" id="real_frame_div">
	<div class="tit_div">
		<span class="text_span">实时画面</span>
		<span class="close_span" onclick="showRealFrameDiv(false)">X</span>
	</div>
	<iframe src="" />
</div>
</body>
</html>