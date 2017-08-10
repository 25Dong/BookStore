package org.crazyit.booksys.hao.impl;

import java.util.HashSet;
import java.util.Set;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.booksys.hao.OrderState;

public class NotPayState extends OrderState {

	public NotPayState(Order order, OrderDao orderDao) {
		super(order, orderDao);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void editAddress() {
		// TODO Auto-generated method stub
		System.out.println("��ȷ��");
	}

	@Override
	public void userCancelOrder() {
		// TODO Auto-generated method stub
		order=orderDao.addAmount(order);
		order.setOrderState("���׽���");
		order.setOrderStateReason("�û�ȡ������");
		orderDao.update(order);
	}

	@Override
	public void payOrder() {
		// TODO Auto-generated method stub
		order.setOrderState("��֧��");
		orderDao.update(order);
	}

	@Override
	public void requestRefund(String reason) {
		// TODO Auto-generated method stub
		System.out.println("δ֧��");
	}

	@Override
	public void takeBooks() {
		// TODO Auto-generated method stub
		System.out.println("δ����");
	}

	@Override
	public void evaluationOrder(String orderEvaluation) {
		// TODO Auto-generated method stub
		System.out.println("δȷ���ջ�");
	}

	@Override
	public void notAcceptOrder() {
		// TODO Auto-generated method stub
		System.out.println("δ֧��");
	}

	@Override
	public void acceptOrder() {
		// TODO Auto-generated method stub
		System.out.println("δ֧��");
	}

	@Override
	public void cancelOrder() {
		// TODO Auto-generated method stub
		System.out.println("δ�ӵ�");
	}

	@Override
	public void sendBooks() {
		// TODO Auto-generated method stub
		System.out.println("δ�ӵ�");
	}

	@Override
	public void acceptRefund() {
		// TODO Auto-generated method stub
		System.out.println("δ�ӵ�");
	}
	
}
