package org.crazyit.booksys.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="car_inf")
public class Car {
	@Id @Column(name="car_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private double price;
	private int count;
	private String time;
	private int bookid;
	private String photoname;
	private String status;
	private int userid;
	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		System.out.println("当前时间是"+time);
		this.time = time;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("书本名字是"+name);
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		System.out.println("价格是"+price);
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		System.out.println("数量是"+count);
		this.count = count;
	}
	
}
