package org.crazyit.booksys.hao.impl;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.hao.OrderState;

public class CreateOrderState {
	
	public static OrderState CreateOrderState(Order order,OrderDao orderDao){
		OrderState orderstate=null;
		
		if(order.getOrderState().equals("未确认"))
			orderstate=new NotConfirmState(order,orderDao);
		else if(order.getOrderState().equals("未支付"))
			orderstate=new NotPayState(order,orderDao);
		else if(order.getOrderState().equals("未发货"))
			orderstate=new NotSendState(order,orderDao);
		else if(order.getOrderState().equals("交易成功"))
			orderstate=new NotEvaluationState(order,orderDao);
		else if(order.getOrderState().equals("已支付"))
			orderstate=new AlreadyPayState(order,orderDao);
		else if(order.getOrderState().equals("已发货"))
			orderstate=new AlreadySendState(order,orderDao);
		else if(order.getOrderState().equals("已结束"))
			orderstate=new AlreadyEndState(order,orderDao);
		else if(order.getOrderState().equals("申请退货"))
			orderstate=new RefundingState(order,orderDao);
		return orderstate;
	}
	
}
