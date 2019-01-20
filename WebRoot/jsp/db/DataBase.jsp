<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP连接数据库与测试</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://47.95.13.238:3306/test?useUnicode=true&characterEncoding=utf-8"
     user="mark"  password="7561669Dong!"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from websites;
</sql:query>
<h1>JSP 数据库实例 - 菜鸟教程</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>站点名</th>
   <th>站点地址</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.url}"/></td>
</tr>
</c:forEach>
</table>

</body>
</html>