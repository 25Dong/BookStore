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
	
	//�û���д��ַ
	public abstract void editAddress();
	
	//�û�ȡ������
	public abstract void userCancelOrder();

	//�û�֧������
	public abstract void payOrder();
	
	//�û������˻�
	public abstract void requestRefund(String reason);
	
	//�û�ȷ���ջ�
	public abstract void takeBooks();
	
	//�û����۶���
	public abstract void evaluationOrder(String orderEvaluation);
	
	//���Ҳ����ܶ���
	public abstract void notAcceptOrder();
	
	//���ҽ��ܶ���
	public abstract void acceptOrder();
	
	//����ȡ������
	public abstract void cancelOrder();
	
	//���ҷ���
	public abstract void sendBooks();
	
	//���ҽ����˻�
	public abstract void acceptRefund();
	
}
