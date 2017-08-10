package org.crazyit.booksys.service;

import java.util.List;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
public interface BookService
{

	int addBook(Book book);

	List<Book> getAllBooks();
	//分页查找
	List<Book> getAllBooksByPage(int pageno,int pagesize);
	
	Book findbyid(int id);
	
	public long findCount();
	
	List<Book> findByparame(String hql,String category);
	
	void deleteBook(int id);
	//更新图书
	void update(Book book);
	//查找所有图书
	PageBean<Book> findBypage(int currPage);
	//管理员相似查找图书
	PageBean<Book> findLikeBook(String name,int currPage);
	//分页查找不同类型的图书
	PageBean<Book> categorylist(String category, int currPage);
	
	//用户查看图书的销量排行
	//用户按照图书价格升序查看图书
	PageBean<Book> findByParam(String hql,int currPage);
	
	//获取销售总量
	int getSales();
}
