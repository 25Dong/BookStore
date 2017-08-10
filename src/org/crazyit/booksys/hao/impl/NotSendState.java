package org.crazyit.booksys.hao.impl;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.hao.OrderState;

public class NotSendState extends OrderState {

	public NotSendState(Order order, OrderDao orderDao) {
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
		System.out.println("��֧��������ȡ��");
	}

	@Override
	public void payOrder() {
		// TODO Auto-generated method stub
		System.out.println("��֧��");
	}

	@Override
	public void requestRefund(String reason) {
		// TODO Auto-generated method stub
		order.setOrderState("�����˻�");
		order.setOrderStateReason(reason);
		orderDao.update(order);
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
		System.out.println("�ѽӵ�");
	}

	@Override
	public void acceptOrder() {
		// TODO Auto-generated method stub
		System.out.println("�ѽӵ�");
	}

	@Override
	public void cancelOrder() {
		// TODO Auto-generated method stub
		order=orderDao.addAmount(order);
		order.setOrderState("���׽���");
		order.setOrderStateReason("����ȡ������");
		orderDao.update(order);
	}

	@Override
	public void sendBooks() {
		// TODO Auto-generated method stub
		order.setOrderState("�ѷ���");
		orderDao.update(order);
	}

	@Override
	public void acceptRefund() {
		// TODO Auto-generated method stub
		System.out.println("���δ�����˿�");
	}

}
