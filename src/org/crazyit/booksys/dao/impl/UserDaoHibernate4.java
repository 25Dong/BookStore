package org.crazyit.booksys.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.crazyit.booksys.dao.UserDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Manager;
import org.crazyit.booksys.domain.User;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDaoHibernate4 extends BaseDaoHibernate4<User> implements UserDao {
	// DAO������г־û������ײ�������SessionFactory���
	private SessionFactory sessionFactory;
	// ����ע��SessionFactory�����setter����
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory()
	{
		return this.sessionFactory;
	}
	
	//userDao��ʵ�ֵ�¼��֤
	@Override
	public User loginChenk(User user) {
		String hql = "from User where userName = ? and userPassword = ?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		query.setString(0,user.getUserName());
		query.setString(1,user.getUserPassword());
		List<User>  list = query.list();
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	//�û�ע��ʱ�����û������ֻ����Ƿ��Ѿ�����
	@Override
	public User registerCheck(User user) {
		String hql = "from User where userName = ? or userPhone = ?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		query.setString(0,user.getUserName());
		query.setString(1,user.getUserPhone());
		List<User>  list = query.list();
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	//Like User ������
	@Override
	public long findLikeCount(String userName) {
		String hql = "select count(*) from User as u where u.userName LIKE:name";
		try{
			Query queryObject = getSessionFactory().getCurrentSession().createQuery(hql);
			queryObject.setString("name",  "%" + userName + "%");
			return (Long) queryObject.list().get(0);
		}catch(RuntimeException re){
			throw re;
		}
	}
	//Like User
	@SuppressWarnings("unchecked")
	@Override
	public List<User> findLikeUser(String userName, int currPage, int pageSize) {
		String hql = "from User as u where u.userName LIKE:name";
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// Ϊ����ռλ����HQL������ò���
			query.setString("name",  "%" + userName + "%");
			query.setFirstResult((currPage - 1) * pageSize);
			query.setMaxResults(pageSize);
			return (List<User>)query.list();
	}



}
