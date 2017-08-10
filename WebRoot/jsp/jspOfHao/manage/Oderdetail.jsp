

<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理全部的订单信息</title>
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

	<!--主要内容开始  -->
	<div class="container">
		<div class="jumbotron">
			<h1>后台管理之订单明细</h1>
		</div>
		<!--左边-->
		<div class="row">
			<div class="col-xs-3" id="myScrollspy">
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
					<li class="active5"><a href="#">管理订单</a></li>
				    <li><a href="manager_NewAdvertise.action">发布公告</a></li>
					<li><a href="#section-5">管理其他</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-xs-9" id="Oderdetail">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">订单明细</h3>
					</div>
					<div class="panel-body">
						<table border="1">
							<tr>
								<td style="height: 50px">订单号</td>
								<td>下单时间</td>
								<td>订单价格</td>
								<td>订单状态</td>
								<td>收件人名称</td>
								<td>收件人地址</td>
								<td>收件人电话</td>
							</tr>
							<tr>
								<td><s:property value="order.id" /></td>
								<td><s:property value="order.orderTime" /></td>
								<td><s:property value="order.orderPrice" /></td>
								<td><s:property value="order.orderState" /></td>	
								<td><s:property value="order.userName" /></td>
								<td><s:property value="order.userAddress" /></td>
								<td><s:property value="order.userPhone" /></td>	
							</tr>
						</table>
						<table border="1">
							<tr>
								<td style="height: 25px">图书名</td>
								<td>图书价格</td>
								<td>图书作者</td>
								<td>图书数量</td>
								<td>图书图片</td>
							</tr>
							<s:iterator value="books" var="b" status="stat">
								<tr>
									<td width="166px;"><s:property value="name" /></td>
									<td width="166px;"><s:property value="price" /></td>
									<td width="166px;"><s:property value="author" /></td>
									<td width="166px;"><s:property
											value="numbers[#stat.index]" /></td>
									<td><img width="100px;" height="150px"
										src="upload/<s:property value="photoname"/>" /></td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>

			</div>
		</div>
		<!--主要内容结束 -->
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
</body>
</html>
