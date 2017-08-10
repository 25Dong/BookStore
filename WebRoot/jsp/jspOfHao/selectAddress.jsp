<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTdML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>选择地址</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/commentBook.css">
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
</head>
<body>
	<!--头部  -->
	<div id="head">
		<div><%@include file="../jspOfDong/head2.jsp"%></div>
	</div>

	<div id="content">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">请补充你的收货地址：</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" action="usersaveAddress"
							method="post">
							<s:hidden name="order.id" value="%{order.id}"></s:hidden>
							<s:hidden name="order.orderState" value="未确认"></s:hidden>

							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">收货人姓名：</label>
								<div class="col-sm-10">
									<input name="order.userName" type="text" class="form-control" id="firstname"
										placeholder="请输入您的收货人姓名" required="required">
								</div>
							</div>

							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">收货地址：</label>
								<div class="col-sm-10">
									<input name="order.userAddress" type="text" class="form-control" id="firstname"
										placeholder="请输入您的收货地址" required="required">
								</div>
							</div>
							
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">收货电话：</label>
								<div class="col-sm-10">
									<input name="order.userPhone" type="text" class="form-control" id="firstname"
										placeholder="请输入您的收货电话" required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-info">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--脚部  -->
	<div id="foot">
		<div><%@include file="../jspOfDong/foot.jsp"%></div>
	</div>
	<s:debug></s:debug>
</body>
</html>
