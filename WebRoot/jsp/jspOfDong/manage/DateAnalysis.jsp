<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理全部的用户信息</title>
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
<body data-spy="scroll" data-target="#myScrollspy">

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
	<div class="container">
		<div class="jumbotron">
			<h1>系统数据分析</h1>
		</div>
		<!--左边-->
		<div class="row">
			<div class="col-xs-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li class="active1"><a href="#">数据分析</a></li>
					<li>&nbsp;</li>
					<li><a href="user_userList">管理用户</a></li>
					<li><a href="manager_findUser.action">查找用户</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_AllBook.action">管理图书</a></li>
					<li><a href="manager_NewBook.action">新书上架</a></li>
					<li><a href="manager_finBook.action">查找图书</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_manOder.action">管理订单</a></li>
					<li><a href="manager_NewAdvertise.action">发布公告</a></li>
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-xs-9">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">数据分析</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<table class="table">
								<tbody>
									<tr class="active" style="height: 90px;">
										<td>注册用户总人数：</td>
										<td><s:property value="userCount" />(人)</td>
										<td><a class="btn btn-info" href="user_userList.action">查看详情
										</a></td>
									</tr>
									<tr class="success" style="height: 85px;">
										<td>上架的书本总数：</td>
										<td><s:property value="bookCount" />(本)</td>
										<td><a class="btn btn-success" href="manager_AllBook.action">查看详情
										</a></td>
									</tr>
									<tr class="danger" style="height: 80px;">
										<td>交易成功的订单数：</td>
										<td><s:property value="orderSuccess" />(单)</td>
										<td><a class="btn btn-danger" href="manager_manOder.action">查看详情
										</a></td>
									</tr>
									<tr class="active" style="height: 75px;">
										<td>销售总数：</td>
										<td><s:property value="sales" />(本)</td>
										<td></td>
									</tr>
									<tr class="warning" style="height: 70px;">
										<td>书店总收入：</td>
										<td><s:property value="income" />(元)</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

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
		<!--footer-->
		<s:debug></s:debug>
</body>
</html>
