package org.crazyit.booksys.action;

import java.util.Date;
import java.util.List;
import org.crazyit.booksys.domain.Car;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
import org.crazyit.booksys.service.CarService;
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
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private List<Car> cars;//保存用户购物车的信息
	private List<Order> orders;//保存用户订单信息
	private List<User> users;//保存Like查找到的用户
	private String uploadFileName;
	User editUser;//保存编辑的用户信息
	private int flag;//用于页面判断的标志
	//驱动模型
	User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	public User getUser() {
		System.out.println();
		return user;
	}
	public void setUser(User use) {
		this.user = use;
	}

	//注入Service层的类
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private CarService carService;	//购车车
	public void setCarService(CarService carService) {
		this.carService = carService;
	}
	private OrderService orderService;//订单
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	//*******************************************用户操作*****************************************
	//注册校验
	public void validateRegister(){
		setFlag(1);
	}
	//用户注册
	public String register(){
		user.setRegistDate(new Date());//设置注册时间属性
		String password=userService.encoderByMd5(user.getUserPassword());   //MD5加密
		user.setUserPassword(password);//加密的密码
		user.setRuserPassword(password);
		User exitUser = userService.registerCheck(user);
		if(exitUser != null){
			this.addActionError("该用户名或手机号已被注册！请重新填写");
			return "registerCheckError";
		}else{
			int result = userService.register(user);
			if(result>0){
				System.out.println("用户注册成功");
				return "registerSuccess";
			}else{
				System.out.println("用户注册失败");
				this.addActionError("对不起！注册失败，请稍后再试");
				return "regisError";
			}
		}

	}
	//登录验证
	public String loginCheck(){
		String password=userService.encoderByMd5(user.getUserPassword());//MD5加密
		user.setUserPassword(password);//加密的密码
		user.setRuserPassword(password);
		User exitUser = userService.loginCheck(user);
		if(exitUser == null){
			this.addActionError("登录失败！用户名或者密码错误！");
			return "loginError";
		}else{
			System.out.println("================================用户登录成功跳转到主页面=========================================");
			ActionContext.getContext().getSession().put("exitUser", exitUser);
			ActionContext context = ActionContext.getContext();
			context.getSession().put("status", "islogin");
			context.getSession().put("userid", exitUser.getUserId());
			context.getSession().put("username", exitUser.getUserName());
			return "loginSuccess";
		}

	}
	//用户退出登录
	public String exitLogin(){
		ActionContext.getContext().getSession().clear();
		return "exitLogin";
	}
	//根据用户id查找用户信息
	public void findUserByID(){
		editUser = userService.find(user.getUserId());
	}
	//跳转到更新用户，首先要根据id查找要修改的用户信息
	public String edit(){
		System.out.println("userAction点击用户管理传过来的用户id是"+user.getUserId());
		editUser = userService.find(user.getUserId());
		System.out.println("userAction类"+"编辑是查找到的用户信息是"+editUser.getUserName());
		//获取该用户的购车信息
		setCars(carService.getAllCarsById(editUser.getUserId())); 
		//获取该用户的订单信息
		setOrders(orderService.getUserAllOrders(editUser.getUserId())); 
		return "editSuccess";

	}
	//update
	public  String update(){
		userService.uadateUser(user);
		return "updateSu";//跳转到上传图片的action
	}

	//更新用户的密码
	public String updatePassWord(){
		System.out.println("加密前的测试密码是"+user.getTestPassWord());
		String passwordTest=userService.encoderByMd5(user.getTestPassWord());
		user.setTestPassWord(passwordTest);
		System.out.println("输入的测试密码是"+user.getTestPassWord());
		System.out.println("原本的的密码是"+user.getUserPassword());
		System.out.println("输入的新密码是"+user.getNewPassword());
		System.out.println("输入的的确认密码是"+user.getRuserPassword());
		if(!(user.getUserPassword().equals(user.getTestPassWord()))){
			System.out.println("用户输入的旧密码错误");
			this.addActionError("更改密码失败！输入旧密码错误！");
			return "updatePwdError";
		}else if(!(user.getRuserPassword().equals(user.getNewPassword()))){
			System.out.println("用户两次输入的密码不一致");
			this.addActionError("更新密码失败！两次输入的密码不一致！");
			return "updatePwdError";
		}else{
			String passwordNew=userService.encoderByMd5(user.getNewPassword());
			user.setUserPassword(passwordNew);
			userService.uadateUser(user);
			return "updatePwdSu";
		}

	}
	//用户更新头像
	public String updatePhoto(){
		userService.uadateUser(user);
		return "updatePhoto";
	}
	//*************************************************管理员操作*****************************
	//分页显示
	private int currPage =1;
	public String userList(){
		PageBean<User> pageBean = userService.findBypage(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "allUsers";
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	//删除用户
	public String delete(){
		userService.deleteUser(user.getUserId());
		return "deleteUserSu";
	}
	//分页like查找用户
	public String findLikeUser(){
		ActionContext.getContext().getSession().put("likeUserName", user.getUserName());
		PageBean<User> pageBean = userService.findLikeUser(user.getUserName(),currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findLikeUserSu";
	}
	//根据用户id查找用户的购物车信息
	public void findCartOfUser(){
		setCars(carService.getAllCarsById(editUser.getUserId())); 
	}
	//根据用户id查找订单信息
	public void findOderOfUser(){
		setOrders(orderService.getUserAllOrders(editUser.getUserId())); 
	}

	//******************************属性的get和set方法*****************************
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<Car> getCars() {
		return cars;
	}
	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
		user.setUserPhoto(uploadFileName);
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public User getEditUser() {
		return editUser;
	}
	public void setEditUser(User editUser) {
		this.editUser = editUser;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}



}
