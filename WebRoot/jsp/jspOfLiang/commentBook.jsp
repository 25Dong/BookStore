<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/commentBook.css">
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
<title>评论订单</title>
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
						<h3 class="panel-title">请给出您的评论：</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" action="comment_Book"
							method="post">
							<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
						    <input type="hidden" name="orderid" value="<%=request.getParameter("orderid")%>">
							<div class="form-group">
								<label class="col-sm-2 control-label">内容：</label>
								<div class="col-sm-10">
									<textarea name="comment.comment" class="form-control" rows="5" required="required"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">级别：</label>
								<div class="col-sm-10">
									<select name="comment.level">
										<option value="好评">好评</option>
										<option value="中评">中评</option>
										<option value="差评">差评</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-info">提交评论</button>
								</div>
							</div>
						</form>
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