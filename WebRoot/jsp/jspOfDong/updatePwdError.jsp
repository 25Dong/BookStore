<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><s:property value="userName" />更新密码失败！</title>
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
						<h3 class="panel-title" style="color:red;">
							很抱歉！<s:property value="userName" />
							：您更新密码失败！
						</h3>
					</div>
					<div class="panel-body">
						<p style="font-size: 15px;">提示信息：</p>
						<br>
						<div>
						 	<s:actionerror/>
						 	<br><br>
							<a class="btn btn-info" href="javascript:history.go(-1)" style="text-decorationnone;">返回上一步
								重新填写</a>
							</div>
						</div>
						<br><br><br><br><br><br>
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
