<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="refresh" content ="3;url=<%=request.getContextPath()%>/user_edit.action?userId=<s:property value="#session.userid"/>">
<title><s:property value="userName" />修改信息成功！</title>
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
<script type="text/javascript">
	var i = 4;
	function shownum() {
		i = i - 1;
		document.getElementById("time").innerHTML = i + "秒后自动跳转到你的个人主页";
		setTimeout('shownum()', 1000);
	}
</script>
<body onload="shownum()">
	<!--头部  -->
	<div id="head">
		<div><%@include file="../jspOfDong/head2.jsp"%></div>
	</div>

	<div id="content">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							修改成功！
						</h3>
					</div>
					<div class="panel-body">
						<h3 style="font-size: 20px;">
							恭喜您：
							<s:property value="#session.exitUser.userName" />
							&nbsp;修改成功！
						</h3>
						<span id="time" style="font-size: 20px;"></span>
						<br><br><br><br>
						<p style="font-size: 20px;">
							若跳转失败请<a class="btn btn-info" href="<%=request.getContextPath()%>/user_edit.action?userId=<s:property value="#session.userid"/>">点击这里！</a>
						</p>
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
