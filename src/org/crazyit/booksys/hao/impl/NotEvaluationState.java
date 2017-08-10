package org.crazyit.booksys.hao.impl;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.hao.OrderState;

public class NotEvaluationState extends OrderState {

	public NotEvaluationState(Order order, OrderDao orderDao) {
		super(order, orderDao);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void editAddress() {
		// TODO Auto-generated method stub
		System.out.println("已确认");
	}

	@Override
	public void userCancelOrder() {
		// TODO Auto-generated method stub
		System.out.println("已支付，不可取消");
	}

	@Override
	public void payOrder() {
		// TODO Auto-generated method stub
		System.out.println("已支付");
	}

	@Override
	public void requestRefund(String reason) {
		// TODO Auto-generated method stub
		System.out.println("已完成");
	}

	@Override
	public void takeBooks() {
		// TODO Auto-generated method stub
		System.out.println("已确认收货");
	}

	@Override
	public void evaluationOrder(String orderEvaluation) {
		// TODO Auto-generated method stub
		order.setOrderState("交易结束");
		order.setOrderStateReason("交易完成");
		order.setOrderEvaluation(orderEvaluation);
		orderDao.update(order);
	}

	@Override
	public void notAcceptOrder() {
		// TODO Auto-generated method stub
		System.out.println("已接单");
	}

	@Override
	public void acceptOrder() {
		// TODO Auto-generated method stub
		System.out.println("已接单");
	}

	@Override
	public void cancelOrder() {
		// TODO Auto-generated method stub
		System.out.println("已完成，不可取消");
	}

	@Override
	public void sendBooks() {
		// TODO Auto-generated method stub
		System.out.println("已发货");
	}

	@Override
	public void acceptRefund() {
		// TODO Auto-generated method stub
		System.out.println("买家未申请退货");
	}

}
