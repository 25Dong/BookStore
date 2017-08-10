<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理全部的用户信息</title>
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
			<h1>所有用户信息</h1>
		</div>
		<!--左边-->
		<div class="row">
			<div class="col-xs-3" id="myScrollspy">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li><a href="manager_dataAnalysis">数据分析</a></li>
					<li>&nbsp;</li>
					<li class="active1"><a href="#">管理用户</a></li>
					<li><a href="manager_findUser.action">查找用户</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_AllBook.action">管理图书</a></li>
					<li><a href="manager_NewBook.action">新书上架</a></li>
					<li><a href="manager_finBook.action">查找图书</a></li>
					<li>&nbsp;</li>
					<li><a href="manager_manOder.action">管理订单</a></li>
					<li><a href="manager_NewAdvertise.action">发布公告</a></li>
					<li><a href="advertise_advertiseList.action">管理公告</a></li>
					<li><a href="javascript:history.go(-1)">返回上一步</a></li>
				</ul>
			</div>

			<div class="col-xs-9">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">所有的用户信息</h3>
					</div>
					<div class="panel-body">
						<table id="allUserTable" align="center">
							<s:set var="index" value="0"></s:set>
							<s:iterator value="list" var="user">
								<s:if test="#index%3==0">
									<tr>
								</s:if>

								<td style="padding: 10px">
									<div class="book">
										<div class="userinfo">
											<s:if test="userPhoto==null">
												<p>该用户还没上传头像！</p>
												<img class="img-circle"
													src="<%=request.getContextPath()%>/images/imagesOfDong/Userdefault.png"/>
											</s:if>
											<s:else>
												<img class="img-circle"
												src="<%=request.getContextPath()%>/upload/<s:property value="userPhoto"/>" />
											</s:else>
											
										</div>
										<hr />
										<div class="content">
											<div class="bookinfocontent">
												<table class="table">
													<caption>该用户的基本信息</caption>

													<tbody>
														<tr>
															<td>用户名：</td>
															<td><s:property value="userName" /></td>
														</tr>
														<tr>
															<td>收件名：</td>
															<td><s:property value="useNickName" /></td>
														</tr>
														<tr>
															<td>电话号码：</td>
															<td><s:property value="userPhone" /></td>
														</tr>
														<tr>
															<td>注册时间：</td>
															<td><s:property value="registDate" /></td>
														</tr>
													</tbody>
												</table>

												<div class="btn-group">
													<button type="button"
														class="btn btn-info dropdown-toggle"
														data-toggle="dropdown">
														操作 <span class="caret"></span>
													</button>
													<ul class="dropdown-menu" role="menu">
														<li><a
															href="<%=request.getContextPath()%>/user_delete.action?userId=<s:property value="userId"/>">删除该用户</a></li>
														<li class="divider"></li>
														<li><a href="#">其他</a></li>
													</ul>
												</div>
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



						<table border="0" cellspacing="0" cellpadding="0" align="center"
							width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a href="user_userList.action?currPage=1">[首页]</a>&nbsp;&nbsp;
       <a
												href="user_userList.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
       </s:if> <s:if test="currPage != totalPage">
											<a
												href="user_userList?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
       <a
												href="user_userList?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
       </s:if>
								</span></td>
							</tr>
						</table>


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
