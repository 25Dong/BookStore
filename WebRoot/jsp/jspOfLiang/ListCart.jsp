<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/scriptsOfjj/listCars.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/ListCart.css">
</head>
<body>
	<div id="head">
		<div><%@include file="../jspOfDong/head2.jsp"%></div>
	</div>
	<div id="mancontent">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">
								<s:property value="#session.exitUser.userName" />
								的购物车<i class="fa fa-shopping-cart fa-2x"></i>
							</h3>
						</div>
						<div class="panel-body">
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
												<th>加入购物车时间<span class="fa fa-calendar-times-o fa-1x"></span></th>
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
														value="<s:property value="count"/>" name="numbers" /> <a
														class="jia">+</a></td>



													<td><s:property value="time" />
													<td><input class="choo" type="checkbox" name="bookIds" 
														value="<s:property value="bookid"/>"></td>
													<!--<td> 
													<s:checkbox class="choo" name="bookIds[%{#stat.index}]" fieldValue="%{#c.bookid}" value="false"></s:checkbox>
												</td>
													-->
													<td><a class="btn btn-danger" href="delete_Car.action?bookid=${c.id}"> <i
															class="fa fa-trash-o fa-lg"></i> Delete
													</a></td>
													<s:hidden name="ids" value="%{bookid}"></s:hidden>

													<s:hidden name="carsid" value="%{id}"></s:hidden>
												</tr>
											</s:iterator>
										</tbody>


									</table>

									<div class="col-md-12">
										<button type="submit" class="btn-danger btn-lg btn-block"><span class="fa fa-credit-card"></span> 结算</button>
									</div>
								</s:form>
							</s:else>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<div id="foot">
		<div><%@include file="../jspOfDong/foot.jsp"%></div>
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