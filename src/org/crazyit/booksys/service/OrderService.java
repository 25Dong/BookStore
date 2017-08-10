package org.crazyit.booksys.service;

import java.util.List;
import java.util.Map;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;

/**
 * Description:
 * <br/>锟斤拷站: <a href="http://www.crazyit.org">锟斤拷锟絁ava锟斤拷锟斤拷</a>
 * <br/>Copyright (C), 2001-2016, Yeeku.H.Lee
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author  Yeeku.H.Lee kongyeeku@163.com
 * @version  1.0
 */
public interface OrderService
{
	
	//用户下单
	int placeOrder(int userid, List<Map<String, Object>> list);
	
	//用户填写地址
	void editAddress(Order order,int userid);
	
	//用户取消订单
	void userCancelOrder(Order order);

	//用户支付订单
	void payOrder(Order order);
	
	//用户申请退货
	void requestRefund(Order order,String reason);
	
	//用户确认收货
	void takeBooks(Order order);
	
	//用户评价订单
	void evaluationOrder(Order order,String orderEvaluation);
	
	
	
	//卖家不接受订单
	void notAcceptOrder(Order order);
	
	//卖家接受订单
	void acceptOrder(Order order);
	
	//卖家取消订单
	void cancelOrder(Order order);
	
	//卖家发货
	void sendBooks(Order order);
	
	//卖家接受退货
	void acceptRefund(Order order);
	
	
	
	//获取用户所有订单
	List<Order> getUserAllOrders(int userid);
	
	//获取用户未确认订单
	List<Order> getUserNotConfirmOrders(int userid);
	
	//获取用户未支付订单
	List<Order> getNotPayOrders(int userid);
	
	//获取用户已支付订单
	List<Order> getAlreadyPayOrders(int userid);
	
	//获取用户未发货订单
	List<Order> getNotSendOrders(int userid);
	
	//获取用户已发货订单
	List<Order> getAlreadySendOrders(int userid);
	
	//获取用户未评价订单
	List<Order> getNotEvaluationOrders(int userid);
	
	//获取用户已评价订单
	List<Order> getAlreadyEvaluationOrders(int userid);
	
	//获取用户退款中订单
	List<Order> getRefundingOrders(int userid);
	
	
	
	//获取所有订单
	List<Order> getAllOrders();
	
	//获取所有已支付订单
	List<Order> getAllAlreadyPayOrders();
	
	//获取所有未发货的订单
	List<Order> getAllNotSendOrders();
	
	//获取所有已发货的订单
	List<Order> getAllSendingOrders();
	
	//获取所有未评价订单
	List<Order> getAllNotEvaluationOrders();
	
	//获取所有已评价订单
	List<Order> getAllAlreadyEvaluationOrders();
	
	//获取所有退款中订单
	List<Order> getAllRefundingOrders();
	
	
	
	//获取订单明细
	List<Map<String, Object>> getOrderDetail(Order order);
	
	//根据ID获取订单
	Order getOrder(int orderid);

	OrderDetail getorderdetail(Book book, Order order);
	
	List<OrderDetail> getorderdetail(Order order);
	//总的订单数
	long findCount();
	
	//获取交易总额
	double getIncome();
	
	//获取交易成功总数
	int getSuccessCout();
}
