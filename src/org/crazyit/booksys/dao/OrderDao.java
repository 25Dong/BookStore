package org.crazyit.booksys.dao;

import java.util.List;
import java.util.Map;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.common.dao.BaseDao;

public interface OrderDao extends BaseDao<Order>
{
	//��ȡ�û����ж���
	List<Order> getUserAllOrders(int userid);
	
	//��ȡ���ж���
	List<Order> getAllOrders();
	
	//��ȡ�û�ĳһ״̬����
	List<Order> getStateOrders(int userid,String orderState);
	
	//�ı䶩��״̬
	void setOrderState(Order order,String orderState);
	
	//��ȡ������ϸ
	List<Map<String, Object>> getOrderDetail(Order order);
	
	//��ȡ����ĳһ״̬�����ж���
	List<Order> getStateOrders(String orderState);
	
	//������;����������
	Order addAmount(Order order);
	
	//��������
	Order addSales(Order order);
	
	//��ȡ������ɵĶ���
	List<Order> getSuccessOrder();

	OrderDetail getorderdetailbyparame(Book book, Order order);

	List<OrderDetail> getorderdetailbyparame(Order order);
}
