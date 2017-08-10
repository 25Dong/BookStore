<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>订单明细</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/OderDetail.css">
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
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">我的订单详情</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<tr>
								<td style="height: 50px">订单号</td>
								<td>下单时间</td>
								<td>订单价格</td>
								<td>订单状态</td>
								<s:if test="order.orderState!='未确认'">
									<td>收件人名称</td>
									<td>收件人地址</td>
									<td>收件人电话</td>
								</s:if>
							</tr>
							<tr>
								<td><s:property value="order.id" /></td>
								<td><s:property value="order.orderTime" /></td>
								<td><s:property value="order.orderPrice" /></td>
								<td><s:property value="order.orderState" /></td>
								<s:if test="order.orderState!='未确认'">
									<td><s:property value="order.userName" /></td>
									<td><s:property value="order.userAddress" /></td>
									<td><s:property value="order.userPhone" /></td>
								</s:if>
							</tr>
						</table>
						<table class="table table-bordered">
							<tr>
								<td style="height: 25px">图书名</td>
								<td>图书价格</td>
								<td>图书作者</td>
								<td>图书数量</td>
								<td>图书图片</td>
							</tr>
							<s:iterator value="books" var="b" status="stat">
								<tr>
									<td width="166px;"><s:property value="name" /></td>
									<td width="166px;"><s:property value="price" /></td>
									<td width="166px;"><s:property value="author" /></td>
									<td width="166px;"><s:property
											value="numbers[#stat.index]" /></td>
									<td><img width="100px;" height="150px"
										src="<%=request.getContextPath()%>/upload/<s:property value="photoname"/>" /></td>
									<s:if test="order.orderState=='交易成功'">
										<s:if test="ifcomment[#stat.index]==1">
											<td>你已评论</td>
										</s:if>
										<s:else>
											<td>
											<a class="btn btn-success" href="${pageContext.request.contextPath}/jsp/jspOfLiang/commentBook.jsp?id=<s:property value="id"/>
											&orderid=<s:property value="order.id" />">评价图书</a>
											</td>
										</s:else>
									</s:if>
								</tr>
							</s:iterator>
						</table>
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
