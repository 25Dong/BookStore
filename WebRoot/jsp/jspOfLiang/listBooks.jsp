

<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>全部图书</title>
	
</head>
<body>
<h3>全部图书</h3>

<table id="t1" width="300" border="1" align="center">
	<s:set var="index" value="0"></s:set>
	<s:iterator value="books" var="b" status="bookstat">
	<s:if test="#index%3==0">
		<tr>
	</s:if>
		
			<td style="padding: 10px">
				<div class="book">
				<div class="picture">
				<img src="upload/<s:property value="photoname"/>" style="width: 200px"/>

				</div>
				<div class="content"> 
				<label>书名:<s:property value="name"/></label><br>
				<label>价格:<s:property value="price"/></label><br>
				<label>作者:<s:property value="author"/></label><br>
				<a href="${pageContext.request.contextPath}/add_Car?bookid=${b.id}">添加到购物车</a>
				</div>
				</div>
			</td>
		<s:elseif test="#index%3==2||#bookstat.last">
			</tr>
		</s:elseif>	
	<s:set var="index" value="#index+1"/>
	</s:iterator>
	
	<tr>
		<s:a href="list_Book.action?currentpage=%{currentpage+1}">后一页</s:a>
	</tr>
	<tr>
		<s:a href="list_Book.action?currentpage=%{currentpage-1}">前一页</s:a>
	</tr>
</table>
<s:debug></s:debug>
</body>
</html>
