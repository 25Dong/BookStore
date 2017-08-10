<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理图书之编辑图书封面</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/backbase.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
</head>
<body>
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
	<!--导航结束-->
	<!--content start  -->
	<div class="container">
		<div class="jumbotron">
			<h1>更换图书封面</h1>
		</div>
		<!--左边-->
		<div class="row">
			<div class="col-md-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li class="active1"><a href="#">更新封面</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-md-9" id="Oderdetail">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">更新图书信息</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<p>目前的书本的封面</p>
								<img style="width: 230px;height: 310px"
									src="<%=request.getContextPath()%>/upload/<s:property value="book.photoname"/>" />
							</div>
							<div class="col-md-8">
								<s:form action="editPhoto_Book" method="post" theme="simple" enctype="multipart/form-data" >
									<s:hidden name="book.id" value="%{book.id}"></s:hidden>
									<s:hidden name="book.name" value="%{book.name}"></s:hidden>
									<s:hidden name="book.price" value="%{book.price}"></s:hidden>
									<s:hidden name="book.author" value="%{book.author}"></s:hidden>
									<s:hidden name="book.category" value="%{book.category}"></s:hidden>
									<s:hidden name="book.bookPrss" value="%{book.bookPrss}"></s:hidden>
									<s:hidden name="book.bookSales" value="%{book.bookSales}"></s:hidden>
									<s:hidden name="book.bookAmount" value="%{book.bookAmount}"></s:hidden>
									<s:hidden name="book.bookIntroduction" value="%{book.bookIntroduction}"></s:hidden>
									<s:hidden name="book.bookShelvetDate"
										value="%{book.bookShelvetDate}"></s:hidden>
									<s:file name="upload" required="required"></s:file>
							<div class="col-md-12" style="height: 10px;">
										
									</div>
								<div class="col-md-12">
										<button type="submit" class="btn btn-primary">上传新图片</button>
									</div>

								</s:form>
							</div>

						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<!--content end  -->

	<!--footer-->
	<footer>
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
	</footer>
</body>
</html>