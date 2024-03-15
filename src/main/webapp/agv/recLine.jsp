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
<script src="<%=basePath %>resource/cesiumjs/releases/1.83/Build/Cesium/Cesium.js"></script>
<link href="<%=basePath %>resource/cesiumjs/releases/1.83/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<style type="text/css">
body{
	margin:0;
}

/**
* div高度100%让文字居中:https://blog.csdn.net/qq_43014842/article/details/122885314
**/
.loading_div{
	width: 100%;
	height: 100%;
	color: #fff;
	font-size: 45px;
	display:flex;
	justify-content:center;
	align-items:center;
	background: rgba(0,0,0,0.5);
	position: fixed;
	z-index: 1;
	display: none;
}

.main_div{
	width:3840px;
	height:2160px;
}
.main_div .tool_bar{
	width:100%;
	height:80px;
	line-height:80px;
}
.main_div .tool_bar .choose_area_text_span,
.main_div .tool_bar .choose_agv_text_span,
.main_div .tool_bar .choose_date_text_span{
	color: #111;
	font-size: 25px;
	margin-left:50px;
}
.main_div .tool_bar .area_name_sel,
.main_div .tool_bar .agv_name_sel{
	width:400px;
	height:50px;
	color: #999;
	font-size: 25px;
	margin-left:50px;
	background-color: #fff;
	border: #eee solid 1px;
}
.start_date,
.end_date{
	width: 250px;
	height: 50px;
}
.main_div .tool_bar .sear_but{
	width: 180px;
	height: 50px;
	margin-top:20px;
	margin-left:50px;
	font-size: 35px;
	position: absolute;
}

</style>
<title>Insert title here</title>
<script>  
var path='<%=basePath%>';
var viewer;
Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkZWIzYTUxYy0xMmRkLTRiYTEtODE1My1kMjE1NzAyZDQwMmIiLCJpZCI6NzMyNDUsImlhdCI6MTYzNjY5NTEzOX0.rgwvu7AcuwqpYTO3kTKuZ7Pzebn1WNu2x8bKiqgbTcM';
$(function(){
	initViewer();
	loadTileset();
});

//https://frontend.devrank.cn/traffic-information/7262307343408138298
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
	scene.morphTo2D(0);
  	var canvas=scene.canvas;
  	var handler=new Cesium.ScreenSpaceEventHandler(canvas);
  	handler.setInputAction(function(event){
  	
  },Cesium.ScreenSpaceEventType.LEFT_CLICK);
  	
	var helper = new Cesium.EventHelper();
	helper.add(this.viewer.scene.globe.tileLoadProgressEvent, function (e) {
		//console.log('每次加载地图服务矢量切片都会进入这个回调',e);
		if (e== 0) {
			//console.log("矢量切片加载完成时的回调");
		}
	});
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

//绘制轨迹
function drawTrack(){
	showLoadingDiv(true);
	var tagId=$("#agv_name_sel").val();
	var startDate=$("#start_date").val();
	var endDate=$("#end_date").val();
	$.post(path+"main/getForkliftHisTrack",
		{tagId:tagId,startDate:startDate,endDate:endDate},
		function(result){
			if(result.status=="ok"){
				var positions = [];
				var forkliftTrackList=result.forkliftTrackList;
				for(var i=0;i<forkliftTrackList.length;i++){
					var forkliftTrack=forkliftTrackList[i];
					positions.push(Cesium.Cartesian3.fromDegrees(forkliftTrack.longitude, forkliftTrack.latitude,50));
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
			showLoadingDiv(false);
		}
	,"json");
	
}

function showLoadingDiv(flag){
	$("#loading_div").css("display",flag?"flex":"none");
}
</script>
</head>
<body>
<div class="loading_div" id="loading_div">轨迹加载中</div>
<div class="main_div">
		<div class="tool_bar" id="tool_bar">
			<span class="choose_area_text_span">请选择区域</span>
			<select class="area_name_sel" id="area_name_sel">
				<option value="001">1#仓库</option>
				<option value="002">2#仓库</option>
			</select>
			<span class="choose_agv_text_span">请选择叉车</span>
			<select class="agv_name_sel" id="agv_name_sel">
				<option value="001">001</option>
				<option value="002">002</option>
			</select>
			<span class="choose_date_text_span">请选择日期</span>
			<input class="start_date" id="start_date" type="date"/>
			至
			<input class="end_date" id="end_date" type="date"/>
			<input class="sear_but" type="button" value="查询" onclick="drawTrack()"/>
		</div>
	<div class="cesuim_div" id="cesuim_div">
	</div>
</div>
</body>
</html>