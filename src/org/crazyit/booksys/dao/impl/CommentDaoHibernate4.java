package org.crazyit.booksys.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.crazyit.booksys.dao.CommentDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.booksys.domain.Comment;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;

public class CommentDaoHibernate4 extends BaseDaoHibernate4<Comment> implements
		CommentDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> findByParam(String hql, Book book) {
		// TODO Auto-generated method stub
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// 为包含占位符的HQL语句设置参数
			query.setEntity("book", book);
			query.setFirstResult((0) * 9);
			query.setMaxResults(9);
			// 执行分页，并返回查询结果
			return (List<Comment>)query
					.list();
		
	}

	//查找用户评论的记录数
	@Override
	public long findComCount(Book book) {
		String hql = "select count(*) from Comment as c where c.book=:book";
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// 为包含占位符的HQL语句设置参数
			query.setEntity("book", book);
			return (Long) query.list().get(0);
	}

	@Override
	public List<Comment> findByPage(String hql2, Book book, int currPage,
			int pageSize) {
		Query query = getSessionFactory().getCurrentSession().createQuery(hql2);
		query.setEntity("book", book);
		query.setFirstResult((currPage - 1) * pageSize);
		query.setMaxResults(pageSize);
		return (List<Comment>)query.list();
	}

	

}
