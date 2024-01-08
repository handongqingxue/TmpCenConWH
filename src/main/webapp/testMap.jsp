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
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<!-- 
<script src="https://cesiumjs.org/releases/1.56.1/Build/Cesium/Cesium.js"></script>  
<link href="https://cesiumjs.org/releases/1.56.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
 -->
<script src="<%=basePath %>resource/cesiumjs/releases/1.56.1/Build/Cesium/Cesium.js"></script>
<link href="<%=basePath %>resource/cesiumjs/releases/1.56.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<title>Insert title here</title>
<script>  
var path='<%=basePath%>';
var milkTruckEnLong=119.55190190955776;
var milkTruckEnLat=37.041269952281006;

var viewer;
Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkZWIzYTUxYy0xMmRkLTRiYTEtODE1My1kMjE1NzAyZDQwMmIiLCJpZCI6NzMyNDUsImlhdCI6MTYzNjY5NTEzOX0.rgwvu7AcuwqpYTO3kTKuZ7Pzebn1WNu2x8bKiqgbTcM';
$(function(){
	initViewer();
	loadTileset();
	getBoxList();
});

function getBoxList(){
	$.post(path+"main/getBoxList",
		function(result){
			alert(result.status);
		}
	,"json");
}

function initViewer(){
	viewer = new Cesium.Viewer('cesiumContainer');
	
	//获取经纬度、高度链接：https://www.cnblogs.com/telwanggs/p/11289455.html
	
	//https://blog.csdn.net/qq_36213352/article/details/122465031
	var scene=viewer.scene;
	//scene.morphTo2D(0);
	
	//获取事件触发所在的  html Canvas容器
    var canvas=scene.canvas;

    //获取事件句柄
    var handler=new Cesium.ScreenSpaceEventHandler(canvas);

    //处理事件函数
    handler.setInputAction(function(movement){

        //拾取笛卡尔坐标
        var ellipsoid=viewer.scene.globe.ellipsoid;//全局椭球体
        var cartesian=viewer.scene.camera.pickEllipsoid(movement.endPosition,ellipsoid)//拾取鼠标在椭圆上的结束点笛卡尔坐标点
        //转化笛卡尔坐标 为经纬度
        var mesDom=document.getElementById('mes');
        if(cartesian){
            var cartographic=ellipsoid.cartesianToCartographic(cartesian);//笛卡尔坐标转制图坐标
            //var coordinate="经度:"+Cesium.Math.toDegrees(cartographic.longitude).toFixed(2)+",纬度:"+Cesium.Math.toDegrees(cartographic.latitude).toFixed(2)+
                    "相机高度:"+Math.ceil(viewer.camera.positionCartographic.height);
            var coordinate="经度:"+Cesium.Math.toDegrees(cartographic.longitude)+",纬度:"+Cesium.Math.toDegrees(cartographic.latitude)+
            "相机高度:"+Math.ceil(viewer.camera.positionCartographic.height);
			console.log("coordinate==="+coordinate);
        }else{
        	
        }
    },Cesium.ScreenSpaceEventType.MOUSE_MOVE);//监听的是鼠标滑动事件
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
	
	/*
	var truckList=[];
	var longitude=119.55190190955776;
	var latitude=37.041269952281;
	for(var i=0;i<10;i++){
		longitude+=0.001;
		latitude+=0.001;
		truckList[i]={"longitude":longitude,"latitude":latitude};
	}
	
	var removeTruckEntity;
	for(var i=0;i<truckList.length;i++){
		var truck=truckList[i];
		console.log(truck.longitude+","+truck.latitude);
		var truckEntity=addMilkTruck(i,truck.longitude,truck.latitude);
		if(i==5){
			removeTruckEntity=truckEntity;
		}
	}
	   
    //https://zhuanlan.zhihu.com/p/642695336
    setTimeout(function(){
	    viewer.entities.remove(removeTruckEntity);
    },"5000");
	*/
	//https://wenku.baidu.com/view/4cdb49d5fa0f76c66137ee06eff9aef8941e4864.html?_wkts_=1691826732887&bdQuery=cesium%E6%B7%BB%E5%8A%A0%E5%9B%BE%E7%89%87
	   
	/*
    viewer.entities.add({
	   id:"boy",
       position : position,
       billboard:{
    	   image:'http://localhost:8080/PositionPhZY/upload/staff.jpg',
    	   color:Cesium.Color.WHITE.withAlpha(0.8),
    	   width:40,
    	   height:40,
    	   verticalOrigin:Cesium.VerticalOrigin.CENTER,
    	   horizontalOrigin:Cesium.HorizontalOrigin.CENTER
       }
    });
	*/
	
	/*
	tileset = new Cesium.Cesium3DTileset({
	   url: "http://localhost:8080/PositionPhZY/upload/model2/tileset.json",
	   shadows:Cesium.ShadowMode.DISABLED,//去除阴影
	});
	viewer.scene.primitives.add(tileset);
	tileset.readyPromise.then(function(tileset) {
	   viewer.camera.viewBoundingSphere(tileset.boundingSphere, new Cesium.HeadingPitchRange(0, -0.5, 0));
	   var cartographic = Cesium.Cartographic.fromCartesian(tileset.boundingSphere.center);
	   console.log(cartographic);
	   setTimeout(function(){
		   //viewer.scene.primitives.remove(tileset);
		   //viewer.scene.primitives.removeAll();
	   },"10000");
	}).otherwise(function(error) {
	    throw(error);
	});
	*/
}

function convertCartesian3ToCartographic(position){
	//https://blog.csdn.net/caozl1132/article/details/86220824
    var ellipsoid = viewer.scene.globe.ellipsoid;
    var cartesian3 = new Cesium.Cartesian3(position.x, position.y, position.z);
    var cartographic = ellipsoid.cartesianToCartographic(cartesian3); 
    console.log(cartographic);
    return JSON.parse("{\"longitude\":"+Cesium.Math.toDegrees(cartographic.longitude)+",\"latitude\":"+Cesium.Math.toDegrees(cartographic.latitude)+"}");
}

function addMilkTruck(index,longitude,latitude){
	var position = Cesium.Cartesian3.fromDegrees(longitude,latitude, 20);
	var heading = Cesium.Math.toRadians(135);
	var pitch = 0;
	var roll = 0;
	var hpr = new Cesium.HeadingPitchRoll(heading, pitch, roll);
	var orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpr);
    console.log(position);
    
    var positionCartographic=convertCartesian3ToCartographic(position);
    console.log(positionCartographic.longitude+","+positionCartographic.latitude);
	 
    var entity = viewer.entities.add({
	    id:"milkTruck"+index,
        position : position,
        orientation : orientation,
        model : {
    	   //uri: "http://localhost:8080/PositionPhZY/upload/CesiumMilkTruck.gltf",
           uri: "http://localhost:8080/PositionPhZY/upload/Cesium_Air.glb",
           minimumPixelSize : 128,
           maximumScale : 20000
        }
    });
    //viewer.trackedEntity = entity;//放大当前物体到眼前
    
    return entity;
}
</script>
</head>
<body>
<div id="cesiumContainer" style="width: 1500px; height:700px"></div>  
</body>
</html>