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

	//ͼ����ϸ��Ϣ������ͼ��ķ�ҳ��ѯ
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findByParam(String hql,String category) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// Ϊ����ռλ����HQL������ò���
			query.setString("category", category);
			query.setFirstResult((0) * 6);
			query.setMaxResults(6);// ִ�з�ҳ�������ز�ѯ���
			return (List<Book>)query
					.list();
	}

	//��ҳ���Ҳ�ͬ���͵�ͼ��
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

	//����LIke���ҵ�ͼ��ļ�¼����
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
	//��ҳLike����ͼ��
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findLikeBook(String bookName,int currPage, int pageSize) {
	   String hql = "from Book as b where b.name LIKE:name";
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// Ϊ����ռλ����HQL������ò���
			query.setString("name",  "%" + bookName + "%");
			query.setFirstResult((currPage - 1) * pageSize);
			query.setMaxResults(pageSize);
			return (List<Book>)query.list();
	}


	
}
