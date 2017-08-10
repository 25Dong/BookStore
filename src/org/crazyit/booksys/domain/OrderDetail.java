package org.crazyit.booksys.domain;


import javax.persistence.*;
@Entity
@Table(name="OrderDetail")
public class OrderDetail {
	
	@Id @Column(name="orderDetailId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(targetEntity=org.crazyit.booksys.domain.Order.class,
			cascade={CascadeType.MERGE,CascadeType.PERSIST}  ) 
	@JoinColumn(name="order_id")
	private Order order;
	
	@ManyToOne(targetEntity=org.crazyit.booksys.domain.Book.class,
			cascade={CascadeType.ALL,}) 
	@JoinColumn(name="book_id")
	private Book book;
	
	private Integer number;
	private int ifcomment;

	
	public int getIfcomment() {
		return ifcomment;
	}

	public void setIfcomment(int ifcomment) {
		this.ifcomment = ifcomment;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getNumber() {
		return number;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Order getOrder() {
		return order;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Book getBook() {
		return book;
	}
	
}
