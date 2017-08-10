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
	<div class="container">
		<div class="jumbotron">
			<h1>后台管理所有订单信息</h1>
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
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-xs-9">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">订单信息</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-2">
								<form action="orderAllOrders.action" method="post">
									<button type="submit" class="btn btn-warning">查看全部订单</button>
								</form>
							</div>
							<div class="col-md-2">
								<form action="orderallAlreadyPayOrders.action" method="post">
									<button type="submit" class="btn btn-warning">已支付的订单</button>
								</form>
							</div>
							<div class="col-md-2">
								<form action="orderallNotSendOrders.action" method="post">
									<button type="submit" class="btn btn-warning">未发货的订单</button>
								</form>
							</div>
							<div class="col-md-2">
								<form action="orderallSendingOrders.action" method="post">
									<button type="submit" class="btn btn-warning">已发货的订单</button>
								</form>
							</div>
							<div class="col-md-2">
								<form action="orderallNotEvaluationOrders.action" method="post">
									<button type="submit" class="btn btn-warning">未评价的订单</button>
								</form>
							</div>
							<div class="col-md-2">
								<form action="orderallRefundingOrders.action" method="post">
									<button type="submit" class="btn btn-warning">退货中的订单</button>
								</form>
							</div>
							<div class="col-md-2">
								<form action="orderallEndOrders.action" method="post">
									<button type="submit" class="btn btn-warning">已结束的订单</button>
								</form>
							</div>
						</div>

						<table class="table table-hover">
							<thead>
								<tr>
									<th>订单号</th>
									<th>下单时间</th>
									<th>订单价格</th>
									<th>订单状态</th>
									<th colspan="2">订单操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="orders" var="o" status="stat">
									<tr>
										<td><s:property value="id" /></td>
										<td><s:property value="orderTime" /></td>
										<td><s:property value="orderPrice" /></td>
										<td><s:property value="orderState" /></td>
										<td><a
											href="${pageContext.request.contextPath}/orderdetail?id=${o.id}">订单明细</a></td>
										<s:if test="#o.orderState=='已支付'">
											<td>
												<a href="${pageContext.request.contextPath}/orderacceptOrder?id=${o.id}">接受订单</a>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/ordernotAcceptOrder?id=${o.id}">不接订单</a>
											</td>
										</s:if>
										<s:if test="#o.orderState=='未发货'">
											<td>
												<a href="${pageContext.request.contextPath}/ordersendBooks?id=${o.id}">发货</a>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/ordercancelOrder?id=${o.id}">取消订单</a>
											</td>
										</s:if>
										<s:if test="#o.orderState=='申请退货'">
											<td>
												<a href="${pageContext.request.contextPath}/orderacceptRefund?id=${o.id}">接受退货</a>
											</td>
										</s:if>
									</tr>
								</s:iterator>
							</tbody>
						</table>
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
</body>
</html>
