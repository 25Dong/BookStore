<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后天管理全部的书本信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content ="2;url=<%=request.getContextPath()%>/manager_AllBook.action">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/backbase.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
<script type="text/javascript"> 
var i = 3; function shownum(){ 
i=i-1; document.getElementById("time").innerHTML=i+"秒后自动跳转到后台显示所有图书信息页面";
setTimeout('shownum()',1000); } 
</script>
</head>
<body onload="shownum()">

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
	<div class="container">
		<div class="jumbotron">
			<h1>编辑图书信息成功</h1>
		</div>
		<div class="col-md-12">
			<span id="time"></span>
			<p>
				若跳转失败请<a href="<%=request.getContextPath()%>/manager_AllBook.action">点击这里！</a></p>
		</div>
	</div>

	<!--footer-->
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
	<!--footer-->
</body>
</html>
