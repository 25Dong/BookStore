package org.crazyit.booksys.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="orders")
public class Order {
	
	@Id @Column(name="order_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	private Integer userId;
	
	private String orderTime;
	private String orderState;
	private String orderEvaluation;
	private String orderStateReason;
	private double orderPrice;
	
	private String userName;
	private String userAddress;
	private String userPhone;

	@OneToMany(targetEntity=org.crazyit.booksys.domain.OrderDetail.class,
			cascade={CascadeType.ALL}  ) 
	@JoinColumn(name="order_id")
	private Set<OrderDetail> orderDetail=new HashSet<OrderDetail>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}


	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public void setOrderEvaluation(String orderEvaluation) {
		this.orderEvaluation = orderEvaluation;
	}

	public String getOrderEvaluation() {
		return orderEvaluation;
	}

	public void setOrderStateReason(String orderStateReason) {
		this.orderStateReason = orderStateReason;
	}

	public String getOrderStateReason() {
		return orderStateReason;
	}

	
}
