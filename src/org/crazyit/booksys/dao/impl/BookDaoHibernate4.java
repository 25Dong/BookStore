package org.crazyit.booksys.dao.impl;

import java.util.List;

import org.crazyit.booksys.dao.BookDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;

public class BookDaoHibernate4 extends BaseDaoHibernate4<Book>
	implements BookDao
{

	//图书详细信息中相似图书的分页查询
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findByParam(String hql,String category) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// 为包含占位符的HQL语句设置参数
			query.setString("category", category);
			query.setFirstResult((0) * 6);
			query.setMaxResults(6);// 执行分页，并返回查询结果
			return (List<Book>)query
					.list();
	}

	//分页查找不同类型的图书
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> categorylist(String category, int currPage, int pageSize) {
		String hql = "from Book as b where b.category=:category";
		try{
			Query queryObject = getSessionFactory().getCurrentSession().createQuery(hql);
			queryObject.setString("category", category);
			queryObject.setFirstResult((currPage - 1) * pageSize);
			queryObject.setMaxResults(pageSize);
			return queryObject.list();
		}catch(RuntimeException re){
			throw re;
		}
	}


	@Override
	public long findCategoryCount(String category) {
		String hql = "select count(*) from Book b where b.category=:category";
		try{
			Query queryObject = getSessionFactory().getCurrentSession().createQuery(hql);
			queryObject.setString("category", category);
			return (Long) queryObject.list().get(0);
		}catch(RuntimeException re){
			throw re;
		}
	}

	//返回LIke查找的图书的记录的数
	@Override
	public long findLikeCount(String name) {
		String hql = "select count(*) from Book b where b.name LIKE:name";
		try{
			Query queryObject = getSessionFactory().getCurrentSession().createQuery(hql);
			queryObject.setString("name",  "%" + name + "%");
			return (Long) queryObject.list().get(0);
		}catch(RuntimeException re){
			throw re;
		}
	}
	//分页Like查找图书
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findLikeBook(String bookName,int currPage, int pageSize) {
	   String hql = "from Book as b where b.name LIKE:name";
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// 为包含占位符的HQL语句设置参数
			query.setString("name",  "%" + bookName + "%");
			query.setFirstResult((currPage - 1) * pageSize);
			query.setMaxResults(pageSize);
			return (List<Book>)query.list();
	}


	
}
