package org.crazyit.booksys.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;


public class OrderDaoHibernate4 extends BaseDaoHibernate4<Order>
	implements OrderDao
{
	@Override
	public List<Order> getUserAllOrders(int userid){
		// 创建查询
		return find("from Order as o where o.userId=?",new Object[]{userid});
	}

	@Override
	public List<Order> getStateOrders(int userid,String orderState) {
		// TODO Auto-generated method stub
		return find("from Order as o where o.userId=? and o.orderState=?",new Object[]{userid,orderState});
	}

	@Override
	public void setOrderState(Order order, String orderState) {
		// TODO Auto-generated method stub
		order.setOrderState(orderState);
		update(order);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Map<String,Object>> getOrderDetail(Order order) {
		// TODO Auto-generated method stub
		String hql="from Order o inner join fetch o.orderDetail od where o.id=?";
		
		Query query = getSessionFactory().getCurrentSession()
			.createQuery(hql)
			.setParameter(0,order.getId());
		
		order=(Order)query.list().get(0);
		
		List<Map<String,Object>> list = new ArrayList();
		
		Iterator i=order.getOrderDetail().iterator();
		while(i.hasNext()){
			Map<String,Object> map=new HashMap();
			OrderDetail orderDetail=(OrderDetail) i.next();
			map.put("book",orderDetail.getBook());
			map.put("number", orderDetail.getNumber());
			map.put("ifcomment", orderDetail.getIfcomment());
			list.add(map);
		}
		return list;
	}

	@Override
	public List<Order> getStateOrders(String orderState) {
		// TODO Auto-generated method stub
		return find("from Order as o where o.orderState=?",new Object[]{orderState});
	}

	@Override
	public List<Order> getAllOrders() {
		// TODO Auto-generated method stub
		return find("from Order");
	}

	@Override
	public OrderDetail getorderdetailbyparame(Book book, Order order) {
		// TODO Auto-generated method stub
		String hql = "from OrderDetail as o where o.book=:book and o.order=:order";
		Query query = getSessionFactory().getCurrentSession().createQuery(hql);
		query.setEntity("book", book);
		query.setEntity("order", order);
		return (OrderDetail)query.list().get(0);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Order addAmount(Order order) {
		// TODO Auto-generated method stub
		String hql="from Order o inner join fetch o.orderDetail od where o.id=?";
		
		Query query = getSessionFactory().getCurrentSession()
			.createQuery(hql)
			.setParameter(0,order.getId());
		
		order=(Order)query.list().get(0);
		Iterator i=order.getOrderDetail().iterator();
		
		Set<OrderDetail> orderDetails=new HashSet<OrderDetail>();
		
		while(i.hasNext()){
			OrderDetail orderDetail=(OrderDetail) i.next();
			Book book=orderDetail.getBook();
			book.setBookAmount(book.getBookAmount()+orderDetail.getNumber());
			orderDetail.setBook(book);
			orderDetails.add(orderDetail);
		}
		order.setOrderDetail(orderDetails);
		
		return order;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Order addSales(Order order) {
		// TODO Auto-generated method stub
		String hql="from Order o inner join fetch o.orderDetail od where o.id=?";
		
		Query query = getSessionFactory().getCurrentSession()
			.createQuery(hql)
			.setParameter(0,order.getId());
		
		order=(Order)query.list().get(0);
		Iterator i=order.getOrderDetail().iterator();
		
		Set<OrderDetail> orderDetails=new HashSet<OrderDetail>();
		
		while(i.hasNext()){
			OrderDetail orderDetail=(OrderDetail) i.next();
			Book book=orderDetail.getBook();
			book.setBookSales(book.getBookSales()+orderDetail.getNumber());
			orderDetail.setBook(book);
			orderDetails.add(orderDetail);
		}
		order.setOrderDetail(orderDetails);
		
		return order;
	}

	@Override
	public List<Order> getSuccessOrder() {
		// TODO Auto-generated method stub
		return find("from Order as o where o.orderStateReason=?",new Object[]{"交易完成"});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetail> getorderdetailbyparame(Order order) {
		// TODO Auto-generated method stub
		String hql = "from OrderDetail as o where o.order=:order";
		Query query = getSessionFactory().getCurrentSession().createQuery(hql);
		query.setEntity("order", order);
		return query.list();
	}

	
	
}
