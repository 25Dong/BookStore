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
	//����Ա��ҳ��������ͼ��
	@Override
	public PageBean<Book> findBypage(int currPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//��װ�ܼ�¼��
		int totalCount = (int) bookDao.findCount(Book.class);
		//��װÿҳ����ʾ�ļ�¼��
		int pageSize = 6;
		pageBean.setDate(currPage, pageSize, totalCount);
		//��װÿҳ��ʾ������
		List<Book> list = bookDao.findByPage(Book.class, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	//����Ա���Ʋ���ͼ��
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
	//��ҳ���Ҳ�ͬ���͵�ͼ��
	public PageBean<Book> categorylist(String category, int currPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		int pageSize = 6;
		//���Ҹ�����ͼ����ܼ�¼��
		int totalCount = (int) bookDao.findCategoryCount(category);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<Book> list = bookDao.categorylist(category, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	//�û��鿴ͼ�����������
	//�û�����ͼ��۸�����鿴ͼ��
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
