package org.crazyit.booksys.service.impl;

import org.crazyit.booksys.dao.OrderdetailDao;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.booksys.service.OrderdetailService;

public class OrderdetailServiceImpl implements OrderdetailService {
	private OrderdetailDao orderdetailDao;
	
	public OrderdetailDao getOrderdetailDao() {
		return orderdetailDao;
	}

	public void setOrderdetailDao(OrderdetailDao orderdetailDao) {
		this.orderdetailDao = orderdetailDao;
	}

	@Override
	public void update(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		orderdetailDao.update(orderDetail);
	}

}
