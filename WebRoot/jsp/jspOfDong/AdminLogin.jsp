<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理员登录</title>
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

	<!--content start  -->
	<div class="container">
		<div class="jumbotron">
			<h1>管理员登录！</h1>
		</div>

		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-8">
				<h3 style="color: red"><s:actionerror/></h3>
				<h3 style="color: red"><s:property value="#session.errorMsg"/></h3>
				<form class="form-horizontal" role="form" action="manager_login.action" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="firstname"
								placeholder="请输入用户名"  name="managerName" required="required">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">密码：</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="lastname"
								placeholder="密码" name="managerPassword" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!--content end  -->
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