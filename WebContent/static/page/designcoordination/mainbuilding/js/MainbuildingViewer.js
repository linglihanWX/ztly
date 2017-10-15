var MainBuildingViewer = MainBuildingViewer || {};
var index = 0;
var indexReal = 0;
var arr = [];
var arrReal = [];
var newObj = {};
var newObjReal = {};
var currArr = [];
var currArrReal = [];
var first = true;
var firstReal = true;
var ceshistate = false;
var modelTile=null;
var myviewer = null;
window.obj = {};
MainBuildingViewer.EbsObj = function (nodeId, fatherId, type, name, startDatePlan, endDatePlan, startDate, endDate, modelId, leaf) {
    this.nodeId = nodeId;
    this.fatherId = fatherId;
    this.type = type;
    this.name = name;
    this.startDatePlan = startDatePlan;
    this.endDatePlan = endDatePlan;
    this.startDate = startDate;
    this.endDate = endDate;
    this.modelId = modelId;
    this.leaf = leaf;
    this.children = [];
}

MainBuildingViewer.ModelObj = function (id, parentId, name, type, url, lon, lat, height, course, alpha, roll, scaleX, scaleY, scaleZ) {
    this.id = id;
    this.parentId = parentId;
    this.name = name;
    this.url = url;
    this.type = type;
    this.lon = lon;
    this.lat = lat;
    this.height = height;
    this.course = course;
    this.alpha = alpha;
    this.roll = roll;
    this.scaleX = scaleX;
    this.scaleY = scaleY;
    this.scaleZ = scaleZ;
    var modelMatrix = FreeDoTool.getModelMatrix(lon, lat, height, course, alpha, roll, scaleX, scaleY, scaleZ);
    this.primitive = MainBuildingViewer.viewer.scene.primitives.add(FreeDo.Model.fromGltf(
        {
            id: id,
            url: url,
            show: true,                     // default
            modelMatrix: modelMatrix,
            allowPicking: false,            // not pickable
            debugShowBoundingVolume: false, // default
            debugWireframe: false
        }));
}

MainBuildingViewer.GroupObj = function (id, parentId, name, type) {
    this.id = id;
    this.parentId = parentId;
    this.name = name;
    this.type = type;
    this.children = [];
}

MainBuildingViewer.init = function (earthId) {
	if(!ceshistate){
		
		this.modelContainer = this.modelContainer || {};//未来保存加载的模型的容器，便于快速访问
		this.ebsContainer = this.ebsContainer || {};
		this.timeArray = this.timeArray || [];//保存了按时间排序的Ebs叶子节点
		this.timeIndex = 0;
		this.showEbsContainer = this.showEbsContainer || {};//保存了当前时间点中显示出来的Ebs节点对应的模型
		this.viewer = this.viewer || {};
		//初始化地球
		var freedocontainer = document.getElementById(earthId);
		var project = Freedo.FdApp.createProject(freedocontainer);
		this.project = project;
		
		this.viewer = this.project.getViewer();
		this.viewer.imageryLayers.addImageryProvider(new FreeDo.WebMapTileServiceImageryProvider({
			url: "http://{s}.tianditu.com/img_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=img&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default&format=tiles",
			subdomains:['t7','t6','t5','t4','t3','t2','t1','t0'],
			maximumLevel: 18,
			show: true
		}));
		/*this.viewer.imageryLayers.addImageryProvider(new FreeDo.WebMapTileServiceImageryProvider({
			url: "http://t0.tianditu.com/cia_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=cia&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default.jpg",
			layer: "tdtAnnoLayer_biaoji",
			style: "default",
			format: "image/png",
			tileMatrixSetID: "tianditu",
			show: true
		}));*/
		
		// cx 添加
		this.flag = true;
		this.selectModels = [];
		this.lastModelId = -2;
		this.cam = [116.00013, 38.998999999999999999999999, 80.75962432438108];
		new Compass(this.viewer);
		
	/*	this.viewer.imageryLayers.addImageryProvider(new FreeDo.WebMapTileServiceImageryProvider({
			url: "http://{s}.tianditu.com/img_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=img&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default&format=tiles",
			subdomains:['t7','t6','t5','t4','t3','t2','t1','t0'],
			maximumLevel: 18,
			show: true
		}));
		this.viewer.imageryLayers.addImageryProvider(new FreeDo.WebMapTileServiceImageryProvider({
			url: "http://t0.tianditu.com/cia_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=cia&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default.jpg",
			layer: "tdtAnnoLayer_biaoji",
			style: "default",
			format: "image/png",
			tileMatrixSetID: "tianditu",
			show: true
		}));*/
		modelTile = this.viewer.scene.primitives.add(new FreeDo.FreeDoPModelset({
			url: "http://192.168.137.1:9999/1013/tanggu_new"
		}));
		
		var lon = 117.6610063067;
		var lat = 39.0296251212;
		
		this.viewer.camera.setView({
			destination :new FreeDo.Cartesian3(-2303190.1885760543,4395138.739032204,3994995.2792255776),
			orientation: {
				heading : 0.000004136064356785596,
				pitch : -1.171440805600418,
				roll : 0.0006527658379926748
			}
		});
		ceshistate =true;
		MainBuildingViewer.right(window.merightclick);
		var imageMaterial = new FreeDo.ImageMaterialProperty ({
			image : "./static/page/designcoordination/mainbuilding/img/tuzhi/jiegoupingmiantu1.png",
			repeat : new FreeDo.Cartesian2(1.0, 1.0),
			transparent : true,
		});
		
		var imageEntity = this.viewer.entities.add({
				show:true,
			    rectangle : {
			        coordinates : FreeDo.Rectangle.fromDegrees(lon, lat, lon+0.0078, lat+0.00333),
			        outline : true,
			        outlineColor : FreeDo.Color.WHITE,
			        outlineWidth : 4,
			        height : 20,
			        rotation : FreeDo.Math.toRadians(0),
			        stRotation : FreeDo.Math.toRadians(180),
			        material : imageMaterial,
			    },
			});
		var hospital1 = this.viewer.entities.add( {  
		    name : '医院1',  
		    position : FreeDo.Cartesian3.fromDegrees( 117.65406261508599,39.0299073545233,15 ),  
		    point : { //点  
		        pixelSize : 5,  
		        color : FreeDo.Color.RED,  
		        outlineColor : FreeDo.Color.WHITE,  
		        outlineWidth : 2  
		    },  
		    label : { //文字标签  
		        text : '天津医科大学总医院',  
		        font : '14pt monospace',  
		        style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
		        outlineWidth : 2,  
		        verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
		        pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
		    },  
		    billboard : { //图标  
		        image : "static/page/designcoordination/mainbuilding/img/tuceng/hispital.svg",  
		        width : 50,  
		        height : 50  
		    },  
		} );
		var hospital2 = this.viewer.entities.add( {  
			name : '医院2',  
			position : FreeDo.Cartesian3.fromDegrees( 117.6524968652495,39.02839132165448,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '天津海河医院',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/hispital.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var police1 = this.viewer.entities.add( {  
			name : '警察局1',  
			position : FreeDo.Cartesian3.fromDegrees( 117.65575555770128, 39.03009236445744,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '天津西车站派出所',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/police.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var police2 = this.viewer.entities.add( {  
			name : '警察局2',  
			position : FreeDo.Cartesian3.fromDegrees( 117.65346121985428, 39.02767696856126,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '天津下瓦房派出所',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/police.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var fire1 = this.viewer.entities.add( {  
			name : '消防局1',  
			position : FreeDo.Cartesian3.fromDegrees(117.65530601763803, 39.02779377137312,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '天津市公安消防局',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/firecontrol.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var fire2 = this.viewer.entities.add( {  
			name : '消防局2',  
			position : FreeDo.Cartesian3.fromDegrees(117.65808325960933, 39.030095945865426,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '天津市保税区公安消防支队',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/firecontrol.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var road1 = this.viewer.entities.add( {  
			name : '道路1',  
			position : FreeDo.Cartesian3.fromDegrees(117.65366853103967, 39.02932398272103,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '解放北路东方华尔街',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/road.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var road2 = this.viewer.entities.add( {  
			name : '道路2',  
			position : FreeDo.Cartesian3.fromDegrees(117.65717660285547, 39.029622371574646,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '估衣街',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/road.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var village1 = this.viewer.entities.add( {  
			name : '村庄1',  
			position : FreeDo.Cartesian3.fromDegrees(117.65982044133891, 39.028640350185064,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '西井峪村',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/village.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var village2 = this.viewer.entities.add( {  
			name : '村庄2',  
			position : FreeDo.Cartesian3.fromDegrees(117.65559299621263, 39.02942625528345,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '崔庄村',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/village.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var water1 = this.viewer.entities.add( {  
			name : '水系1',  
			position : FreeDo.Cartesian3.fromDegrees(117.65443147101222, 39.02762212630358,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '北运河',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/river.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		var village2 = this.viewer.entities.add( {  
			name : '水系2',  
			position : FreeDo.Cartesian3.fromDegrees(117.65066204707234, 39.02692651335879,15 ),  
			point : { //点  
				pixelSize : 5,  
				color : FreeDo.Color.RED,  
				outlineColor : FreeDo.Color.WHITE,  
				outlineWidth : 2  
			},  
			label : { //文字标签  
				text : '海河',  
				font : '14pt monospace',  
				style : FreeDo.LabelStyle.FILL_AND_OUTLINE,  
				outlineWidth : 2,  
				verticalOrigin : FreeDo.VerticalOrigin.BOTTOM, //垂直方向以底部来计算标签的位置  
				pixelOffset : new FreeDo.Cartesian2( 0, -18 )   //偏移量  
			},  
			billboard : { //图标  
				image : "static/page/designcoordination/mainbuilding/img/tuceng/river.svg",  
				width : 50,  
				height : 50  
			},  
		} );
		myviewer = this.viewer;
		modelTile.readyPromise.then(function() {
			moveModel(modelTile,-80,20,4,15,0,0,1,1,1);
		});
		
		$("#zongduanmian").click(function() {
			lon+=0.001;
			imageEntity.rectangle.coordinates = FreeDo.Rectangle.fromDegrees(lon, lat, lon+0.0078, lat+0.00333);
		});
		$("#zhixianceliang").click(function() {
			lat+=0.001;
			imageEntity.rectangle.coordinates = FreeDo.Rectangle.fromDegrees(lon, lat, lon+0.0078, lat+0.00333);
		})
	}
}

var shuxingshuju = [
		{id:"4",componentId:"f9d881e3-914b-11e7-350c-41f03c953867",position:{x: -2194085.358357283, y: 4378020.501802686, z: 4073309.593950244,h:5.35265519096344,p:-0.957659926884252,r:6.278567474111711}},
		{id:"3",componentId:"ed72d504-914b-11e7-350c-41f03c953867",position:{x: -2195060.2573393, y: 4378576.951533875, z: 4073663.174259837,h:5.352722440967762,p:-0.9575901024379618,r:6.2785770863994745}},
		{id:"7",componentId:"ed779002-914b-11e7-350c-41f03c953867",position:{x: -2193793.6199775375, y: 4377914.767535423, z: 4073137.8297135117,h:5.630378750477897,p:-0.5528137024056186,r:6.280823088992896}},
		{id:"6",componentId:"edc8bd46-914b-11e7-350c-41f03c953867",position:{x: -2193708.6772762756, y: 4377904.534220799, z: 4073202.5056291255,h:1.994404289117547,p:-0.6097462455837199,r:0.0036707497876156125}},
		{id:"8",componentId:"f4af8dd0-914b-11e7-350c-41f03c953867",position:{x: -2193811.879911349, y: 4377879.3756989, z: 4073278.261950106,h:2.484639075410328,p:-0.7742439563807868,r:0.0028153183111001567}},
		{id:"9",componentId:"f71913d4-914b-11e7-350c-41f03c953867",position:{x: -2193752.736986991, y: 4377917.714569312, z: 4073448.8325745175,h:3.176375399572854,p:-0.8374943559959638,r:6.283014252876068}},
	];

MainBuildingViewer.changechoserow = function(row){
	if(ceshistate&&modelTile){
		for(i in shuxingshuju){
			if(shuxingshuju[i].id==row.id){
				var componentId = shuxingshuju[i].componentId;
				var redStyle = new FreeDo.FreeDoPModelStyle({color: {conditions: [["${component} === \'" + componentId + "\'", "color('red')"],["true", "color('white')"]]}});
				modelTile.style=redStyle;
				this.viewer.camera.flyTo({
					destination : new FreeDo.Cartesian3(shuxingshuju[i].position.x, shuxingshuju[i].position.y, shuxingshuju[i].position.z),
					orientation: {
						heading : shuxingshuju[i].position.h,
						pitch : shuxingshuju[i].position.p,
						roll : shuxingshuju[i].position.r
					}
				});
			}
		}

	}
}
var catchModelTile =null;
MainBuildingViewer.right = function (callback) {
	var selectComponentEventType = FreeDo.ScreenSpaceEventType.RIGHT_CLICK;
    //var selectComponentEventType = FreeDo.ScreenSpaceEventType.LEFT_DOUBLE_CLICK;
    var that = this;
    this.screenSpaceEventHandler = new FreeDo.ScreenSpaceEventHandler(this.viewer.canvas);
    this.screenSpaceEventHandler.setInputAction(function (movement) {
    	 var picked = myviewer.scene.pick(movement.position);
         if (FreeDo.defined(picked) && picked instanceof FreeDo.FreeDoPModelFeature) {
             var id = picked.getProperty('component');
             if (FreeDo.defined(id)) {
            	 var menu = document.getElementById("menu");
	            //var event = event || window.event;
	            menu.style.display = "block";
	            menu.style.left = movement.position.x+140+"px";
	            menu.style.top = movement.position.y+55+"px";
	            //catchModelTile.push(picked);
	            catchModelTile=id;
             }
         }
    }, selectComponentEventType);
}

MainBuildingViewer.showHideModelsById =function(uid){

	var showhide = new FreeDo.FreeDoPModelStyle({
	    show: {
	      conditions:uid                        		
	
	    }
	  });
	modelTile.style = showhide;
}
MainBuildingViewer.initLeftClick = function(viewer) {
	var screenSpaceEventHandler = new FreeDo.ScreenSpaceEventHandler(viewer.canvas);
	screenSpaceEventHandler.setInputAction(function(movement){
		var pick= new FreeDo.Cartesian2(movement.position.x,movement.position.y);
		var cartesian = viewer.camera.pickEllipsoid(pick, viewer.scene.globe.ellipsoid);
		var cartographic = viewer.scene.globe.ellipsoid.cartesianToCartographic(cartesian);
		var point=[ cartographic.longitude / Math.PI * 180, cartographic.latitude / Math.PI * 180];
		console.log(point);
	}, FreeDo.ScreenSpaceEventType.LEFT_CLICK);
	

}
/**
 * [initModels初始化场景中的模型]
 * @return {[type]} [description]
 */
MainBuildingViewer.initModels = function () {
    $.ajax({
        url: "http://182.92.7.32:9510/ProjectManage/pm/selectAll",
        dataType: "JSON",
        success: function (content) {
            var node = null;
            var modelNode = null;
            var modelParentNode = null;//模型缓存中的父节点
            var container = MainBuildingViewer.modelContainer;

            for (var i = 0; i < content.length; i++) {
                node = content[i];

                modelParentNode = container[node.parentId];
                if (modelParentNode == undefined) {
                    modelParentNode = container[node.parentId] = { children: [] };
                }

                //非叶子节点
                if (node.leaf == 0) {
                    modelNode = new MainBuildingViewer.GroupObj(node.id, node.parentId, node.text, node.type);

                    if (container[node.id] != undefined) {
                        modelNode.children = container[node.id].children;
                    }
                } else {
                    var parameter = JSON.parse(node.attributes.parameter);
                    modelNode = new MainBuildingViewer.ModelObj(node.id, node.parentId, node.text, node.type, "http://182.92.7.32:9510/ProjectManage/models/" + parameter.filePath, parameter.lon, parameter.lat, parameter.height, parameter.course, parameter.alpha, parameter.roll, parameter.scaleX, parameter.scaleY, parameter.scaleZ);
                }

                container[node.id] = modelNode;

                modelParentNode.children.push(modelNode.id);
               
            }
            console.log(container);
        }

    });
}