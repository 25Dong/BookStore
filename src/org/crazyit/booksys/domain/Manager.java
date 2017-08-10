package org.crazyit.booksys.domain;

import javax.persistence.*;
@Entity
@Table(name="manager")
public class Manager {
	@Id @Column(name="managerId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int managerId;
	private String managerName;
	private String managerPassword;
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	
	

}
