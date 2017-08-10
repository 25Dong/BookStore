<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理全部的书本信息</title>
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
<body data-spy="scroll" data-target="#myScrollspy">

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
	<div class="container">
		<div class="jumbotron">
			<h1>所有图书信息</h1>
		</div>

		<div class="row">
			<!--左边-->
			<div class="col-xs-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li><a href="manager_dataAnalysis">数据分析</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_user.action">管理用户</a></li>
					<li><a href="manager_findUser.action">查找用户</a></li>
					<li>&nbsp;</li>
					<li  class="active2"><a href="#">管理图书</a></li>
					<li><a href="manager_NewBook.action">新书上架</a></li>
					<li><a href="manager_finBook.action">查找图书</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_manOder.action">管理订单</a></li>
					<li><a href="manager_NewAdvertise">管理公告</a></li>
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-xs-9">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">本书店所有的图书信息</h3>
					</div>
					<div class="panel-body">
						<table id="bookTable" align="center">
							<s:set var="index" value="0"></s:set>
							<s:iterator value="list" var="user">
								<s:if test="#index%3==0">
									<tr>
								</s:if>

								<td style="padding: 10px">
									<div class="book">
										<div class="bookinfo">
											<img
												src="<%=request.getContextPath()%>/upload/<s:property value="photoname"/>" />
										</div>
										<hr />
										<div class="userinfocontent">
											<table class="table">
												<caption>书本的基本信息</caption>

												<tbody>
													<tr>
														<td>书名：</td>
														<td><s:property value="name" /></td>
													</tr>
													<tr>
														<td>价格：</td>
														<td><s:property value="price" /></td>
													</tr>
													<tr>
														<td>作者：</td>
														<td><s:property value="author" /></td>
													</tr>
													<tr>
														<td>所属种类：</td>
														<td><s:property value="category" /></td>
													</tr>
													<tr>
														<td>销量：</td>
														<td><s:property value="bookSales" /></td>
													</tr>
													<tr>
														<td>库存量：</td>
														<td><s:property value="bookAmount" /></td>
													</tr>
													<tr>
														<td>出版社：</td>
														<td><s:property value="bookPrss" /></td>
													</tr>
													<tr>
														<td>上架时间：</td>
														<td><s:property value="bookShelvetDate" /></td>
													</tr>
												</tbody>
											</table>

											<div class="btn-group">
												<button type="button"
													class="btn btn-success dropdown-toggle"
													data-toggle="dropdown">
													操作 <span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a
														href="<%=request.getContextPath()%>/findbook_Book.action?id=<s:property value="id"/>">更新图书</a></li>
													<li class="divider"></li>
													<li><a
														href="<%=request.getContextPath()%>/findbookPhotoEdit_Book.action?id=<s:property value="id"/>">更新封面</a></li>
													<li class="divider"></li>
													<li><a
														href="<%=request.getContextPath()%>/delete_Book.action?id=<s:property value="id"/>">删除图书</a></li>
													<li class="divider"></li>
													<li><a href="#">其他</a></li>
												</ul>
											</div>
										</div>
									</div>
								</td>
								<s:elseif test="#index%3==2||#bookstat.last">
									</tr>
								</s:elseif>
								<s:set var="index" value="#index+1" />
							</s:iterator>

							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a href="manager_AllBook.action?currPage=1">[首页]</a>&nbsp;&nbsp;
     									    <a
												href="manager_AllBook.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
       </s:if> <s:if test="currPage != totalPage">
											<a
												href="manager_AllBook.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
       <a
												href="manager_AllBook.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
       </s:if>
								</span></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


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
	<!--footer-->
</body>
</html>
