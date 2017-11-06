$(function () {
	var h = $(".container-fluid-full").height();
	var h1 = $("#content .breadcrumb").height();
	$("#tree").height(h - h1 - 24);
	 ShowViewer.init("earth"); // 加载球模型
	 ShowViewer.initLeftClick(globalviewer,showlabel);
	 globalviewer.camera.setView( 
				{
					destination : new FreeDo.Cartesian3(-2183570.5850746077,4471852.254049122,3990050.5935917823),
				    orientation : {
				        heading : 6.283061736872095,
				        pitch : -0.7852936750535262,
				        roll : 0.00010838690093617487
				    }
				});
    var h = $(".container-fluid-full").height();
    var h1 = $("#content .breadcrumb").height();
    $("#tree").height(h - h1 - 24);
	$.ajax({
		url: "static/page/surveystudy/show/show.json",
		type: "get",
        dataType:"json",
		success: function (data) {
			var zTreeObj;
			var setting = {
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pId",
						rootPId: "0"
					}
				},
			check:{
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "p", "N": "s" }
			},
			callback:{
				onCheck:function(event, treeId, treeNode){
					$(".msgInfo").hide();
					 checkflag =treeNode.checked;
					switch (treeNode.id) {
					case 7:
						globalviewer.zoomTo(water[0]);
						 if(checkflag){
				    		 water[0].show=true;
				    	 }else{
				    		 water[0].show=false;
				    	 }
						break;
					case 8:
						globalviewer.zoomTo(water[1]);
						 if(checkflag){
				    		 water[1].show=true;
				    	 }else{
				    		 water[1].show=false;
				    	 }
						break;
					case 10:
						globalviewer.zoomTo(environment[0]);
						 if(checkflag){
				    		 environment[0].show=true;
				    	 }else{
				    		 environment[0].show=false;
				    	 }
						break;
					case 11:
						globalviewer.zoomTo(environment[1]);
						 if(checkflag){
				    		 environment[1].show=true;
				    	 }else{
				    		 environment[1].show=false;
				    	 }
						break;
					case 12:
						globalviewer.zoomTo(environment[2]);
						 if(checkflag){
				    		 environment[2].show=true;
				    	 }else{
				    		 environment[2].show=false;
				    	 }
						break;
					case 13:
						globalviewer.zoomTo(environment[3]);
						 if(checkflag){
				    		 environment[3].show=true;
				    	 }else{
				    		 environment[3].show=false;
				    	 }
						break;
					case 14:
						globalviewer.zoomTo(environment[4]);
						 if(checkflag){
				    		 environment[4].show=true;
				    	 }else{
				    		 environment[4].show=false;
				    	 }
						break;

					default:
						break;
					}
				},
				onClick:function(event, treeId, treeNode){
					$(".msgInfo").hide();
					switch (treeNode.id) {
					case 3:
						ShowViewer.fly(globalviewer,115.999,39.001,70,function(){});
						break;
					case 4:
						ShowViewer.fly(globalviewer,116.001,39,70,function(){});
						break;
					case 5:
						ShowViewer.fly(globalviewer,116.002,39.002,70,function(){});
						break;
					case 7:
						globalviewer.zoomTo(water[0]);
						break;
					case 8:
						globalviewer.zoomTo(water[1]);
						break;
					case 10:
						globalviewer.zoomTo(environment[0]);
						break;
					case 11:
						globalviewer.zoomTo(environment[1]);
						break;
					case 12:
						globalviewer.zoomTo(environment[2]);
						break;
					case 13:
						globalviewer.zoomTo(environment[3]);
						break;
					case 14:
						globalviewer.zoomTo(environment[4]);
						break;
						
					default:
						break;
					}
				}
			}
			};
			zTreeObj = $.fn.zTree.init($("#tree"), setting, data);
			zTreeObj.checkAllNodes(true);
			zTreeObj.expandAll(true);
		}
	})
   
});
function showlabel(data,data2){
	if(data!=null){
			let left = data.x+260;
			let top = data.y-180;
			if(top<70){
				top=70;
			}
			let	name = data2.id.name;
			if(data2.id=="钻井柱1_0"){
				$(".msgInfo").html("名称：粉质粘土<br>深度：180米<br>厚度：20米<br>标高：11米");
			}else if(data2.id=="钻井柱1_1"){
				$(".msgInfo").html("名称：泥岩<br>深度：-95米<br>厚度：5米<br>标高：9米");
			}else if(data2.id=="钻井柱1_2"){
				$(".msgInfo").html("名称：沙岩<br>深度：-87米<br>厚度：13米<br>标高：15米");
			}else if(data2.id=="钻井柱1_3"){
				$(".msgInfo").html("名称：素填土<br>深度：-90米<br>厚度：10米<br>标高：10米");
			}else if(data2.id=="钻井柱1_4"){
				$(".msgInfo").html("名称：强风华带<br>深度：198米<br>厚度：2米<br>标高：8米");
			}else if(data2.id=="钻井柱2_0"){
				$(".msgInfo").html("名称：粉质粘土<br>深度：-98米<br>厚度：2米<br>标高：11米");
			}else if(data2.id=="钻井柱2_1"){
				$(".msgInfo").html("名称：泥岩<br>深度：-95米<br>厚度：5米<br>标高：9米");
			}else if(data2.id=="钻井柱2_2"){
				$(".msgInfo").html("名称：沙岩<br>深度：-97米<br>厚度：3米<br>标高：15米");
			}else if(data2.id=="钻井柱2_3"){
				$(".msgInfo").html("名称：素填土<br>深度：-90米<br>厚度：10米<br>标高：10米");
			}else if(data2.id=="钻井柱2_4"){
				$(".msgInfo").html("名称：强风华带<br>深度：-98米<br>厚度：2米<br>标高：8米");
			}else if(data2.id=="钻井柱3_0"){
				$(".msgInfo").html("名称：粉质粘土<br>深度：28米<br>厚度：20米<br>标高：11米");
			}else if(data2.id=="钻井柱3_1"){
				$(".msgInfo").html("名称：泥岩<br>深度：13米<br>厚度：5米<br>标高：9米");
			}else if(data2.id=="钻井柱3_2"){
				$(".msgInfo").html("名称：沙岩<br>深度：21米<br>厚度：13米<br>标高：15米");
			}else if(data2.id=="钻井柱3_3"){
				$(".msgInfo").html("名称：素填土<br>深度：18米<br>厚度：10米<br>标高：10米");
			}else if(data2.id=="钻井柱3_4"){
				$(".msgInfo").html("名称：强风华带<br>深度：28米<br>厚度：20米<br>标高：8米");	
			}else if(name=="baiyangdianshuiwenbaohu"){
			$(".msgInfo").html("水源地名称：白洋淀水文保护<br>水源所在地：白洋淀<br>取水口名称：水二场取水号<br>设计能力：23万吨/日");
		}else if(name=="daqingheshuiwenbaohu"){
			$(".msgInfo").html("水源地名称：大清河水文保护<br>水源所在地：大清河<br>取水口名称：水二场取水号<br>设计能力：15万吨/日");
		}else if(name=="gaoxiaowangcunchaiquanqu"){
			$(".msgInfo").html("征地编号：高小王村拆迁区<br>结构物名称：房屋<br>单位：m²");
		}else if(name=="zhangweizhuangtoucunchaiqianqu1"){
			$(".msgInfo").html("征地编号：张巍庄头村拆迁区1<br>结构物名称：房屋<br>单位：m²");
		}else if(name=="zhangweizhuangtoucunchaiqianqu2"){
			$(".msgInfo").html("征地编号：张巍庄头村拆迁区2<br>结构物名称：房屋<br>单位：m²");
		}else if(name=="xiaoyangcunchaiqianqu"){
			$(".msgInfo").html("征地编号：小阳村村拆迁区<br>结构物名称：房屋<br>单位：m²");
		}else if(name=="dayangcunchaiqianqu"){
			$(".msgInfo").html("征地编号：大阳村村拆迁区<br>结构物名称：房屋<br>单位：m²");
		}else if(name=="钻井柱1"){
			$(".msgInfo").html("钻孔编号：钻井柱1<br>日期：2017-9-22<br>钻孔深度：-100<br>孔口高程：113")
		}else if(name=="钻井柱2"){
			$(".msgInfo").html("钻孔编号：钻井柱2<br>日期：2017-9-23<br>钻孔深度：-100<br>孔口高程：103")
		}else{
			$(".msgInfo").html("钻孔编号：钻井柱3<br>日期：2017-9-24<br>钻孔深度：8<br>孔口高程：113")
		}
		$(".msgInfo").css({
			"left" : left,
			"top" : top,
			"z-index" : 1
		}).show();
	}else{
		return;
	}
    
     
}
