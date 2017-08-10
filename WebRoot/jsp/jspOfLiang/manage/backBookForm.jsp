<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理图书之添加图书</title>
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
			<h1>添加图书</h1>
		</div>
		<!--左边-->
		<div class="row">
			<div class="col-md-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li><a href="manager_dataAnalysis">数据分析</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_user.action">管理用户</a></li>
					<li><a href="manager_findUser.action">查找用户</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_AllBook.action">管理图书</a></li>
					<li  class="active2"><a href="#">新书上架</a></li>
					<li><a href="manager_finBook.action">查找图书</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_manOder.action">管理订单</a></li>
					<li><a href="manager_NewAdvertise">管理公告</a></li>
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-md-9" id="Oderdetail">

				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">新书上架</h3>
					</div>
					<div class="panel-body">
						<s:form action="add_Book" method="post"
							enctype="multipart/form-data" theme="simple">
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2 ">书名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="book.name"
										placeholder="请输入书名" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2 control-label">价格</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="book.price"
										placeholder="请输入书本的单价" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2 control-label">库存量</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="book.bookAmount"
										placeholder="请输入书本的库存量" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2">作者</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="book.author"
										placeholder="请输入书本的作者" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2">出版社</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="book.bookPrss"
										placeholder="请输入书本的出版社" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2">书本简介：</label>
								<div class="col-sm-8">
									 <textarea name="book.bookIntroduction" class="form-control" rows="3" placeholder="请输入书本的简介" required="required" rows=""></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 col-sm-offset-2">类型</label>
								<div class="col-sm-8">
									<s:select name="book.category"
										list="#{'热门小说':'热门小说','人物传记':'人物传记','外国文学':'外国文学','中国文学':'中国文学'}" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-4">
									<s:file name="upload" required="required"></s:file>
									<label class="control-label">上传书本封面图片</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<button type="submit" class="btn btn-lg btn-success">添加</button>
								</div>
								<div class="col-sm-4">
									<button type="reset" class="btn btn-lg btn-danger">取消</button>
								</div>
							</div>

						</s:form>
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