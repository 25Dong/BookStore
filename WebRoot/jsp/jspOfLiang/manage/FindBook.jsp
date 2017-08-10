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
			<h1>查找图书</h1>
		</div>

		<div class="row">
			<!--左边-->
			<div class="col-md-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li><a href="manager_dataAnalysis">数据分析</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_user.action">管理用户</a></li>
					<li><a href="manager_findUser.action">查找用户</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_AllBook.action">管理图书</a></li>
					<li><a href="manager_NewBook.action">新书上架</a></li>
					<li class="active2"><a href="#">查找图书</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_manOder.action">管理订单</a></li>
					<li><a href="manager_NewAdvertise">管理公告</a></li>
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div class="col-md-12">
					<div class="panel  panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">查找图书</h3>
						</div>
						<div class="panel-body">
							<div class="col-md-12">
								<s:form action="categorylist_Book" method="post" theme="simple">
									<div class="col-md-6">
										<s:select name="book.category"
											list="#{'热门小说':'热门小说','人物传记':'人物传记','外国文学':'外国文学','中国文学':'中国文学'}" />
									</div>
									<div class="col-md-6">
										<button type="submit" class="btn btn-success">按类型查找</button>
									</div>
								</s:form>
							</div>
							<div class="col-md-12" style="height: 10px"></div>
							<div class="col-md-12">
								<form action="findLikeBook_Book" method="post">
									<div class="col-md-6">
										<input type="text" class="form-control" name="book.name"
											placeholder="请输入需要查找的书名">
									</div>
									<div class="col-md-6">
										<button type="submit" class="btn btn-success">按书名查找</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12">
					<div class="panel  panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">查找图书结果</h3>
						</div>
						<div class="panel-body">
							<s:if test="list.size==0">
								<p>抱歉！书店中不在该书本！</p>
								<p>
									<a href="manager_NewBook.action">点击这里！</a>上架新书
								</p>
							</s:if>
							<s:else>
								<table id="findbooKReinfo">
									<s:set var="index" value="0"></s:set>
									<s:iterator value="list" var="b" status="bookstat">
										<s:if test="#index%3==0">
											<tr>
										</s:if>
										<td style="padding: 10px">
											<div class="book">
												<div class="bookinfo" align="center">
													<img
														src="<%=request.getContextPath()%>/upload/<s:property value="photoname"/>" />
												</div>
												<hr />
												<div class="bookinfocontent">
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
								</table>
								<s:if test="bookFlag==1">
									<table border="0" cellspacing="0" cellpadding="0"
										align="center" width="700">
										<tr>
											<td align="center"><span>第<s:property
														value="currPage" />/<s:property value="totalPage" />页
											</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
												<span> <s:if test="currPage != 1">
														<a
															href="categorylist_Book.action?currPage=1&book.category=<s:property value="list.get(0).category"/>">[首页]</a>&nbsp;&nbsp;
    												<a
															href="categorylist_Book.action?currPage=<s:property value="currPage-1"/>&book.category=<s:property value="list.get(0).category"/>">[上一页]</a>&nbsp;&nbsp;
     										     </s:if> <s:if test="currPage != totalPage">
														<a
															href="categorylist_Book.action?currPage=<s:property value="currPage+1"/>&book.category=<s:property value="list.get(0).category"/>">[下一页]</a>&nbsp;&nbsp;
     											    <a
															href="categorylist_Book.action?currPage=<s:property value="totalPage"/>&book.category=<s:property value="list.get(0).category"/>">[尾页]</a>&nbsp;&nbsp;
     										    </s:if>
											</span></td>
										</tr>
									</table>
								</s:if>
								<s:elseif test="bookFlag==2">
									<table border="0" cellspacing="0" cellpadding="0"
										align="center" width="700">
										<tr>
											<td align="center"><span>第<s:property
														value="currPage" />/<s:property value="totalPage" />页
											</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
												<span> <s:if test="currPage != 1">
														<a
															href="findLikeBook_Book.action?currPage=1&book.name=<s:property value="#session.likeBookName"/>">[首页]</a>&nbsp;&nbsp;
    												    <a
															href="findLikeBook_Book.action?currPage=<s:property value="currPage-1"/>&book.name=<s:property value="#session.likeBookName"/>">[上一页]</a>&nbsp;&nbsp;
     										          </s:if> <s:if test="currPage != totalPage">
														<a
															href="findLikeBook_Book.action?currPage=<s:property value="currPage+1"/>&book.name=<s:property value="#session.likeBookName"/>">[下一页]</a>&nbsp;&nbsp;
     											        <a
															href="findLikeBook_Book.action?currPage=<s:property value="totalPage"/>&book.name=<s:property value="#session.likeBookName"/>">[尾页]</a>&nbsp;&nbsp;
     										         </s:if>
											</span></td>
										</tr>
									</table>
								</s:elseif>
							</s:else>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--content end  -->
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
	<s:debug></s:debug>
</body>
</html>