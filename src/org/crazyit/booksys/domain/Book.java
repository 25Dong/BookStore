package org.crazyit.booksys.domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;


@Entity
@Table(name="book_inf")
public class Book
{
	@Id @Column(name="book_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="book_name")
	private String name;
	private double price;
	private String author;
	private String photoname;
	private String category;
	private String bookPrss;//出版社
	private int bookSales;//销量
	private int bookAmount;//库存量
	private Date  bookShelvetDate;//上架时间
	private String bookIntroduction;//书本简介

	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public double getPrice()
	{
		return price;
	}
	public void setPrice(double price)
	{
		this.price = price;
	}
	public String getAuthor()
	{
		return author;
	}
	public void setAuthor(String author)
	{
		this.author = author;
	}
	public int getBookAmount() {
		return bookAmount;
	}
	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}
	public int getBookSales() {
		return bookSales;
	}
	public void setBookSales(int bookSales) {
		this.bookSales = bookSales;
	}
	public Date getBookShelvetDate() {
		return bookShelvetDate;
	}
	public void setBookShelvetDate(Date bookShelvetDate) {
		this.bookShelvetDate = bookShelvetDate;
	}
	public String getBookPrss() {
		return bookPrss;
	}
	public void setBookPrss(String bookPrss) {
		this.bookPrss = bookPrss;
	}
	public String getBookIntroduction() {
		return bookIntroduction;
	}
	public void setBookIntroduction(String bookIntroduction) {
		this.bookIntroduction = bookIntroduction;
	}
}
