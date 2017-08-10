package org.crazyit.booksys.hao;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Order;

public abstract class OrderState {
	
	protected OrderDao orderDao;
	protected Order order;
	
	public OrderState(Order order,OrderDao orderDao){
		this.order=order;
		this.orderDao=orderDao;
	}
	
	//用户填写地址
	public abstract void editAddress();
	
	//用户取消订单
	public abstract void userCancelOrder();

	//用户支付订单
	public abstract void payOrder();
	
	//用户申请退货
	public abstract void requestRefund(String reason);
	
	//用户确认收货
	public abstract void takeBooks();
	
	//用户评价订单
	public abstract void evaluationOrder(String orderEvaluation);
	
	//卖家不接受订单
	public abstract void notAcceptOrder();
	
	//卖家接受订单
	public abstract void acceptOrder();
	
	//卖家取消订单
	public abstract void cancelOrder();
	
	//卖家发货
	public abstract void sendBooks();
	
	//卖家接受退货
	public abstract void acceptRefund();
	
}
