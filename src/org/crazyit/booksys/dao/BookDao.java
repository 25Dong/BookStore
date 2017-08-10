package org.crazyit.booksys.dao;

import java.util.List;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.common.dao.BaseDao;


public interface BookDao extends BaseDao<Book>
{
	public List<Book> findByParam(String hql,String category);

	public List<Book> findLikeBook(String name,int currPage, int pageSize);
	//分页查找不同类型的图书
	public List<Book> categorylist(String category, int currPage, int pageSize);

	public long findCategoryCount(String category);
	//返回LIke查找的图书的记录的数
	public long findLikeCount(String name);
	
}
