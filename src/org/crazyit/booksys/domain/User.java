package org.crazyit.booksys.domain;
import java.util.Date;

import javax.persistence.*;
/**
 * �û���Pojo��
 * @author �׳ж�
 *
 */
@Entity
@Table(name="user")
public class User {
	@Id @Column(name="userId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int    userId;//�û�id
	private String userName;//�û���
	private String useNickName;//�ռ�������
	private String userPassword;//����
	private String userEmail;//�ʼ�
	private String userSex;
	private String userAddress;
	private String userPhone;
	private String userPhoto;
	private Date   registDate;//ע��ʱ��
	//�����ݿ��в������ֶ�
	@Transient
	private String ruserPassword;//ȷ������
	@Transient
	private String NewPassword;//������
	@Transient
	private String testPassWord;//�ж������Ƿ���ȷ
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		System.out.println("ִ����setUserId����");
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
