<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>安全管理</title>
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
	<link rel="stylesheet" href="${ctx }/static/page/common/css/common.css">
	<link rel="stylesheet" href="${ctx }/static/page/common/css/reset.css">
	<link rel="stylesheet" href="${ctx }/static/page/common/IconFont/iconfont.css">
	<link rel="stylesheet" href="${ctx }/static/page/shigongguanli/safe/css/safe.css">
	<!-- end: CSS -->
<script src="${ctx }/static/page/common/js/echarts.common.min.js"></script>
</head>

<body>
	<!-- start: Header -->
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
						<li>
							<a href="${ctx }/toSurveystudyGK">
								<i class="iconfont icon-kcmanager"></i>
								<span class="hidden-tablet">勘测可研</span>
							</a>
						</li>
						<li>
							<a href="${ctx }/toGaikuang">
								<i class="iconfont icon-sheji"></i>
								<span class="hidden-tablet">设计协同</span>
							</a>
						</li>
						<li class="active">
							<a href="${ctx }/toShigongguanliGK">
								<i class="iconfont icon-construct"></i>
								<span class="hidden-tablet">施工管理</span>
							</a>
						</li>
						<li>
							<a href="${ctx }/toYunweiGK">
								<i class="iconfont icon-Refresh"></i>
								<span class="hidden-tablet">运维管理</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->
			<!-- start: Content -->
			<div id="content" class="span10">
				<ul class="breadcrumb">
					<i class="iconfont icon-hxzfont08"></i>
					<li class="lists">
						<a href="${ctx }/toShigongguanliGK">项目概况</a>
						<a href="${ctx }/toEbs">进度管理</a>
						<a href="${ctx }/toPm" >场景管理</a>
						<a href="${ctx }/toSafe" class="activeList">安全管理</a>
						<a href="${ctx }/toDungou">盾构监测</a>
						<a href="${ctx }/toRiskmgmt">风险管理</a>
						<a href="#">质量管理</a>
						<a href="#">成本管理</a>
						<a href="#">合同管理</a>
						<a href="#">施工日志</a>
						<a href="#">项目信息</a>
						<a href="${ctx }/toWorkShow">3D综合展示</a>
					</li>
					<li>
						<div id="div1" class="close1">
							<div id="div2" class="close2"></div>
						</div>
						<span class="twoThree">2D</span>
					</li>
				</ul>
				<div class="row-fluid sortable">
					<div id="left">
						<div class="box span12">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>1</td>
										<td class="center">7号 施工支洞</td>
										<td class="center">易燃物品堆放</td>
										<td class="center">一级</td>
									</tr>

									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->

						<div class="box span12">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全整改详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>整改编号</th>
										<th>整改情况</th>
										<th>整改日期</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>1</td>
										<td class="center">JRXM-JCHC</td>
										<td class="center">整改中</td>
										<td class="center">2016-09-09</td>
									</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->

						<div class="box span12">
							<div class="box-header">
								<h2><i class="halflings-icon white list-alt"></i><span class="break"></span>安全事故分布</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<!-- <div id="piechart" style="height:300px"></div> -->
								<div id="main" style="width: 100%;height:250px;"></div>
							</div>
						</div>
					</div>
					<div id="right">
						<div class="box span6">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="center">2节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="center">3节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->
						<div class="box span6">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="center">4节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="center">5节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->
						<div class="box span6">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>1</td>
										<td class="center">固卷1</td>
										<td class="center">变压器老旧</td>
										<td class="center">一级</td>
									</tr>
									<tr>
										<td>2</td>
										<td class="center">固卷2</td>
										<td class="center">变压器老旧</td>
										<td class="center">一级</td>
									</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->
						<div class="box span6">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>1</td>
										<td class="center">固卷3</td>
										<td class="center">变压器老旧</td>
										<td class="center">一级</td>
									</tr>
									<tr>
										<td>2</td>
										<td class="center">固卷4</td>
										<td class="center">变压器老旧</td>
										<td class="center">一级</td>
									</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->
						<div class="box span6">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="center">6节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="center">7节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->
						<div class="box span6">
							<div class="box-header">
								<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>安全问题详情</h2>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<!--<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>-->
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped table-condensed">
									<thead>
									<tr>
										<th>序号</th>
										<th>WBS名称</th>
										<th>存在隐患</th>
										<th>隐患等级</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="center">8节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="center">9节 闸门</td>
											<td class="center">钢铁腐朽老旧</td>
											<td class="center">一级</td>
										</tr>
									</tbody>
								</table>
								<div class="pagination pagination-centered">
									<ul>
										<li><a href="#">上页</a></li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">下页</a></li>
									</ul>
								</div>
							</div>
						</div><!--/span-->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="${ctx }/static/page/common/js/jquery-1.9.1.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery-migrate-1.0.0.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery-ui-1.10.0.custom.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.ui.touch-punch.js"></script>
	<script src="${ctx }/static/page/common/js/modernizr.js"></script>
	<script src="${ctx }/static/page/common/js/bootstrap.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.cookie.js"></script>
	<script src='${ctx }/static/page/common/js/fullcalendar.min.js'></script>
	<script src='${ctx }/static/page/common/js/jquery.dataTables.min.js'></script>
	<script src="${ctx }/static/page/common/js/excanvas.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.flot.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.flot.pie.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.flot.stack.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.flot.resize.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.chosen.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.uniform.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.cleditor.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.noty.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.elfinder.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.raty.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.iphone.toggle.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.uploadify-3.1.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.gritter.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.imagesloaded.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.masonry.min.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.knob.modified.js"></script>
	<script src="${ctx }/static/page/common/js/jquery.sparkline.min.js"></script>
	<script src="${ctx }/static/page/common/js/counter.js"></script>
	<script src="${ctx }/static/page/common/js/retina.js"></script>
	<script src="${ctx }/static/page/common/js/custom.js"></script>
	<script src="${ctx }/static/page/shigongguanli/safe/js/safe.js"></script>
	<script src="${ctx }/static/page/shigongguanli/safe/js/safepie.js"></script>
</body>

</html>