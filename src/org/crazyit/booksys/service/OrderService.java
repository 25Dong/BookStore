package org.crazyit.booksys.service;

import java.util.List;
import java.util.Map;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;

/**
 * Description:
 * <br/>��վ: <a href="http://www.crazyit.org">���Java����</a>
 * <br/>Copyright (C), 2001-2016, Yeeku.H.Lee
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author  Yeeku.H.Lee kongyeeku@163.com
 * @version  1.0
 */
public interface OrderService
{
	
	//�û��µ�
	int placeOrder(int userid, List<Map<String, Object>> list);
	
	//�û���д��ַ
	void editAddress(Order order,int userid);
	
	//�û�ȡ������
	void userCancelOrder(Order order);

	//�û�֧������
	void payOrder(Order order);
	
	//�û������˻�
	void requestRefund(Order order,String reason);
	
	//�û�ȷ���ջ�
	void takeBooks(Order order);
	
	//�û����۶���
	void evaluationOrder(Order order,String orderEvaluation);
	
	
	
	//���Ҳ����ܶ���
	void notAcceptOrder(Order order);
	
	//���ҽ��ܶ���
	void acceptOrder(Order order);
	
	//����ȡ������
	void cancelOrder(Order order);
	
	//���ҷ���
	void sendBooks(Order order);
	
	//���ҽ����˻�
	void acceptRefund(Order order);
	
	
	
	//��ȡ�û����ж���
	List<Order> getUserAllOrders(int userid);
	
	//��ȡ�û�δȷ�϶���
	List<Order> getUserNotConfirmOrders(int userid);
	
	//��ȡ�û�δ֧������
	List<Order> getNotPayOrders(int userid);
	
	//��ȡ�û���֧������
	List<Order> getAlreadyPayOrders(int userid);
	
	//��ȡ�û�δ��������
	List<Order> getNotSendOrders(int userid);
	
	//��ȡ�û��ѷ�������
	List<Order> getAlreadySendOrders(int userid);
	
	//��ȡ�û�δ���۶���
	List<Order> getNotEvaluationOrders(int userid);
	
	//��ȡ�û������۶���
	List<Order> getAlreadyEvaluationOrders(int userid);
	
	//��ȡ�û��˿��ж���
	List<Order> getRefundingOrders(int userid);
	
	
	
	//��ȡ���ж���
	List<Order> getAllOrders();
	
	//��ȡ������֧������
	List<Order> getAllAlreadyPayOrders();
	
	//��ȡ����δ�����Ķ���
	List<Order> getAllNotSendOrders();
	
	//��ȡ�����ѷ����Ķ���
	List<Order> getAllSendingOrders();
	
	//��ȡ����δ���۶���
	List<Order> getAllNotEvaluationOrders();
	
	//��ȡ���������۶���
	List<Order> getAllAlreadyEvaluationOrders();
	
	//��ȡ�����˿��ж���
	List<Order> getAllRefundingOrders();
	
	
	
	//��ȡ������ϸ
	List<Map<String, Object>> getOrderDetail(Order order);
	
	//����ID��ȡ����
	Order getOrder(int orderid);

	OrderDetail getorderdetail(Book book, Order order);
	
	List<OrderDetail> getorderdetail(Order order);
	//�ܵĶ�����
	long findCount();
	
	//��ȡ�����ܶ�
	double getIncome();
	
	//��ȡ���׳ɹ�����
	int getSuccessCout();
}
