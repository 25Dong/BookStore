package org.crazyit.booksys.hao.impl;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.hao.OrderState;

public class CreateOrderState {
	
	public static OrderState CreateOrderState(Order order,OrderDao orderDao){
		OrderState orderstate=null;
		
		if(order.getOrderState().equals("δȷ��"))
			orderstate=new NotConfirmState(order,orderDao);
		else if(order.getOrderState().equals("δ֧��"))
			orderstate=new NotPayState(order,orderDao);
		else if(order.getOrderState().equals("δ����"))
			orderstate=new NotSendState(order,orderDao);
		else if(order.getOrderState().equals("���׳ɹ�"))
			orderstate=new NotEvaluationState(order,orderDao);
		else if(order.getOrderState().equals("��֧��"))
			orderstate=new AlreadyPayState(order,orderDao);
		else if(order.getOrderState().equals("�ѷ���"))
			orderstate=new AlreadySendState(order,orderDao);
		else if(order.getOrderState().equals("�ѽ���"))
			orderstate=new AlreadyEndState(order,orderDao);
		else if(order.getOrderState().equals("�����˻�"))
			orderstate=new RefundingState(order,orderDao);
		return orderstate;
	}
	
}
