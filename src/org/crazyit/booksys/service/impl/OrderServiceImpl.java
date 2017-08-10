package org.crazyit.booksys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.crazyit.booksys.dao.OrderDao;
import org.crazyit.booksys.dao.UserDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.booksys.domain.User;
import org.crazyit.booksys.hao.impl.CreateOrderState;
import org.crazyit.booksys.service.OrderService;
public class OrderServiceImpl implements OrderService
{
	private OrderDao orderDao;
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int placeOrder(int userid, List<Map<String, Object>> list) {
		SimpleDateFormat ordertime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Set<OrderDetail> orderDetails=new HashSet<OrderDetail>();
		double orderPrice=0;
		for(Map<String, Object> map:list)
		{
			Book book=(Book) map.get("book");
			int number=(Integer) map.get("number");
			if(book.getBookAmount()-number<0)
				return book.getBookAmount()-number;
			book.setBookAmount(book.getBookAmount()-number);
			
			OrderDetail orderDetail=new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setNumber(number);
			
			orderDetails.add(orderDetail);
			orderPrice+=book.getPrice()*number;
			
		}
		Order order=new Order();
		order.setUserId(userid);
		order.setOrderPrice(orderPrice);
		order.setOrderTime(ordertime.format(new Date()));
		order.setOrderDetail(orderDetails);
		User user=userDao.get(User.class, userid);
		if(user.getUseNickName()!=null){
			order.setUserName(user.getUseNickName());
			order.setUserAddress(user.getUserAddress());
			order.setUserPhone(user.getUserPhone());
			order.setOrderState("未支付");
			orderDao.save(order);
			return 10000;
		}else
			order.setOrderState("未确认");
		return (Integer) orderDao.save(order);
	}

	@Override
	public void editAddress(Order order,int userid) {
		// TODO Auto-generated method stub
		User user=userDao.get(User.class, userid);
		user.setUseNickName(order.getUserName());
		user.setUserAddress(order.getUserAddress());
		user.setUserPhone(order.getUserPhone());
		userDao.update(user);
		CreateOrderState.CreateOrderState(order, orderDao).editAddress();
	}

	@Override
	public void userCancelOrder(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).userCancelOrder();
	}

	@Override
	public void payOrder(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).payOrder();
	}

	@Override
	public void requestRefund(Order order,String reason) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).requestRefund(reason);
	}

	@Override
	public void takeBooks(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).takeBooks();
	}

	@Override
	public void evaluationOrder(Order order,String orderEvaluation) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).evaluationOrder(orderEvaluation);
	}

	@Override
	public void notAcceptOrder(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).notAcceptOrder();
	}

	@Override
	public void acceptOrder(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).acceptOrder();
	}

	@Override
	public void cancelOrder(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).cancelOrder();
	}

	@Override
	public void sendBooks(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).sendBooks();
	}

	@Override
	public void acceptRefund(Order order) {
		// TODO Auto-generated method stub
		CreateOrderState.CreateOrderState(order, orderDao).acceptRefund();
	}

	@Override
	public List<Order> getUserAllOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getUserAllOrders(userid);
	}

	@Override
	public List<Order> getUserNotConfirmOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"未确认");
	}

	@Override
	public List<Order> getNotPayOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"未支付");
	}

	@Override
	public List<Order> getAlreadyPayOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"已支付");
	}

	@Override
	public List<Order> getNotSendOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"未发货");
	}

	@Override
	public List<Order> getAlreadySendOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"已发货");
	}

	@Override
	public List<Order> getNotEvaluationOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"交易成功");
	}

	@Override
	public List<Order> getAlreadyEvaluationOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"交易结束");
	}


	@Override
	public List<Order> getRefundingOrders(int userid) {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders(userid,"申请退货");
	}

	
	
	
	
	
	
	
	@Override
	public List<Order> getAllOrders() {
		// TODO Auto-generated method stub
		return orderDao.getAllOrders();
	}
	
	@Override
	public List<Order> getAllAlreadyPayOrders() {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders("已支付");
	}

	@Override
	public List<Order> getAllNotSendOrders() {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders("未发货");
	}

	@Override
	public List<Order> getAllSendingOrders() {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders("已发货");
	}

	@Override
	public List<Order> getAllNotEvaluationOrders() {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders("交易成功");
	}

	@Override
	public List<Order> getAllAlreadyEvaluationOrders() {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders("交易结束");
	}

	@Override
	public List<Order> getAllRefundingOrders() {
		// TODO Auto-generated method stub
		return orderDao.getStateOrders("申请退货");
	}

	
	

	@Override
	public List<Map<String, Object>> getOrderDetail(Order order) {
		// TODO Auto-generated method stub
		return orderDao.getOrderDetail(order);
	}

	@Override
	public Order getOrder(int orderid) {
		// TODO Auto-generated method stub
		return orderDao.get(Order.class, orderid);
	}

	@Override
	public OrderDetail getorderdetail(Book book, Order order) {
		// TODO Auto-generated method stub
		return orderDao.getorderdetailbyparame(book,order);
	}

	//总的订单数
	public long findCount() {
		return orderDao.findCount(Order.class);
	}

	@Override
	public double getIncome() {
		// TODO Auto-generated method stub
		List<Order> list=orderDao.getSuccessOrder();
		double income=0;
		for(Order order:list){
			System.out.println(order.getOrderPrice()+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			income+=order.getOrderPrice();
		}
		return income;
	}

	@Override
	public int getSuccessCout() {
		// TODO Auto-generated method stub
		List<Order> list=orderDao.getSuccessOrder();
		return list.size();
	}

	@Override
	public List<OrderDetail> getorderdetail(Order order) {
		// TODO Auto-generated method stub
		return orderDao.getorderdetailbyparame(order);
	}
	

	
	
	
}
