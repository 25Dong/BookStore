<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="editUser.userName" />用户的主页信息</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/UserInfo.css">

<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
</head>
<body>
	<!--头部  -->
	<div id="head">
		<div><%@include file="head2.jsp"%></div>
	</div>

	<div id="mainContent">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#home" data-toggle="tab">我的个人信息库</a></li>
						<li><a href="#updateInfo" data-toggle="tab">更新完善个人信息</a></li>
						<li><a href="#updatePassword" data-toggle="tab">更换密码</a></li>
						<li><a href="#updatePhoto" data-toggle="tab">更换头像</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<div class="row">
								<div class="col-md-4">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">我的头像</h3>
										</div>
										<div class="panel-body" style="align:center;">
											<s:if test="editUser.userPhoto==null||editUser.userPhoto.length()<1">
												<p>你还没上传头像！目前使用默认图片</p>
												<img style="width: 150px;height: 150px" class="img-circle"
													src="<%=request.getContextPath()%>/images/imagesOfDong/Userdefault.png" />
											</s:if>
											<s:else>
												<img class="img-circle"
													style="width: 170px;height: 170px;margin-left: 50px"
													src="<%=request.getContextPath()%>/upload/<s:property value="editUser.userPhoto"/>" />
											</s:else>
										</div>
									</div>
								</div>
								<div class="col-md-8">
									<div class="panel  panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">账户基本信息</h3>
										</div>
										<div class="panel-body">修改</div>
										<table class="table">
											<tr>
												<td>用户名：</td>
												<td><s:property value="editUser.userName" /></td>
											</tr>
											<tr>
												<td>已绑定的邮箱：</td>
												<td><s:property value="editUser.userEmail" /></td>
											</tr>
											<tr>
												<td>已绑定的手机号：</td>
												<td><s:property value="editUser.userPhone" /></td>
											</tr>
											<tr>
												<td>我的注册时间：</td>
												<td><s:property value="editUser.registDate" /></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="updateInfo">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">我的完善资料卡</h3>
								</div>
								<s:form action="user_update" name="userloginForm" method="post"
									theme="simple">
									<s:hidden name="userId" value="%{editUser.userId}"></s:hidden>
									<s:hidden name="userPassword" value="%{editUser.userPassword}"></s:hidden>
									<s:hidden name="registDate" value="%{editUser.registDate}"></s:hidden>
									<s:hidden name="userPhoto" value="%{editUser.userPhoto}"></s:hidden>
									<table class="table table-striped">
										<tr>
											<td>新的用户名：</td>
											<td><s:textfield name="userName"
													value="%{editUser.userName}" required="required"></s:textfield></td>
										</tr>
										<tr>
											<td>收货人名称：</td>
											<td><s:if test="editUser.useNickName==null">
													<s:textfield name="useNickName" placeholder="请输入您的收货人名称"
														required="required"></s:textfield>
												</s:if> <s:else>
													<s:textfield name="useNickName"
														value="%{editUser.useNickName}"></s:textfield>
												</s:else></td>
										</tr>
										<tr>
											<td>收货人地址：</td>
											<td><s:if test="editUser.userAddress==null">
													<s:textfield name="userAddress" placeholder="请输入您的收货人地址"
														required="required"></s:textfield>
												</s:if> <s:else>
													<s:textfield name="userAddress"
														value="%{editUser.userAddress}"></s:textfield>
												</s:else></td>
										</tr>
										<tr>
											<td>绑定新邮箱：</td>
											<td><s:textfield name="userEmail" placeholder="邮箱"
													value="%{editUser.userEmail}" required="required"></s:textfield></td>
										</tr>
										<tr>
											<td>绑定新手机号：</td>
											<td><s:textfield name="userPhone" placeholder="电话号码"
													value="%{editUser.userPhone}" required="required"></s:textfield></td>
										</tr>
										<%-- <tr>
											<td>更换头像：</td>
											<td><s:file name="upload" label="头像" required="required"></s:file></td>
										</tr> --%>
										<tr>
											<td>性别：</td>
											<td><s:if test='editUser.userSex=="女"'>
													<input type="radio" name="userSex" value="男" />男
													<input type="radio" name="userSex" value="女" checked />女
													<input type="radio" name="userSex" value="保密" />保密
											</s:if> <s:elseif test='editUser.userSex=="男"'>
													<input type="radio" name="userSex" value="男" checked />男
													<input type="radio" name="userSex" value="女" />女
													<input type="radio" name="userSex" value="保密" />保密
											</s:elseif> <s:else>
													<input type="radio" name="userSex" value="男" />男
													<input type="radio" name="userSex" value="女" />女
													<input type="radio" name="userSex" value="保密" checked />保密
											</s:else></td>
										</tr>

									</table>
									<div class="col-md-12">
										<button type="submit" class="btn-info btn-lg btn-block">提交资料</button>
									</div>
								</s:form>
							</div>
						</div>
						<div class="tab-pane fade" id="updatePassword">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">更换密码的资料卡</h3>
								</div>
								<s:form action="user_updatePassWord" id="reg-form" method="post"
									theme="simple">
									<s:hidden name="userId" value="%{editUser.userId}"></s:hidden>
									<s:hidden name="userPassword" value="%{editUser.userPassword}"></s:hidden>
									<s:hidden name="userAddress" value="%{editUser.userAddress}"></s:hidden>
									<s:hidden name="userName" value="%{editUser.userName}"></s:hidden>
									<s:hidden name="useNickName" value="%{editUser.useNickName}"></s:hidden>
									<s:hidden name="userEmail" value="%{editUser.userEmail}"></s:hidden>
									<s:hidden name="userPhone" value="%{editUser.userPhone}"></s:hidden>
									<s:hidden name="registDate" value="%{editUser.registDate}"></s:hidden>
									<s:hidden name="userSex" value="%{editUser.userSex}"></s:hidden>
									<s:hidden name="userPhoto" value="%{editUser.userPhoto}"></s:hidden>
									<table class="table table-striped">
										<tr>
											<td>请输入您的旧密码：</td>
											<td><s:password name="testPassWord" required="required"></s:password></td>
										<tr>
											<td>请输入新密码：</td>
											<td><s:password name="NewPassword" required="required"></s:password></td>
										</tr>
										<tr>
											<td>确定新密码：</td>
											<td><s:password name="ruserPassword" required="required"></s:password></td>
										</tr>
									</table>
									<div class="col-md-12">
										<button type="submit" class="btn-info btn-lg btn-block">提交资料</button>
									</div>
								</s:form>
							</div>
						</div>
						
						
						<div class="tab-pane fade" id="updatePhoto">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">更换头像的资料卡</h3>
								</div>
								<s:form action="user_updatePhoto.action" method="post" theme="simple" enctype="multipart/form-data">
									<s:hidden name="userId" value="%{editUser.userId}"></s:hidden>
									<s:hidden name="userPassword" value="%{editUser.userPassword}"></s:hidden>
									<s:hidden name="userAddress" value="%{editUser.userAddress}"></s:hidden>
									<s:hidden name="userName" value="%{editUser.userName}"></s:hidden>
									<s:hidden name="userEmail" value="%{editUser.userEmail}"></s:hidden>
									<s:hidden name="userPhone" value="%{editUser.userPhone}"></s:hidden>
									<s:hidden name="registDate" value="%{editUser.registDate}"></s:hidden>
									<s:hidden name="userSex" value="%{editUser.userSex}"></s:hidden>
									<s:hidden name="useNickName" value="%{editUser.useNickName}"></s:hidden>
									<table class="table table-striped">
										<tr>
											<td>更换头像：</td>
											<td><s:file name="upload" label="头像" required="required"></s:file></td>
										</tr> 
									</table>
									<div class="col-md-12">
										<button type="submit" class="btn-info btn-lg btn-block">更换头像</button>
									</div>
								</s:form>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#home2" data-toggle="tab">我的购物车
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active">
							<div class="row">
								<s:if test="1==2">
							你的购车还没添加商品！<a href="advertise_findAds.action">快去购物吧!</a>
								</s:if>
								<s:else>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">我的购车详情</h3>
										</div>


										<s:if test="cars.size==0">
							你的购车还没添加商品！<a href="advertise_findAds.action">快去购物吧!</a>
										</s:if>
										<s:else>


											<s:form action="changestate_Car" theme="simple">
												<table class="table">
													<thead>
														<tr>
															<th>书本封面<span class="fa fa-book"></span></th>
															<th>书名</th>
															<th>单价<span class="fa fa-cny"></span></th>
															<th>数量</th>
															<th>加入购物车时间<span
																class="fa fa-calendar-times-o fa-1x"></span></th>
															<th>选择<span class="fa fa-check"></span></th>
															<!-- <th><input id="allc2" type="checkbox" /></th> -->
															<th>删除<span class="fa fa-trash-o fa-lg"></span></th>
														</tr>
													</thead>
													<tbody>
														<s:iterator value="cars" var="c" status="stat">
															<tr>
																<td><img style="width: 60px;height:90px;"
																	src="upload/<s:property value="photoname"/>" /></td>
																<td><s:property value="name" /></td>
																<td><s:property value="price" /></td>
																<%-- <td><s:property value="count" /></td> --%>
																<td class="cfs"><a class="jian">-</a> <input
																	class="lskdo" disabled="disabled" type="text"
																	value="<s:property value="count"/>" name="numbers" />
																	<a class="jia">+</a></td>



																<td><s:property value="time" />
																<td><input class="choo" type="checkbox"
																	name="bookIds" value="<s:property value="bookid"/>"></td>
																<!--<td> 
													<s:checkbox class="choo" name="bookIds[%{#stat.index}]" fieldValue="%{#c.bookid}" value="false"></s:checkbox>
												</td>
													-->
																<td><a class="btn btn-danger"
																	href="delete_Car.action?bookid=${c.id}"> <i
																		class="fa fa-trash-o fa-lg"></i> Delete
																</a></td>
																<s:hidden name="ids" value="%{bookid}"></s:hidden>

																<s:hidden name="carsid" value="%{id}"></s:hidden>
															</tr>
														</s:iterator>
													</tbody>


												</table>

												<div class="col-md-12">
													<button type="submit" class="btn-info btn-lg btn-block">
														<span class="fa fa-credit-card"></span> 结算
													</button>
												</div>
											</s:form>
										</s:else>
									</div>
								</s:else>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>






		<div style="height: 15px;"></div>
		<!--脚部  -->
		<div id="foot">
			<div><%@include file="foot.jsp"%></div>
		</div>
<script type="text/javascript">
		$("#allc").change(function() {
			var innum = $(".choo").length;
			if ($(this).prop("checked")) {
				$(".choo").prop("checked", true);
				$("#in_num").text(innum);
				$(".lskdo").val(1);
				$("#sp_num").text(innum);
				$(".lskdo").prop("disabled", false);
			} else {
				$(".choo").prop("checked", false);
				$("#in_num").text(0);
				$(".lskdo").val(0);
				$("#sp_num").text(0);
				$(".lskdo").prop("disabled", true);
			}
		})
		$(".choo").change(
				function() {
					var lskd = $(".choo:checked").length;
					$("#in_num").text(lskd);
					var lsoe = $(this).parent().parent().find(".lskdo");
					if ($(this).prop("checked")) {
						lsoe.prop("disabled", false);
						lsoe.val(1);
						$("#sp_num").text(
								parseInt($("#sp_num").text())
										+ parseInt(lsoe.val()));
						//alert();
					} else {
						lsoe.prop("disabled", true);
						$("#sp_num").text(
								parseInt($("#sp_num").text())
										- parseInt(lsoe.val()));
						lsoe.val(0);
					}
				})

		//$(".jian").each(function(){
		$(".jian").click(function() {
			var lskdpd = $(this).parent().parent().find(".choo");
			var lsoek = $(this).parent().find(".lskdo");
			//alert(lsoek.val()>1);
			if (lskdpd.prop("checked") && lsoek.val() > 1) {
				//alert("ccc");
				var lskoe = parseInt(lsoek.val());
				var eiow = parseInt($("#sp_num").text());
				//alert(eiow);
				lsoek.val(lskoe - 1);
				$("#sp_num").text(eiow - 1);
			} else {
			}
		})
		//	})
		//$(".jia").each(function(){
		$(".jia").click(function(iiii) {
			var lskdpd = $(this).parent().parent().find(".choo");
			var lsoek = $(this).parent().find(".lskdo");
			//alert(lsoek.val()>1);
			if (lskdpd.prop("checked")) {
				//alert("ccc");
				var lskoe = parseInt(lsoek.val());
				var eiow = parseInt($("#sp_num").text());
				lsoek.val(lskoe + 1);
				$("#sp_num").text(eiow + 1);
				//return $("#sp_num").text();
			} else {
			}
		})
		//	})
		$(".lskdo").on('input propertychange', function() {
			var deox = $(this).val();
			if (isNaN(deox)) {
				alert("您好,请输入您想购买的数量!");
				$(this).val(1);
			}
			var loel = 0;
			for (i = 0; i < $(".lskdo").length; i++) {
				//alert($(".lskdo").eq(i).val());
				loel = parseInt(loel) + parseInt($(".lskdo").eq(i).val());
			}
			//alert(loel);
			$("#sp_num").text(loel);
		})
	</script>
</body>
</html>