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
<script src="https://cesium.com/downloads/cesiumjs/releases/1.56.1/Build/Cesium/Cesium.js"></script>  
<link href="https://cesium.com/downloads/cesiumjs/releases/1.56.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<script src="<%=basePath %>resource/cesiumjs/releases/1.56.1/Build/Cesium/Cesium.js"></script>
<link href="<%=basePath %>resource/cesiumjs/releases/1.56.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<script src="https://cesium.com/downloads/cesiumjs/releases/1.83/Build/Cesium/Cesium.js"></script>
<link href="https://cesium.com/downloads/cesiumjs/releases/1.83/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
 -->
<script src="<%=basePath %>resource/cesiumjs/releases/1.83/Build/Cesium/Cesium.js"></script>
<link href="<%=basePath %>resource/cesiumjs/releases/1.83/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<title>Insert title here</title>
<script>  
var path='<%=basePath%>';
var areaWidth=1000;
var areaHeight=1000;
var areaX1Long=119.55051952014225;
var areaY1Lat=37.039877776142845;

var areaX2Long=119.55517546999079;
var areaY2Lat=37.04368329953588;

var milkTruckEnLong=119.55190190955776;
var milkTruckEnLat=37.041269952281006;

var cameraList;
var openCameras="";

var viewer;
Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkZWIzYTUxYy0xMmRkLTRiYTEtODE1My1kMjE1NzAyZDQwMmIiLCJpZCI6NzMyNDUsImlhdCI6MTYzNjY5NTEzOX0.rgwvu7AcuwqpYTO3kTKuZ7Pzebn1WNu2x8bKiqgbTcM';
$(function(){
	//alert(convertLongLatToXY(milkTruckEnLong,milkTruckEnLat))
	//alert(getValueByAngle("tan",30))
	initViewer();
	loadTileset();
	getBoxList();
	getCameraList();
	drawTrack();
	setInterval(() => {
		updateBoxList();
	}, 5000);
});

//遍历所有监控，验证是否在监控范围
function checkInCameraScopeByList(x,y){
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
		}
	}
	if(openCameras!=""){
		openCameras=openCameras.substring(1);
		alert(openCameras)
		openCameras="";
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

//将经纬度转换为坐标
function convertLongLatToXY(longitude,latitude){
	var x=areaWidth/(areaX2Long-areaX1Long)*(longitude-areaX1Long);
	var y=areaHeight/(areaY2Lat-areaY1Lat)*(latitude-areaY1Lat);
	return JSON.parse("{\"x\":"+x.toFixed(2)+",\"y\":"+y.toFixed(2)+"}");
}

//角度转比值
function getValueByAngle(flag,angle){
	var radian = Math.PI*(angle/180);//将角度转换成弧度
	var value;
	if(flag=="sin"){
		value = Math.sin(radian);//计算正弦值
		console.log("正弦值：" + value);
	}
	else if(flag=="cos"){
		value = Math.cos(radian);//计算余弦值
		console.log("余弦值：" + value);
	}
	else if(flag=="tan"){
		value = Math.tan(radian);//计算正切值
		console.log("正切值：" + value);
	}
	return value.toFixed(2);
}

//https://zhuanlan.zhihu.com/p/617677886?utm_id=0
//比值转角度
function getAngleByValue(flag,value){
	var aValue;
	if(flag=="sin")
		aValue=Math.asin(value);
	else if(flag=="cos")
		aValue=Math.acos(value);
	else if(flag=="tan")
		aValue=Math.atan(value);
	var angle=aValue/Math.PI*180;
	return angle.toFixed(2);
}

function getBoxList(){
	$.post(path+"main/getBoxList",
		function(result){
			if(result.status=="ok"){
				var boxList=result.boxList;
				for(var i=0;i<boxList.length;i++){
					var box=boxList[i];
					//alert(box.id+","+box.longitude+","+box.latitude+","+box.z)
					addBox(box.id,box.longitude,box.latitude,box.z);
				}
			}
		}
	,"json");
}

function updateBoxList(){
	$.post(path+"main/getBoxList",
		function(result){
			if(result.status=="ok"){
				var boxList=result.boxList;
				for(var i=0;i<boxList.length;i++){
					var box=boxList[i];
					//alert(box.id+","+box.longitude+","+box.latitude+","+box.z)
					refreshBox(box.id,box.longitude,box.latitude,box.z);
				}
			}
		}
	,"json");
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
                    //"相机高度:"+Math.ceil(viewer.camera.positionCartographic.height);
            var longitude=Cesium.Math.toDegrees(cartographic.longitude);
            var latitude=Cesium.Math.toDegrees(cartographic.latitude);
            var coordinate="经度:"+longitude+",纬度:"+latitude+
            "相机高度:"+Math.ceil(viewer.camera.positionCartographic.height);
			console.log("coordinate==="+coordinate);
			var xyJS=convertLongLatToXY(longitude,latitude);
			checkInCameraScopeByList(xyJS.x,xyJS.y);
        }else{
        	
        }
    },Cesium.ScreenSpaceEventType.MOUSE_MOVE);//监听的是鼠标滑动事件
    
    //https://blog.csdn.net/wo_buzhidao/article/details/84141659
    handler.setInputAction(function(click){
    	var pick = viewer.scene.pick(click.position);
        //选中某模型   pick选中的对象
        if(pick && pick.id){
        	console.log(pick.id._id);
        }
    },Cesium.ScreenSpaceEventType.LEFT_CLICK);//监听的是鼠标左键点击事件
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
	
	var truckList=[];
	var longitude=119.55190190955776;
	var latitude=37.041269952281;
	var z=20;
	var radians;
	for(var i=0;i<10;i++){
		longitude+=0.001;
		latitude+=0.001;
		z+=15;
		switch (i) {
		case 0:
			radians=70;
			break;
		case 1:
			radians=90;
			break;
		case 2:
			radians=110;
			break;
		default:
			radians=170;
			break;
		}
		truckList[i]={"longitude":longitude,"latitude":latitude,"z":z,"radians":radians};
	}
	
	var removeTruckEntity;
	for(var i=0;i<truckList.length;i++){
		var truck=truckList[i];
		console.log(truck.longitude+","+truck.latitude);
		var truckEntity=addMilkTruck(i,truck.longitude,truck.latitude,truck.z,truck.radians);
		if(i==5){
			removeTruckEntity=truckEntity;
		}
	}
	   
    //https://zhuanlan.zhihu.com/p/642695336
    setTimeout(function(){
	    viewer.entities.remove(removeTruckEntity);
    },"5000");
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

function addMilkTruck(index,longitude,latitude,z,radians){
	var position = Cesium.Cartesian3.fromDegrees(longitude,latitude, z);
	var heading = Cesium.Math.toRadians(radians);
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
        },
	    label : { //文字标签
	       text : '客机',
	       font : '18px monospace',
	       style : Cesium.LabelStyle.FILL,
	       outlineWidth : 2,
	       verticalOrigin : Cesium.VerticalOrigin.BOTTOM,//垂直方向以底部来计算标签的位置
	       pixelOffset : new Cesium.Cartesian2( 0, -20 ),//偏移量
    	   showBackground: true
	    }
    });
    //viewer.trackedEntity = entity;//放大当前物体到眼前
    
    return entity;
}

function addBox(id,longitude,latitude,z){
	var position = Cesium.Cartesian3.fromDegrees(longitude,latitude,z);
	viewer.entities.add({
	   id:"box"+id,
       position : position,
       billboard:{
    	   image:'http://localhost:8080/TmpCenConWH/upload/box.jpg',
    	   color:Cesium.Color.WHITE.withAlpha(0.8),
    	   width:40,
    	   height:40,
    	   verticalOrigin:Cesium.VerticalOrigin.CENTER,
    	   horizontalOrigin:Cesium.HorizontalOrigin.CENTER
       },
	   label : { //文字标签
	       text : '吨袋',
	       font : '18px monospace',
	       style : Cesium.LabelStyle.FILL,
	       fillColor: Cesium.Color.WHITE,
	       outlineWidth : 2,
	       verticalOrigin : Cesium.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置
	       pixelOffset : new Cesium.Cartesian2( 0, -30 ),//偏移量
       	   showBackground: true
	   }
    });
}

function refreshBox(id,longitude,latitude,z){
	var boxEn=viewer.entities.getById("box"+id);
	if(boxEn==undefined){
		addBox(id,longitude,latitude,z);
	}
	else{
		var position = Cesium.Cartesian3.fromDegrees(longitude,latitude,z);
		boxEn.position=position;
	}
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

//绘制轨迹
function drawTrack(){
	$.post(path+"main/getPositionList",
		function(result){
			if(result.status=="ok"){
				var positions = [];
				var positionList=result.positionList;
				for(var i=0;i<positionList.length;i++){
					var position=positionList[i];
					positions.push(Cesium.Cartesian3.fromDegrees(position.longitude, position.latitude,position.z));
				}
				
				viewer.entities.add({
				  polyline: {
				    positions: positions,
				    width: 10.0,
				    material: new Cesium.PolylineGlowMaterialProperty({
				      color: Cesium.Color.DEEPSKYBLUE,
				      glowPower: 0.25,
				    }),
				  },
				});
			}
		}
	,"json");
	
}
</script>
</head>
<body>
<div id="cesiumContainer" style="width: 1500px; height:700px"></div>  
</body>
</html>