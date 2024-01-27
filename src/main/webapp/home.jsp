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
.top_div{
	width:100%;
	height:120px;
	background-color:#347CAF;
}
.system_name_img{
	width: 50px;
	height: 50px;
	margin-top: 30px;
	margin-left: 30px;
	position: absolute;
}
.system_name_span{
	margin-top: 30px;
	margin-left: 90px;
	color:#fff;
	font-size: 45px;
	position: absolute;
}
.nav_div{
	width: 800px;
	height:120px;
	margin-left:500px;
	border-left:#FFF solid 2px;
	/*
	background-color:#00F;
	*/
}
.nav_div .home_nav_div{
	width: 180px;
	height: 120px;
	line-height: 120px;
	margin-left:50px;
}
.nav_div .agv_nav_div{
	width: 350px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:230px;
}
.nav_div .video_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:530px;
}
.nav_div .rep_sys_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:790px;
}
.nav_div .sys_set_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:1050px;
}
.nav_div .warn_nav_div{
	width: 260px;
	height: 120px;
	line-height: 120px;
	margin-top:-120px;
	margin-left:1310px;
}
.nav_div .selected{
	height: 117px;
	line-height: 117px;
	border-bottom:#FFF solid 3px;
	background-color: red;
}
.nav_div .home_nav_div .nav_img,
.nav_div .agv_nav_div .nav_img,
.nav_div .video_nav_div .nav_img,
.nav_div .rep_sys_nav_div .nav_img,
.nav_div .sys_set_nav_div .nav_img,
.nav_div .warn_nav_div .nav_img{
	width: 40px;
	height: 40px;
	margin-left:20px;
}
.nav_div .home_nav_div .text_span,
.nav_div .agv_nav_div .text_span,
.nav_div .video_nav_div .text_span,
.nav_div .rep_sys_nav_div .text_span,
.nav_div .sys_set_nav_div .text_span,
.nav_div .warn_nav_div .text_span{
	margin-left:10px;
	color:#fff;
	font-size:35px;
}

.aear_real_data_div{
	width:3840px;
	height:2040px;
}
.aear_real_data_div .title_div{
	width: 100%;
	height:100px;
	line-height:100px;
	border-bottom:#F0F0F0 solid 1px;
	padding-top: 1px;
}
.aear_real_data_div .title_div .icon_div{
	width:20px;
	height:50px;
	margin-top:20px;
	margin-left:40px;
	background-color:#BD3124;
}
.aear_real_data_div .title_div .text_span{
	margin-top: -73px;
	margin-left: 90px;
	color:#50505A;
	font-size: 35px;
	position: absolute;
}
.aear_real_data_div .content_div{
	width: 100%;
	height:1940px;
}
.aear_real_data_div .content_div .aear_div{
	width:2540px;
	height:1940px;
	border-right: #F0F0F0 solid 3px;
}
.aear_real_data_div .content_div .aear_div .name_div{
	width: 100%;
	height:150px;
	line-height:150px;
	text-align:center;
	border-bottom:#F0F0F0 solid 1px;
}
.aear_real_data_div .content_div .aear_div .name_div .name_span{
	color:#4F5257;
	font-size:45px;
}
.aear_real_data_div .content_div .aear_div .name_div .right_point_img{
	width: 50px;
	height: 74px;
	margin-top: 40px;
	margin-left: 50px;
	position: absolute;
	cursor: pointer;
}
.aear_real_data_div .content_div .data_div{
	width: 1300px;
	height:1940px;
	margin-top:-1940px;
	float: right;
}
.aear_real_data_div .content_div .data_div .angle_div{
	width:100%;
	height:230px;
	padding-top: 1px;
}
.aear_real_data_div .content_div .data_div .angle_div .title_span,
.aear_real_data_div .content_div .data_div .real_data_div .title_span,
.aear_real_data_div .content_div .data_div .agv_data_div .title_span{
	margin-top: 40px;
	margin-left: 80px;
	font-size:35px;
	position: absolute;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div{
	width:1000px;
	height:100px;
	margin-top:120px;
	margin-left:80px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div{
	width:300px;
	height:100px;
	line-height:100px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .fs_item_div{
	margin-top:-100px;
	margin-left: 330px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .cs_item_div{
	margin-top:-100px;
	margin-left: 660px;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div .sel_div{
	width:40px;
	height:40px;
	line-height:40px;
	color:#fff;
	font-size:25px;
	text-align:center;
	margin-top:20px;
	margin-left:20px;
	border: #F0F0F0 solid 1px;
	position: absolute;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div .selected{
	background-color:#1684FC;
}
.aear_real_data_div .content_div .data_div .angle_div .angle_but_list_div .item_div .name_span{
	font-size: 30px;
	margin-left:100px;
}
.aear_real_data_div .content_div .data_div .real_data_div,
.aear_real_data_div .content_div .data_div .agv_data_div{
	width:100%;
	height:695px;
	margin-top:20px;
	/* background-color:#00f; */
	padding-top: 1px;
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div,
.aear_real_data_div .content_div .data_div .agv_data_div .content_div{
	width:1000px;
	height:542px;
	margin-top:120px;
	margin-left:80px;
	border: #5DA4DF solid 1px;
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div .row_div,
.aear_real_data_div .content_div .data_div .agv_data_div .content_div .row_div{
	width:100%;
	height:100px;
	padding-top:1px; 
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div .row_div .key_div,
.aear_real_data_div .content_div .data_div .agv_data_div .content_div .row_div .key_div{
	width:250px;
	height:60px;
	line-height:60px;
	margin-top: 20px;
	font-size: 30px;
	text-align: right;
}
.aear_real_data_div .content_div .data_div .real_data_div .content_div .row_div .val_div,
.aear_real_data_div .content_div .data_div .agv_data_div .content_div .row_div .val_div{
	width:350px;
	height:60px;
	line-height:60px;
	margin-top: -60px;
	margin-left: 300px;
	color:#5DA4E9;
	font-size: 30px;
	border-bottom: #C8C8C8 solid 1px;
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
	getBoxList();
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
    var canvas=scene.canvas;
    var handler=new Cesium.ScreenSpaceEventHandler(canvas);
    handler.setInputAction(function(event){
    	
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

function getBoxList(){
	$.post(path+"main/getBoxList",
		function(result){
			if(result.status=="ok"){
				var boxList=result.boxList;
				for(var i=0;i<boxList.length;i++){
					var box=boxList[i];
					//alert(box.id+","+box.longitude+","+box.latitude+","+box.z)
					addBox(box.id,box.longitude,box.latitude,box.z,0);
				}
			}
		}
	,"json");
}

function addBox(index,longitude,latitude,z,radians){
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
	    id:"box"+index,
        position : position,
        orientation : orientation,
        model : {
           uri: "http://localhost:8080/TmpCenConWH/upload/box.glb",
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

function convertCartesian3ToCartographic(position){
	//https://blog.csdn.net/caozl1132/article/details/86220824
    var ellipsoid = viewer.scene.globe.ellipsoid;
    var cartesian3 = new Cesium.Cartesian3(position.x, position.y, position.z);
    var cartographic = ellipsoid.cartesianToCartographic(cartesian3); 
    console.log(cartographic);
    return JSON.parse("{\"longitude\":"+Cesium.Math.toDegrees(cartographic.longitude)+",\"latitude\":"+Cesium.Math.toDegrees(cartographic.latitude)+"}");
}
</script>  
</head>
<body>
<div class="main_div">
	<div class="top_div">
		<img class="system_name_img" alt="" src="<%=basePath %>resource/image/001.png">
		<span class="system_name_span">远程集中监控系统</span>
		<div class="nav_div">
			<div class="home_nav_div${uri.contains('home.jsp')?' selected':'' }">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/002.png">
				<span class="text_span">首页</span>
			</div>
			<div class="agv_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/003.png">
				<span class="text_span">AGV车辆定位</span>
			</div>
			<div class="video_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/004.png">
				<span class="text_span">视频监控</span>
			</div>
			<div class="rep_sys_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/005.png">
				<span class="text_span">报表系统</span>
			</div>
			<div class="sys_set_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/006.png">
				<span class="text_span">系统设置</span>
			</div>
			<div class="warn_nav_div">
				<img class="nav_img" alt="" src="<%=basePath %>resource/image/007.png">
				<span class="text_span">报警诊断</span>
			</div>
		</div>
	</div>
	<div class="aear_real_data_div">
		<div class="title_div">
			<div class="icon_div"></div>
			<span class="text_span">库区实时数据</span>
		</div>
		<div class="content_div">
			<div class="aear_div">
				<div class="name_div">
					<span class="name_span">一号仓库</span>
					<img class="right_point_img" alt="" src="<%=basePath %>resource/image/008.png">
				</div>
				<div class="cesuim_div" id="cesuim_div">
				</div>
			</div>
			<div class="data_div">
				<div class="angle_div">
					<span class="title_span">选择视角</span>
					<div class="angle_but_list_div">
						<div class="item_div">
							<div class="sel_div selected">√</div>
							<span class="name_span">主视</span>
						</div>
						<div class="item_div fs_item_div">
							<div class="sel_div">√</div>
							<span class="name_span">俯视</span>
						</div>
						<div class="item_div cs_item_div">
							<div class="sel_div">√</div>
							<span class="name_span">侧视</span>
						</div>
					</div>
				</div>
				<div class="real_data_div">
					<span class="title_span">实时数据</span>
					<div class="content_div">
						<div class="row_div">
							<div class="key_div">库存总量</div>
							<div class="val_div">601件</div>
						</div>
						<div class="row_div">
							<div class="key_div">今日入库量</div>
							<div class="val_div">301件</div>
						</div>
						<div class="row_div">
							<div class="key_div">今日出库量</div>
							<div class="val_div">301件</div>
						</div>
						<div class="row_div">
							<div class="key_div">叉车数量</div>
							<div class="val_div">3辆</div>
						</div>
						<div class="row_div">
							<div class="key_div">库存报警</div>
							<div class="val_div">1起</div>
						</div>
					</div>
				</div>
				<div class="agv_data_div">
					<span class="title_span">AGV叉车数据</span>
					<div class="content_div">
						<div class="row_div">
							<div class="key_div">高度上限</div>
							<div class="val_div">601mm</div>
						</div>
						<div class="row_div">
							<div class="key_div">高度下限</div>
							<div class="val_div">601mm</div>
						</div>
						<div class="row_div">
							<div class="key_div">下降时长</div>
							<div class="val_div">601ms</div>
						</div>
						<div class="row_div">
							<div class="key_div">上升时长</div>
							<div class="val_div">601ms</div>
						</div>
						<div class="row_div">
							<div class="key_div">左右侧移</div>
							<div class="val_div">601mm</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>