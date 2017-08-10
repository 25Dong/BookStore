<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content ="5;url=<%=request.getContextPath()%>/jsp/jspOfDong/userLogAndReg.jsp">
<title>注册成功后跳转到登录页面</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<script type="text/javascript"> 
var i = 6; function shownum(){ 
i=i-1; document.getElementById("time").innerHTML=i+"秒后自动跳转登陆界面";
setTimeout('shownum()',1000); } 
</script>
</head>
<body onload="shownum()">
<h3>恭喜您：<s:property value="userName" />&nbsp;注册成功！</h3>
<span id="time"></span>
<p>若跳转失败请<a href="<%=request.getContextPath()%>/jsp/jspOfDong/userLogAndReg.jsp">点击这里！</a></p>
</body>
</html>