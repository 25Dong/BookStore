<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布广告</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/backbase.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
</head>
<body>
	<!--导航-->
	<div>
		<nav class="navbar navbar-default ">
		<div class="container">

			<div class="navbar-header navbar-left">
				<h2>网上书店后台管理</h2>
			</div>
			<div class="nav navbar-nav navbar-right">
				<a href="#" class="navbar-brand">网上书店</a>
			</div>
		</div>
		</nav>
	</div>
	<!--导航结束-->
	<!--content start  -->
	<div class="container">
		<div class="jumbotron">
			<h1>后台管理之发布广告</h1>
		</div>
		<!--左边-->
		<div class="row">
			<div class="col-md-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li><a href="manager_dataAnalysis">数据分析</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_user.action">管理用户</a></li>
					<li><a href="manager_findUser.action">查找用户</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_AllBook.action">管理图书</a></li>
					<li><a href="manager_NewBook.action">新书上架</a></li>
					<li><a href="manager_finBook.action">查找图书</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_manOder.action">管理订单</a></li>
					<li class="active3"><a href="#">发布广告</a></li>
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-md-9" id="Oderdetail">

				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">发布新广告</h3>
					</div>
					<div class="panel-body">
						<s:form action="advertise_add.action" method="post"
							enctype="multipart/form-data" theme="simple">
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2 ">广告标题</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="content"
										placeholder="广告内容" required="required">
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-4">
									<s:file name="upload" required="required"></s:file>
									<label class="control-label">上传广告封面图片</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<button type="submit" class="btn btn-lg btn-danger">发布</button>
								</div>
								<div class="col-sm-4">
									<button type="reset" class="btn btn-lg btn-danger">取消</button>
								</div>
							</div>

						</s:form>
					</div>
				</div>
			</div>
		</div>
		<!--content end  -->

		<!--footer-->
		<footer>
		<div id="foot">
			<div class="row">
				<div class="col-xs-12">
					<p>
						Copyright&nbsp;©&nbsp;2014-2017&nbsp;&nbsp;www.zhbit.com&nbsp;&nbsp;京ICP证2014号
						<br /> 地址：北京理工大学珠海学院 | 班级:2014级软件工程5班
					</p>
				</div>
			</div>
		</div>
		</footer>
</body>
</html>