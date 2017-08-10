package org.crazyit.booksys.domain;
import java.util.Date;

import javax.persistence.*;
/**
 * 用户的Pojo类
 * @author 易承东
 *
 */
@Entity
@Table(name="user")
public class User {
	@Id @Column(name="userId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int    userId;//用户id
	private String userName;//用户名
	private String useNickName;//收件人名称
	private String userPassword;//密码
	private String userEmail;//邮件
	private String userSex;
	private String userAddress;
	private String userPhone;
	private String userPhoto;
	private Date   registDate;//注册时间
	//在数据库中不生成字段
	@Transient
	private String ruserPassword;//确认密码
	@Transient
	private String NewPassword;//新密码
	@Transient
	private String testPassWord;//判断密码是否正确
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		System.out.println("执行了setUserId方法");
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	@Override
	public String toString() {
		return super.toString();
	}
	public String getRuserPassword() {
		return ruserPassword;
	}
	public void setRuserPassword(String ruserPassword) {
		this.ruserPassword = ruserPassword;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getNewPassword() {
		return NewPassword;
	}
	public void setNewPassword(String newPassword) {
		NewPassword = newPassword;
	}
	public String getTestPassWord() {
		return testPassWord;
	}
	public void setTestPassWord(String testPassWord) {
		this.testPassWord = testPassWord;
	}
	public String getUseNickName() {
		return useNickName;
	}
	public void setUseNickName(String useNickName) {
		this.useNickName = useNickName;
	}
	
	
	
	
	
}
