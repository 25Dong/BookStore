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
 * @author �׳ж�
 *
 */
@SuppressWarnings("serial")
public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {
	private int userCount;//�ܵ��û���
	private int bookCount;//�ܵ��鱾��
	private int oderCount;//�ܵĶ�����
	private int sales;//��������
	private int orderSuccess;//���׳ɹ��Ķ�����
	private double income;//�ܵ�����
	
	
	//ģ������
	Manager manager = new Manager();
	@Override
	public Manager getModel() {
		return manager;
	}

	//ע��Service�����
	private ManagerService managerService;
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	private BookService bookService;//�鱾
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	private UserService userService;//�û�
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private OrderService orderService;//����
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	//��ת������Ա��¼ҳ��
	public String loginPage(){
		return "loginPage";
	}
	//����ע��
	public String register(){
		int result = managerService.login(manager);
		if(result>0){
			System.out.println("ע�����Ա�ɹ�");
		}else{
			System.out.println("ע�����Աʧ��");
		}
		return NONE;
	}
	//����Ա��¼
	public String login(){
		Manager exitManager = managerService.find( manager);
		if(exitManager == null){
			this.addActionError("�û��������������");
			return "loginError";
		}else{
			System.out.println("ManagerAction��¼��ѯ���ݿ�󷵻صĹ����û�����"+exitManager.getManagerName());
			ActionContext context = ActionContext.getContext();
			context.getSession().put("manage", exitManager.getManagerName());
			return "AdloginSuc";
		}

	}
	//��̨������ݷ���
	public String dataAnalysis(){
		setUserCount((int) userService.findCount());
		setBookCount((int) bookService.findCount());
		setOderCount((int) orderService.findCount());
		setIncome(orderService.getIncome());
		setSales(bookService.getSales());
		setOrderSuccess(orderService.getSuccessCout());
		return "dataSuc";
	}
	//��̨��������������action��ת
	public String manOder(){
		return "manOder";
	}
	//��̨��������û������action��ת
	public String user(){
		return "AdloginSuc";
	}
	//��̨��������û�����JSPҳ����ת
	public String findUser(){
		return "findUser";
	}
	//��̨��������ϼܺ����JSPҳ����ת
	public String NewBook(){
		return "NewBook";
	}
	//����Ա��̨��ҳ�������е�ͼ����Ϣ
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
	//��̨�������ͼ������JSPҳ����ת
	public String finBook(){
		return "findBook";
	}
	//��̨�����������ת����������jspҳ��
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
