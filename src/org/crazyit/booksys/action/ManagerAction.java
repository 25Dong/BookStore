package org.crazyit.booksys.action;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Manager;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.service.BookService;
import org.crazyit.booksys.service.ManagerService;
import org.crazyit.booksys.service.OrderService;
import org.crazyit.booksys.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 
 * @author 易承东
 *
 */
@SuppressWarnings("serial")
public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {
	private int userCount;//总的用户数
	private int bookCount;//总的书本数
	private int oderCount;//总的订单数
	private int sales;//销售总数
	private int orderSuccess;//交易成功的订单数
	private double income;//总的收入
	
	
	//模型驱动
	Manager manager = new Manager();
	@Override
	public Manager getModel() {
		return manager;
	}

	//注入Service层的类
	private ManagerService managerService;
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	private BookService bookService;//书本
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	private UserService userService;//用户
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private OrderService orderService;//订单
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	//跳转到管理员登录页面
	public String loginPage(){
		return "loginPage";
	}
	//管理注册
	public String register(){
		int result = managerService.login(manager);
		if(result>0){
			System.out.println("注册管理员成功");
		}else{
			System.out.println("注册管理员失败");
		}
		return NONE;
	}
	//管理员登录
	public String login(){
		Manager exitManager = managerService.find( manager);
		if(exitManager == null){
			this.addActionError("用户名或者密码错误");
			return "loginError";
		}else{
			System.out.println("ManagerAction登录查询数据库后返回的管理用户名是"+exitManager.getManagerName());
			ActionContext context = ActionContext.getContext();
			context.getSession().put("manage", exitManager.getManagerName());
			return "AdloginSuc";
		}

	}
	//后台点击数据分析
	public String dataAnalysis(){
		setUserCount((int) userService.findCount());
		setBookCount((int) bookService.findCount());
		setOderCount((int) orderService.findCount());
		setIncome(orderService.getIncome());
		setSales(bookService.getSales());
		setOrderSuccess(orderService.getSuccessCout());
		return "dataSuc";
	}
	//后台点击管理订单后进行action跳转
	public String manOder(){
		return "manOder";
	}
	//后台点击管理用户后进行action跳转
	public String user(){
		return "AdloginSuc";
	}
	//后台点击查找用户进行JSP页面跳转
	public String findUser(){
		return "findUser";
	}
	//后台点击新书上架后进行JSP页面跳转
	public String NewBook(){
		return "NewBook";
	}
	//管理员后台分页查找所有的图书信息
	private int currPage =1;
	public String AllBook(){
		PageBean<Book> pageBean = bookService.findBypage(currPage);
		System.out.println(pageBean.getList());
		ActionContext.getContext().getValueStack().push(pageBean);
		return "allBooks";
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	//后台点击查找图书后进行JSP页面跳转
	public String finBook(){
		return "findBook";
	}
	//后台点击广告管理跳转到发布广告的jsp页面
	public String NewAdvertise(){
		return "NewAdvertise";
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public int getOderCount() {
		return oderCount;
	}

	public void setOderCount(int oderCount) {
		this.oderCount = oderCount;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getOrderSuccess() {
		return orderSuccess;
	}

	public void setOrderSuccess(int orderSuccess) {
		this.orderSuccess = orderSuccess;
	}

}
