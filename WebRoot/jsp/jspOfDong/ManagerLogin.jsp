<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<script type="text/javascript">
	function regist(){
		managerForm.action="manager_register.action";
		managerForm.submit();
	}
</script>
</head>
<body>
<div align="center">
	<h3><s:actionerror/></h3>
	<s:form action="manager_login.action" name="managerForm" method="post">
		<s:textfield name="managerName" label="用户名"></s:textfield>
		<s:password name="managerPassword" label="密码"></s:password>
		<input type="submit" value="登录"/>
		<input type="button" value="注册" onclick="regist()" style="display:inline;">
	</s:form>
	
</div>
</body>
</html>