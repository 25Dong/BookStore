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
	href="<%=request.getContextPath()%>/css/cssOfDong/OdersShow.css">
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/Tools/toolsOfDong/bootstrap.min.js"></script>
<title>用户的订单信息</title>
</head>
<body>

	<!--头部  -->
	<div id="head">
		<div><%@include file="../jspOfDong/head2.jsp"%></div>
	</div>
	
	<div id="content">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">我的订单</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3">
								<form action="userallOrders.action" method="post">
									<button type="submit" class="btn btn-success">查看全部订单</button>
								</form>
							</div>
							<div class="col-md-3">
								<form action="usernotConfirmOrders.action" method="post">
									<button type="submit" class="btn btn-success">未确认的订单</button>
								</form>
							</div>
							<div class="col-md-3">
								<form action="usernotPayOrders.action" method="post">
									<button type="submit" class="btn btn-success">未支付的订单</button>
								</form>
							</div>
							<div class="col-md-3">
								<form action="usernotSendOrders.action" method="post">
									<button type="submit" class="btn btn-success">未发货的订单</button>
								</form>
							</div>
							<div style="height: 40px;"></div>
							<div class="col-md-3">
								<form action="usernotTakeBookOrders.action" method="post">
									<button type="submit" class="btn btn-success">已发货的订单</button>
								</form>
							</div>
							<div class="col-md-3">
								<form action="usernotEvaluationOrders.action" method="post">
									<button type="submit" class="btn btn-success">未评价的订单</button>
								</form>
							</div>
							<div class="col-md-3">
								<form action="userrefundingOrders.action" method="post">
									<button type="submit" class="btn btn-success">退货中的订单</button>
								</form>
							</div>
							<div class="col-md-3">
								<form action="userendOrders.action" method="post">
									<button type="submit" class="btn btn-success">已结束的订单</button>
								</form>
							</div>
						</div>
						<div class="col-md-12" style="height: 10px;"></div>
						<table class="table table-bordered">
							<tr>
								<td>订单号</td>
								<td>下单时间</td>
								<td>订单价格</td>
								<td>订单状态</td>
								<td>订单详情</td>
								<td>订单操作</td>
							</tr>
							<s:iterator value="orders" var="o" status="stat">
								<tr>
									<td><s:property value="id" /></td>
									<td><s:property value="orderTime" /></td>
									<td><s:property value="orderPrice" /></td>
									<td><s:property value="orderState" /></td>
									<td>
										<form action="userdetail.action" method="post">
											<s:hidden name="id" value="%{id}"></s:hidden>
											<button type="submit" class="btn btn-info">订单明细</button>
										</form>
									</td>
									<s:if test="#o.orderState=='未确认'">
										<td>
											<form action="userselectAddress.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-warning">填写地址</button>
										   </form>
										</td>
										<td>
											<form action="useruserCancelOrder.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-warning">取消订单</button>
										   </form>
										</td>
									</s:if>
									<s:if test="#o.orderState=='未支付'">
										<td>
											<form action="userpayOrder.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-warning">马上支付</button>
										   </form>
										</td>
										<td>
											<form action="useruserCancelOrder.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-warning">取消订单</button>
										   </form>
										</td>
									</s:if>
									<s:if test="#o.orderState=='已支付'">
										<td>
											<form action="userrequestRefund.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-danger">申请退货</button>
										   </form>
										</td>
									</s:if>
									<s:if test="#o.orderState=='未发货'">
										<td>
											<form action="userrequestRefund.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-danger">申请退货</button>
										   </form>
										</td>
									</s:if>
									<s:if test="#o.orderState=='已发货'">
										<td>
											<form action="usertakeBook.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-danger">确认收货</button>
										   </form>
										</td>
										<td>
											<form action="userrequestRefund.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-danger">申请退货</button>
										   </form>
										</td>
									</s:if>
									<s:if test="#o.orderState=='交易成功'">
										<td>
											<form action="userdetail.action" method="post">
												<s:hidden name="id" value="%{id}"></s:hidden>
												<button type="submit" class="btn btn-danger">评价</button>
											</form>		
										</td>
									</s:if>
								</tr>
							</s:iterator>
						</table>

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