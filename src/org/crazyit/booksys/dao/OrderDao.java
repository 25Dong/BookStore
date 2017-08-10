package org.crazyit.booksys.dao;

import java.util.List;
import java.util.Map;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.common.dao.BaseDao;

public interface OrderDao extends BaseDao<Order>
{
	//获取用户所有订单
	List<Order> getUserAllOrders(int userid);
	
	//获取所有订单
	List<Order> getAllOrders();
	
	//获取用户某一状态订单
	List<Order> getStateOrders(int userid,String orderState);
	
	//改变订单状态
	void setOrderState(Order order,String orderState);
	
	//获取订单明细
	List<Map<String, Object>> getOrderDetail(Order order);
	
	//获取订单某一状态的所有订单
	List<Order> getStateOrders(String orderState);
	
	//订单中途结束库存回增
	Order addAmount(Order order);
	
	//增加销量
	Order addSales(Order order);
	
	//获取交易完成的订单
	List<Order> getSuccessOrder();

	OrderDetail getorderdetailbyparame(Book book, Order order);

	List<OrderDetail> getorderdetailbyparame(Order order);
}
