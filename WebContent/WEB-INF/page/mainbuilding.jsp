<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctx" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>主体建筑</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->

	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->

	<!-- start: CSS -->
	<link id="bootstrap-style" href="${ctx }/static/page/common/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx }/static/page/common/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${ctx }/static/page/common/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${ctx }/static/page/common/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	    rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	<link rel="stylesheet" href="${ctx }/static/page/common/css/common.css">
	<link rel="stylesheet" href="${ctx }/static/page/common/css/reset.css">
	<link rel="stylesheet" href="${ctx }/static/page/common/IconFont/iconfont.css">
	<link href="http://gbim360.com:9999/projects/FreedoGBIM360/1.0.0-alpha.170626/FreeDo/Widgets/widgets.css" rel="stylesheet">
	<script src="http://gbim360.com:9999/projects/FreedoGBIM360/1.0.0-alpha.170626/FreeDo/FreeDo.js"></script>
	<script src="https://cdn.bootcss.com/lodash.js/4.17.4/lodash.min.js"></script>
	<script src="http://gbim360.com:9999/projects/FreedoGBIM360/1.2.0-beta.170808/API/FreedoX.js"></script>
	<link rel="stylesheet" href="${ctx }/static/webgl/compass/css/compass.css">
	<script src="${ctx }/static/webgl/compass/js/Compass.js"></script>
	<script src="${ctx }/static/page/common/js/FreeDoTool.js"></script>
	<script src="${ctx }/static/page/common/js/jquery-1.9.1.min.js"></script>
	<script src="${ctx }/static/page/designcoordination/mainbuilding/js/MainbuildingViewer.js"></script>
	<script src="${ctx }/static/webgl/pModel/js/move.js"></script>
	<link rel="stylesheet" href="${ctx }/static/page/common/js/zTreeStyle/zTreeStyle.css">
	<script src="${ctx }/static/page/common/js/zTreeStyle/ztree.js"></script>

	<!-- end: Favicon -->

	<link rel="stylesheet" href="${ctx }/static/page/designcoordination/mainbuilding/css/mainbuilding.css">



</head>

<body>
	<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="${ctx }/toIndex"><span>BIM全生命周期管理平台</span></a>

				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-bell"></i>
							</a>
						</li>
						<!-- start: Message Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle"  href="${ctx }/toSet">
								<i class="iconfont icon-set"></i>
							</a>
						</li>
						<!-- start: Notifications Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" href="${ctx }/toIndex">
								<i class="icon-home" style="font-size: 20px"></i>
							</a>
						</li>
						<!-- end: Notifications Dropdown -->
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="halflings-icon white user"></i>李荣
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
									<span>账户设置</span>
								</li>
								<li><a href="#"><i class="halflings-icon user"></i> 文件</a></li>
								<li><a href="${ctx }/loginPage"><i class="halflings-icon off"></i>退出登录</a></li>
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->

			</div>
		</div>
	</div>
	<!-- start: Header -->

	<div class="container-fluid-full">
		<div class="row-fluid">

			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="active" id="structure">
							<a>
								<i class="icon-bar-chart"></i>
								<span class="hidden-tablet">结构</span>
							</a>
						</li>
						<li id="sence">
							<a>
								<i class="icon-envelope"></i>
								<span class="hidden-tablet">场景</span>
							</a>
						</li>
						<li id="remark">
							<a>
								<i class="icon-tasks"></i>
								<span class="hidden-tablet">备注</span>
							</a>
						</li>
							
						<li id="attribute">
							<a>
								<i class="icon-eye-open"></i>
								<span class="hidden-tablet">属性</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->

			<!-- start: Content -->
			<div id="content" class="span10">
			<ul class="breadcrumb">
					<a href="${ctx}/toDesign"><i class="iconfont icon-return"></i>返回</a>
					<li class="lists">
						<a href="#" class="activeList">方案审查</a>
						<a href="${ctx}/toDesign">仿真设计</a>
						<button id="shuchuceshi">ceshi</button>
					</li>
					<li>
						<div id="div1" class="close1">
							<div id="div2" class="close2"></div>
						</div>
						<span class="twoThree">2D</span>
					</li>
					<li class="btnStandard">
   						<input type="button" name="" id="drawing" value="出图" class="btnActive">
					</li>
				</ul>
			
				<div class="row-fluid sortable">
					<div class="box span12 changWidth">
						<div class="box-content">
							<div id="tree" class="ztree"></div>
							<div id="addSence">
								<p>场景组设置</p>
								<p><button>+ 新建场景组</button></p>
								<ul>
									<li>重点工程<i class="iconfont icon-delete8e"></i>
										<ul>
											<li id="zhongdiangc1">电梯设备 <i class="iconfont icon-planefill"></i></li>
											<li id="zhongdiangc2">安检设备 <i class="iconfont icon-planefill"></i></li>
											<li id="zhongdiangc3">闸机设备 <i class="iconfont icon-planefill"></i></li>
											<li id="zhongdiangc4">直升电梯设备 <i class="iconfont icon-planefill"></i></li>
											<li><button>+ 新建视点</button></li>
										</ul>
									</li>
									<li>场景组2 <i  class="iconfont icon-down"></i>

									</li>
									<li>场景组3 <i  class="iconfont icon-down"></i></li>
									<li>场景组4 <i  class="iconfont icon-down"></i></li>

								</ul>
							</div>
							<div id="bInfo">
							<!-- <button id="camerajilu">ceshiceshi</button> -->
								<p><input type="search" placeholder="快速搜索备注"><i class="iconfont icon-search"></i></p>
								<ul>
									<li id="beizhu1">
										<img src="${ctx }/static/page/designcoordination/mainbuilding/img/anjianshebei.png" alt="">
										<p>安检设备皮带断裂。</p>
									</li>
									<li id="beizhu2">
										<img src="${ctx }/static/page/designcoordination/mainbuilding/img/diantishebei.png" alt="">
										<p>楼梯倾斜度过大。</p>
									</li>
									<li id="beizhu3">
										<img src="${ctx }/static/page/designcoordination/mainbuilding/img/zhajishebei.png" alt="">
										<p>闸机设备间距过大。</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="earth">
					</div>
					<div id="attrInfo">
						<ul class="attrList">
							<li class="selectList">属性</li>
							<li>扩展属性</li>
							<li>关联</li>
						</ul>
						<div class="attrText">
							<div>
								<ul>
									<li id = "shuxingmingcheng">名称：钻井柱</li>
									<li>金额：200w</li>
									<li>开始建设时间：2012年2月</li>
									<li>完成建设时间：2013年7月</li>
								</ul>
							</div>
							<div><ul>
								<li>名称：A</li>
								<li>名称：A</li>
								<li>名称：A</li>
								<li>名称：A</li>
							</ul></div>
							<div><ul>
								<li>名称：C</li>
								<li>名称：C</li>
								<li>名称：C</li>
								<li>名称：C</li>
							</ul></div>
						</div>
					</div>
					<div id="showDraw">
					      <p>出图</p >
					      <img src="${ctx }/static/page/designcoordination/mainbuilding/img/zhantingpingmiantu.png" alt="">
					      <p>
					         <input type="checkbox" name="">图例
					         <input type="checkbox" name="">图签
					         <input type="checkbox" name="">其他
					      </p>
					      <button class="downLoad">下载</button>
					 </div>
					
					<div id="edit">
						<p>具体描述: <span>备注类型:设计问题</span></p>
						<textarea >什么什么管和 支架间隔要加大。 业主需要从这里能过去飞机的。 预留出飞机翅膀的空间 。什么什么管和 支架间隔要加大。 业主需要从这里能过去飞机的。 预留出飞机翅膀的空间 。什么什么管和 支架间隔要加大。 业主需要从这里能过去飞机的。 预留出飞机翅膀的空间 。
						</textarea>
						<ul>
							<li><span>创始人：</span>杨强</li>
							<li><span>指派人：</span>张凡茂</li>
							<li><span>当前状态：</span>已修改</li>
							<li><span>创建时间：</span>2017/09/29 11:36:45</li>
							<li><span><i class="iconfont icon-share"></i>分享到：</span>
								<a href=""><i class="iconfont icon-qq"></i></a>
								<a href=""><i class="iconfont icon-wechat"></i></a>
								<a href=""><i class="iconfont icon-weibo"></i></a>
							</li>
						</ul>
						<p>
							<button>修改</button>
							<button>删除</button>
							<button class="closed" >关闭</button>
							<button class="sure">确认</button>
						</p>
					</div>
					<div id="dailog">
						<p>交流记录</p>
						<div class="dialogContent">
							<ul>
								<li>
									<p><span>杨强</span> <span class="sendTime">2017/09/29 11:06:36</span></p>
									<p>飞渡可以创造你的未来！</p>
								</li>
								<li>
									<p><span>张凡茂</span> <span class="sendTime">2017/09/29 11:07:49</span></p>
									<p>这是必然。</p>
								</li>
								<li>
									<p><span>梁策</span> <span class="sendTime">2017/09/29 11:08:10</span></p>
									<p>大家一起努力.</p>
								</li>
								<li>
									<p><span>朱永荃</span> <span class="sendTime">2017/09/29 11:10:35</span></p>
									<p>加油！</p>
								</li>
							</ul>
						</div>
						<div class="sendInfo">
							<textarea id="textInfo" maxlength="80" draggable="false"></textarea>
							<div>
								<p><i class="iconfont icon-smile"></i><i class="iconfont icon-plus"></i></p>
								<button class="send">发送</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<ul id="menu">
	   <li class="hideModel">隐藏模型</li>
	   <li class="showModel">显示模型</li>
	   <li class="menuPz">批注</li>
	   <li class="menuAttr">属性</li>
	   <li class="cad">CAD设计图</li>
	</ul>
	<div id="rMenu">
		<a href="#">生成施工图</a>
		<a href="#">深化设计</a>
	</div>
	<script src="${ctx}/static/page/designcoordination/mainbuilding/js/mainbuilding.js"></script>

</body>

</html>