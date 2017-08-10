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
<title>快来登录和注册吧！</title>

<link rel="stylesheet" href="<%=basePath%>/css/cssOfDong/headmain.css">
<link rel="stylesheet"
	href="<%=basePath%>/css/cssOfDong/userLogAndReg.css">
<link rel="stylesheet"
	href="<%=basePath%>/Tools/toolsOfDong/bootstrap.min.css">
<script src="<%=basePath%>Tools/toolsOfDong/jquery.js"
	type="text/javascript"></script>

<script src="<%=basePath%>scripts/scriptsOfDong/test.js"
	type="text/javascript"></script>

</head>
<body>
	<s:if test="flag==1">
		<script>
			$(document).ready(function() {
				$("#tiaoba").trigger("click");
			});
		</script>
	</s:if>
	<!-- head -->
	<!--导航-->
	<div>
		<nav class="navbar navbar-default ">
		<div class="container">
			<!--小屏幕导航按钮和logo-->
			<div class="navbar-header navbar-left">
				<a href="#nogo" class="logo"> <img alt="Book Shop"
					src="<%=basePath%>/images/imagesOfDong/bookshoplogo.png">
				</a>
			</div>

			<div class="nav navbar-nav navbar-right">
				<a href="#" class="navbar-brand">网上书店</a>
			</div>
			<!--导航-->
		</div>
		</nav>
	</div>
	<div id="nav" class="mainNav">
		<span>登录、注册</span>
	</div>
	<!-- 导航菜单end -->

	<div id="mainContent">
		<div class="container" style="center;width:990px;">
			<div>
				<img id="bg" alt="logon"
					src="<%=request.getContextPath()%>/images/imagesOfDong/loginbg.png" />
			</div>
			<div class="row">
				<div class="col-md-6">
					<div>
						<img id="picture" alt="阅读"
							src="<%=request.getContextPath()%>/images/imagesOfDong/login1.jpg" />
					</div>
				</div>

				<div class="col-md-6">
					<div>
						<div class="login-box">
							<div class="box-con tran">
							
								<!-- 登录start -->
								<div class="login-con f-l">
									<div class="form-group">
										<h6 id="errorlogin">
											<s:actionerror />
										</h6>
										<s:form action="user_loginCheck" name="userloginForm"
											method="post" theme="css_xhtml">
											<s:textfield name="userName" placeholder="请输入用户名"></s:textfield>
											<s:password name="userPassword" placeholder="请输入密码"></s:password>
											<s:submit value="登录" id="loginButton"></s:submit>
										</s:form>
									</div>
									<div class="from-line"></div>
									<div class="form-group">
										<a href="javascript:;"
											class="move-signup a-tag tran blue-border"
											style="text-decoration: none;" id="tiaoba">还没有帐号？免费注册 </a>
									</div>
								</div>
								<!--登录end  -->

								<!-- 注册start -->
								<div class="signup f-l">
									<div class="signup-email">
										<div class="form-group">
											<h5 id="error">
												<s:actionerror />
											</h5>
											<s:form action="user_register" name="userloginForm"
												method="post">
												<s:textfield name="userName" placeholder="用户名：长度为5到8位"></s:textfield>
												<s:password name="userPassword" placeholder="密码：长度为3到6位"></s:password>
												<s:password name="ruserPassword" placeholder="请输入相同密码"></s:password>
												<s:textfield name="userEmail" placeholder="请输入邮箱"></s:textfield>
												<s:textfield name="userPhone" placeholder="请输入电话号码"></s:textfield>
												<s:submit value="注册" id="registerButton"></s:submit>
											</s:form>
										</div>
										<div class="form-group">
											<a href="javascript:;"
												class="move-login a-tag tran blue-border"
												style="text-decoration: none;">已有帐号？登录</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<%-- <!-- 注册start -->
		<div class="signup f-l">
			<div class="signup-email">
				<div class="form-group">
					<h2>
						<s:actionerror />
					</h2>
					<s:form action="user_register" name="userloginForm" method="post">
						<s:textfield name="userName" placeholder="用户名：长度为5到8位"></s:textfield>
						<s:password name="userPassword" placeholder="密码：长度为3到6位"></s:password>
						<s:password name="ruserPassword" placeholder="请输入相同密码"></s:password>
						<s:textfield name="userEmail" placeholder="邮箱"></s:textfield>
						<s:textfield name="userPhone" placeholder="电话号码"></s:textfield>
						<s:submit value="注册" id="registerButton"></s:submit>
					</s:form>
				</div>
				<div class="form-group">
					<a href="javascript:;" class="move-login a-tag tran blue-border"
						style="text-decoration: none;">已有帐号？登录</a>
				</div>
			</div>
		</div>
		<!-- 注册 end--> --%>
	</div>
	<div id="foot">
		<div><%@include file="foot.jsp"%></div>
	</div>
<s:debug></s:debug>
</body>
</html>