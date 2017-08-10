<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/css/cssOfDong/headreset.css">
<link rel="stylesheet" href="<%=basePath%>/css/cssOfDong/headmain.css">
<link rel="stylesheet"
	href="<%=basePath%>/css/cssOfDong/skin/skin_0.css" type="text/css"
	id="cssfile" />
<link rel="stylesheet"
	href="<%=basePath%>/Tools/toolsOfDong/font-awesome-4.7.0/css/font-awesome.min.css"
	type="text/css" id="cssfile" />
<!-- header效果 -->
<script src="Tools/toolsOfDong/bootstrap.min.js"></script>
<script src="Tools/toolsOfDong/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>Tools/toolsOfDong/jquery.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/Tools/toolsOfDong/jquery.cookie.js"
	type="text/javascript"></script>
<script src="<%=basePath%>scripts/scriptsOfDong/header.js"
	type="text/javascript"></script>
<title>这是页面的头部</title>
</head>
<body>
	<div id="header">
		<s:if test="#session.username!=null">

			<div id="userdiv">
				<div class="dropdown">
					<span><i class="fa fa-hand-o-down"></i>&nbsp;欢迎您:&nbsp;<s:property
							value="#session.username" />回来！ </span>
					<s:if test="#session.exitUser.userPhoto!=null">
						<img style="width: 25px;height: 25px" class="img-circle"
							src="<%=request.getContextPath()%>/upload/<s:property value="#session.exitUser.userPhoto"/>" />
					</s:if>
					<s:else>
						<img style="width: 25px;height: 25px" class="img-circle"
							src="<%=request.getContextPath()%>/images/imagesOfDong/Userdefault.png" />
						
					</s:else>
					<div class="dropdown-content" style=" z-index:101;">
						<p>
							<i class="fa fa-home fa-fw"></i><a
								href="<%=basePath%>user_edit.action?userId=<s:property value="#session.userid"/>">我的主页</a>
						</p>
						<hr>
						<p>
							<i class="fa fa-hourglass-3"></i><a href="userallOrders.action">我的订单</a>
						</p>
						<hr>
						<p>
							<i class="fa fa-shopping-bag"></i><a href="list_Car.action">我的购物车</a>
						</p>
					</div>
				</div>
				&nbsp;&nbsp;
				<a href="list_Car.action"><i class="fa fa-shopping-bag"></i>我的购物车</a>&nbsp;&nbsp;
				<a href="userallOrders.action"><i class="fa fa-hourglass-3"></i>我的订单</a>&nbsp;&nbsp;
				<i class="fa fa-bank"></i>企业采购&nbsp;&nbsp; <i class="fa fa-user-o"></i>客户服务
				<a href="user_exitLogin.action"><i class="fa fa-hand-stop-o"></i>退出</a>&nbsp;&nbsp;
			</div>
		</s:if>
		<s:else>
			<div id="userdiv">
				<a
					href="<%=request.getContextPath()%>/jsp/jspOfDong/userLogAndReg.jsp"><i
					class="fa fa-user-circle"></i>&nbsp;登录</a> <a
					href="<%=request.getContextPath()%>/jsp/jspOfDong/userLogAndReg.jsp"><i
					class="fa fa-user-circle-o"></i>&nbsp;注册</a>
			</div>
		</s:else>




		<div class="contWidth">
			<a href="#nogo" class="logo"> <img alt="Book Shop"
				src="<%=basePath%>/images/imagesOfDong/bookshoplogo.png">
			</a>
			<!-- 导航菜单 -->
			<div id="nav" class="mainNav">
				<ul class="nav">
					<li><a href="advertise_findAds.action">首 页<i
							class="fa fa-home fa-fw"></i></a></li>
					<li><a href="#">图书排行榜<i class="fa fa-chevron-down"></i></a>
						<div class="jnNav">
							<div class="subitem">
								<dl class="fore">
									<dt>
										<a href="#nogo">排行榜：</a>
									</dt>
									<dd>
										<em><a href="bookSales_Book.action">销量排行<i
												class="fa fa-arrow-up"></i></a></em>
								</dl>
								<dl>
									<dt>
										<a href="#nogo">价格排行：</a>
									</dt>
									<dd>
										<em><a href="PriceIncrease_Book.action">价格升序<i
												class="fa fa-chevron-up"></i></a></em> <em><a
											href="PriceDecrease_Book.action">价格减序<i
												class="fa fa-chevron-down"></i></a></em>
									</dd>
								</dl>
							</div>
						</div></li>
					<li><a
						href="showCategory_Book.action?book.category=<s:property value="'热门小说'"/>">热门小说<i
							class="fa fa-star"></i></a>
						<div class="jnNav">
							<div class="subitem">
								<dl class="fore">
									<dt>
										<a href="#nogo">男频：</a>
									</dt>
									<dd>
										<em><a href="#nogo">玄幻</a></em> <em><a href="#nogo">奇幻</a></em>
										<em><a href="#nogo">现代都市</a></em> <em><a href="#nogo">武侠</a></em>
										<em><a href="#nogo">仙侠</a></em>
									</dd>
								</dl>
								<dl>
									<dt>
										<a href="#nogo">女频：</a>
									</dt>
									<dd>
										<em><a href="#nogo">玄幻</a></em> <em><a href="#nogo">奇幻</a></em>
										<em><a href="#nogo">现代都市</a></em> <em><a href="#nogo">武侠</a></em>
										<em><a href="#nogo">仙侠</a></em><em><a href="#nogo">现代言情</a></em>
										<em><a href="#nogo">穿越</a></em>
									</dd>
								</dl>
							</div>
						</div></li>
					<li><a
						href="showCategory_Book.action?book.category=<s:property value="'人物传记'"/>">人物传记<i
							class="fa fa-user-circle"></i></a>
						<div class="jnNav">
							<div class="subitem">
								<dl class="fore">
									<dt>
										<a href="#nogo">传记：</a>
									</dt>
									<dd>
										<em><a href="#nogo">传记</a></em> <em><a href="#nogo">财经人物</a></em>
										<em><a href="#nogo">鉴赏</a></em> <em><a href="#nogo">军事人物</a></em>
										<em><a href="#nogo">文学作品集</a></em> <em><a href="#nogo">历代帝王</a></em>
										<em><a href="#nogo">艺术</a></em> <em><a href="#nogo">女性人物</a></em>
									</dd>
								</dl>
								<dl>
									<dt>
										<a href="#nogo">传记：</a>
									</dt>
									<dd>
										<em><a href="#nogo">中国当代小说</a></em> <em><a href="#nogo">法律人物</a></em>
										<em><a href="#nogo">武侠小说</a></em> <em><a href="#nogo">宗教人物</a></em>
										<em><a href="#nogo">侦探</a></em> <em><a href="#nogo">历史人物</a></em>
										<em><a href="#nogo">推理</a></em> <em><a href="#nogo">体育明星</a></em>
										<em><a href="#nogo">惊悚</a></em>
									</dd>
								</dl>
							</div>
						</div></li>

				</ul>
			</div>
			<!-- 导航 end -->
		</div>
	</div>
	<!--头部结束-->
</body>
</html>