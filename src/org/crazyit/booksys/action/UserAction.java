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
 * @author �׳ж�
 *
 */
@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private List<Car> cars;//�����û����ﳵ����Ϣ
	private List<Order> orders;//�����û�������Ϣ
	private List<User> users;//����Like���ҵ����û�
	private String uploadFileName;
	User editUser;//����༭���û���Ϣ
	private int flag;//����ҳ���жϵı�־
	//����ģ��
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

	//ע��Service�����
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private CarService carService;	//������
	public void setCarService(CarService carService) {
		this.carService = carService;
	}
	private OrderService orderService;//����
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	//*******************************************�û�����*****************************************
	//ע��У��
	public void validateRegister(){
		setFlag(1);
	}
	//�û�ע��
	public String register(){
		user.setRegistDate(new Date());//����ע��ʱ������
		String password=userService.encoderByMd5(user.getUserPassword());   //MD5����
		user.setUserPassword(password);//���ܵ�����
		user.setRuserPassword(password);
		User exitUser = userService.registerCheck(user);
		if(exitUser != null){
			this.addActionError("���û������ֻ����ѱ�ע�ᣡ��������д");
			return "registerCheckError";
		}else{
			int result = userService.register(user);
			if(result>0){
				System.out.println("�û�ע��ɹ�");
				return "registerSuccess";
			}else{
				System.out.println("�û�ע��ʧ��");
				this.addActionError("�Բ���ע��ʧ�ܣ����Ժ�����");
				return "regisError";
			}
		}

	}
	//��¼��֤
	public String loginCheck(){
		String password=userService.encoderByMd5(user.getUserPassword());//MD5����
		user.setUserPassword(password);//���ܵ�����
		user.setRuserPassword(password);
		User exitUser = userService.loginCheck(user);
		if(exitUser == null){
			this.addActionError("��¼ʧ�ܣ��û��������������");
			return "loginError";
		}else{
			System.out.println("================================�û���¼�ɹ���ת����ҳ��=========================================");
			ActionContext.getContext().getSession().put("exitUser", exitUser);
			ActionContext context = ActionContext.getContext();
			context.getSession().put("status", "islogin");
			context.getSession().put("userid", exitUser.getUserId());
			context.getSession().put("username", exitUser.getUserName());
			return "loginSuccess";
		}

	}
	//�û��˳���¼
	public String exitLogin(){
		ActionContext.getContext().getSession().clear();
		return "exitLogin";
	}
	//�����û�id�����û���Ϣ
	public void findUserByID(){
		editUser = userService.find(user.getUserId());
	}
	//��ת�������û�������Ҫ����id����Ҫ�޸ĵ��û���Ϣ
	public String edit(){
		System.out.println("userAction����û������������û�id��"+user.getUserId());
		editUser = userService.find(user.getUserId());
		System.out.println("userAction��"+"�༭�ǲ��ҵ����û���Ϣ��"+editUser.getUserName());
		//��ȡ���û��Ĺ�����Ϣ
		setCars(carService.getAllCarsById(editUser.getUserId())); 
		//��ȡ���û��Ķ�����Ϣ
		setOrders(orderService.getUserAllOrders(editUser.getUserId())); 
		return "editSuccess";

	}
	//update
	public  String update(){
		userService.uadateUser(user);
		return "updateSu";//��ת���ϴ�ͼƬ��action
	}

	//�����û�������
	public String updatePassWord(){
		System.out.println("����ǰ�Ĳ���������"+user.getTestPassWord());
		String passwordTest=userService.encoderByMd5(user.getTestPassWord());
		user.setTestPassWord(passwordTest);
		System.out.println("����Ĳ���������"+user.getTestPassWord());
		System.out.println("ԭ���ĵ�������"+user.getUserPassword());
		System.out.println("�������������"+user.getNewPassword());
		System.out.println("����ĵ�ȷ��������"+user.getRuserPassword());
		if(!(user.getUserPassword().equals(user.getTestPassWord()))){
			System.out.println("�û�����ľ��������");
			this.addActionError("��������ʧ�ܣ�������������");
			return "updatePwdError";
		}else if(!(user.getRuserPassword().equals(user.getNewPassword()))){
			System.out.println("�û�������������벻һ��");
			this.addActionError("��������ʧ�ܣ�������������벻һ�£�");
			return "updatePwdError";
		}else{
			String passwordNew=userService.encoderByMd5(user.getNewPassword());
			user.setUserPassword(passwordNew);
			userService.uadateUser(user);
			return "updatePwdSu";
		}

	}
	//�û�����ͷ��
	public String updatePhoto(){
		userService.uadateUser(user);
		return "updatePhoto";
	}
	//*************************************************����Ա����*****************************
	//��ҳ��ʾ
	private int currPage =1;
	public String userList(){
		PageBean<User> pageBean = userService.findBypage(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "allUsers";
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	//ɾ���û�
	public String delete(){
		userService.deleteUser(user.getUserId());
		return "deleteUserSu";
	}
	//��ҳlike�����û�
	public String findLikeUser(){
		ActionContext.getContext().getSession().put("likeUserName", user.getUserName());
		PageBean<User> pageBean = userService.findLikeUser(user.getUserName(),currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findLikeUserSu";
	}
	//�����û�id�����û��Ĺ��ﳵ��Ϣ
	public void findCartOfUser(){
		setCars(carService.getAllCarsById(editUser.getUserId())); 
	}
	//�����û�id���Ҷ�����Ϣ
	public void findOderOfUser(){
		setOrders(orderService.getUserAllOrders(editUser.getUserId())); 
	}

	//******************************���Ե�get��set����*****************************
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
