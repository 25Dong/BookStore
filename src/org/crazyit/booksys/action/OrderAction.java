package org.crazyit.booksys.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.service.BookService;
import org.crazyit.booksys.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author 张皓
 *
 */
@SuppressWarnings("serial")
public class OrderAction extends ActionSupport {
	
	private OrderService orderService;
	private BookService bookService;
	
	private List<Book> books;
	private List<Integer> bookIds;
	private List<Order> orders;
	private Integer userId;
	private Integer id;
	private Order order;
	private String orderState;
	private boolean[] buylist;
	private Integer[] ids;
	private Integer[] numbers;
	private Integer[] ifcomment;
	
	public int userid(){
		ActionContext context = ActionContext.getContext();
		int userid = (Integer)context.getSession().get("userid");
		System.out.println("正在添加购物车的用户id是"+userid);
		return userid;
		
	}
	public List<Map<String,Object>> seleteids(){
		List<Map<String,Object>> list=new ArrayList<Map<String, Object>>();
		System.out.println(bookIds);
		for(int i=0,j=bookIds.size();i<j;i++){
				Book book=bookService.findbyid(bookIds.get(i));//根据id查找书本
				Map<String,Object> map=new HashMap<String, Object>();
				map.put("book", book);
				map.put("number", numbers[i]);
				list.add(map);
		}
		return list;
	}
	//下单
	public String placeOrder(){
		List<Map<String,Object>> list=seleteids();
		System.out.println(orderService);
		int flag=orderService.placeOrder(userid(), list);
		if(flag>0){
			if(flag==10000)
				return notPayOrders();
			else
				return notConfirmOrders();
		}
		else 
			return ERROR;
	}
	
	//显示未确认订单
	public String notConfirmOrders(){
		setOrders(orderService.getUserNotConfirmOrders(userid()));
		return SUCCESS;
	}
	
	//编辑地址
	public String selectAddress(){
		setOrder(orderService.getOrder(getId()));
		return "address";
	}

	//保存地址
	public String saveAddress(){
		String userName=order.getUserName();
		String userAddress=order.getUserAddress();
		String userPhone=order.getUserPhone();
		order=orderService.getOrder(order.getId());
		order.setUserName(userName);
		order.setUserAddress(userAddress);
		order.setUserPhone(userPhone);
		orderService.editAddress(getOrder(),userid());
		return notPayOrders();
	}
	
	//显示未支付订单
	public String notPayOrders(){
		System.out.print("notpagorder");
		setOrders(orderService.getNotPayOrders(userid()));
		return SUCCESS;
	}
	
	//用户取消订单
	public String userCancelOrder(){
		setOrder(orderService.getOrder(getId()));
		orderService.userCancelOrder(getOrder());
		return endOrders();
	}
	
	//获取用户已结束的订单
	public String endOrders(){
		System.out.print("");
		setOrders(orderService.getAlreadyEvaluationOrders(userid()));
		return SUCCESS;
	}
	
	//支付
	public String payOrder(){
		System.out.print("pay");
		setOrder(orderService.getOrder(getId()));
		orderService.payOrder(getOrder());
		return notSendOrders();
	}
	
	//显示未发货
	public String notSendOrders(){
		setOrders(orderService.getNotSendOrders(userid()));
		getOrders().addAll(orderService.getAlreadyPayOrders(userid()));
		return SUCCESS;
	}
	
	//显示未确认收货
	public String notTakeBookOrders(){
		System.out.print("杩涘叆鍒皀otTakeBookOrders");
		setOrders(orderService.getAlreadySendOrders(userid()));
		return SUCCESS;
	}
	
	//确认收货
	public String takeBook(){
		System.out.print("");
		setOrder(orderService.getOrder(getId()));
		orderService.takeBooks(getOrder());
		return notEvaluationOrders();
	}
	
	//显示未评价订单
	public String notEvaluationOrders(){
		setOrders(orderService.getNotEvaluationOrders(userid()));
		return SUCCESS;
	}
	
	//评价订单
	public String evaluationOrder(){
		setOrder(orderService.getOrder(getId()));
		orderService.evaluationOrder(getOrder(), "很好");
		return endOrders();
	}
	
	//申请退货
	public String requestRefund(){
		setOrder(orderService.getOrder(getId()));
		orderService.requestRefund(getOrder(), "买错了");
		return refundingOrders();
	}
	
	//显示退款中的订单
	public String refundingOrders(){
		setOrders(orderService.getRefundingOrders(userid()));
		return SUCCESS;
	}
	
	//显示用户所有订单
	public String allOrders(){
		System.out.print("");
		setOrders(orderService.getUserAllOrders(userid()));
		return "lis" +
				"torder";
	}
	
	//订单明细
	public String detail(){
		System.out.print("");
		setOrder(orderService.getOrder(getId()));
		List<Map<String,Object>> list=orderService.getOrderDetail(getOrder());
		books=new ArrayList<Book>();
		numbers=new Integer[list.size()];
		ifcomment=new Integer[list.size()];
		for(int i=0,j=list.size();i<j;i++){
			Map<String,Object> map=list.get(i);
			books.add((Book) map.get("book"));
			numbers[i]=(Integer) map.get("number");
			ifcomment[i]=(Integer) map.get("ifcomment");
		}
		return "detail";
	}
	
	//显示所有订单
	public String AllOrders(){
		setOrders(orderService.getAllOrders());
		return SUCCESS;
	}
	
	//显示所有已支付订单
	public String allAlreadyPayOrders(){
		setOrders(orderService.getAllAlreadyPayOrders());
		return SUCCESS;
	}
	
	//接单
	public String acceptOrder(){
		setOrder(orderService.getOrder(getId()));
		orderService.acceptOrder(getOrder());
		return allNotSendOrders();
	}
	
	//显示所有未发货订单
	public String allNotSendOrders(){
		setOrders(orderService.getAllNotSendOrders());
		return SUCCESS;
	}
	
	//发货
	public String sendBooks(){
		setOrder(orderService.getOrder(getId()));
		orderService.sendBooks(getOrder());
		return allNotSendOrders();
	}
	
	//显示所有已发货订单
	public String allSendingOrders(){
		setOrders(orderService.getAllSendingOrders());
		return SUCCESS;
	}
	
	//显示所有未评价订单
	public String allNotEvaluationOrders(){
		setOrders(orderService.getAllNotEvaluationOrders());
		return SUCCESS;
	}
	
	//显示所有退款中订单
	public String allRefundingOrders(){
		setOrders(orderService.getAllRefundingOrders());
		return SUCCESS;
	}
	
	//接受退货
	public String acceptRefund(){
		setOrder(orderService.getOrder(getId()));
		orderService.acceptRefund(getOrder());
		return allEndOrders();
	}
	
	//不接单
	public String notAcceptOrder(){
		setOrder(orderService.getOrder(getId()));
		orderService.notAcceptOrder(getOrder());
		return allEndOrders();
	}
	
	//获取所有已结束的订单
	public String allEndOrders(){
		System.out.print("");
		setOrders(orderService.getAllAlreadyEvaluationOrders());
		return SUCCESS;
	}
	
	//卖家取消订单
	public String cancelOrder(){
		setOrder(orderService.getOrder(getId()));
		orderService.cancelOrder(getOrder());
		return allEndOrders();
	}
	
	public String list()
	{
		setBooks(bookService.getAllBooksByPage(1,10));
		return SUCCESS;
	}
	
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		
		this.orderService = orderService;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getOrderState() {
		return orderState;
	}


	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}


	public BookService getBookService() {
		return bookService;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	
	public boolean[] getBuylist() {
		return buylist;
	}
	public void setBuylist(boolean[] buylist) {
		this.buylist = buylist;
	}
	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public void setNumbers(Integer[] numbers) {
		this.numbers = numbers;
	}
	public Integer[] getNumbers() {
		return numbers;
	}
	public Integer[] getIfcomment() {
		return ifcomment;
	}
	public void setIfcomment(Integer[] ifcomment) {
		this.ifcomment = ifcomment;
	}
	public List<Integer> getBookIds() {
		return bookIds;
	}
	public void setBookIds(List<Integer> bookIds) {
		this.bookIds = bookIds;
	}
	
	
}
