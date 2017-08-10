<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎您来到-BookShop！</title>
</head>
<body>
	<div id="head">
		<div><%@include file="head.jsp"%></div>
	</div>
	<div id="content">
		<div class="janeshop">
			<div><%@include file="Catalog.jsp"%></div><!-- 左边商品分别的静态页面 -->
			<div><%@include file="Imageroll.jsp"%></div><!-- 中间的广告栏静态页面-->
			<div><%@include file="JnBrand.jsp"%></div><!--显示所有图书的页面-->
		</div>
	</div>
	<div id="foot">
		<div><%@include file="foot.jsp"%></div>
	</div>
</body>
</html>