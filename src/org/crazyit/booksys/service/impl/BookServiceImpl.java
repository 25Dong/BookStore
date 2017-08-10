package org.crazyit.booksys.service.impl;

import java.util.List;

import org.crazyit.booksys.dao.BookDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
import org.crazyit.booksys.service.BookService;

public class BookServiceImpl implements BookService
{
	private BookDao bookDao;

	public void setBookDao(BookDao bookDao)
	{
		this.bookDao = bookDao;
	}

	@Override
	public int addBook(Book book)
	{
		return (Integer) bookDao.save(book);
	}

	@Override
	public List<Book> getAllBooks()
	{
		return bookDao.findAll(Book.class);
	}

	@Override
	public void deleteBook(int id)
	{
		bookDao.delete(Book.class, id);
	}

	@Override
	public long findCount() {
		// TODO Auto-generated method stub
		return bookDao.findCount(Book.class);
	}

	@Override
	public List<Book> getAllBooksByPage(int pageno, int pagesize) {
		// TODO Auto-generated method stub
		return bookDao.findByPage(Book.class, pageno, pagesize);
	}

	@Override
	public Book findbyid(int id) {
		// TODO Auto-generated method stub
		return bookDao.get(Book.class, id);
	}

	@Override
	public List<Book> findByparame(String hql,String category) {
		// TODO Auto-generated method stub
		return bookDao.findByParam(hql, category);
	}

	@Override
	public void update(Book book) {

		bookDao.update(book);
	}
	//管理员分页查找所有图书
	@Override
	public PageBean<Book> findBypage(int currPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//封装总记录数
		int totalCount = (int) bookDao.findCount(Book.class);
		//封装每页的显示的记录数
		int pageSize = 6;
		pageBean.setDate(currPage, pageSize, totalCount);
		//封装每页显示的数据
		List<Book> list = bookDao.findByPage(Book.class, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	//管理员相似查找图书
	@Override
	public PageBean<Book> findLikeBook(String name,int currPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		int pageSize = 6;
		int totalCount = (int) bookDao.findLikeCount(name);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<Book> list = bookDao.findLikeBook(name,currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	//分页查找不同类型的图书
	public PageBean<Book> categorylist(String category, int currPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		int pageSize = 6;
		//查找给类型图书的总记录数
		int totalCount = (int) bookDao.findCategoryCount(category);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<Book> list = bookDao.categorylist(category, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	//用户查看图书的销量排行
	//用户按照图书价格升序查看图书
	public PageBean<Book> findByParam(String hql,int currPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		int pageSize = 6;
		int totalCount = (int) bookDao.findCount(Book.class);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<Book> list = bookDao.findByParam(hql, Book.class, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public int getSales() {
		// TODO Auto-generated method stub
		List<Book> list = bookDao.findAll(Book.class);
		int sales=0;
		for(Book book:list){
			sales+=book.getBookSales();
		}
		return sales;
	}
}
