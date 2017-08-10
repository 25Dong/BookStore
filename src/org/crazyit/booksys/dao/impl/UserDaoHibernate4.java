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
	// DAO组件进行持久化操作底层依赖的SessionFactory组件
	private SessionFactory sessionFactory;
	// 依赖注入SessionFactory所需的setter方法
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory()
	{
		return this.sessionFactory;
	}
	
	//userDao层实现登录验证
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
	//用户注册时检验用户名和手机号是否已经存在
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
	//Like User 的总数
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
			// 为包含占位符的HQL语句设置参数
			query.setString("name",  "%" + userName + "%");
			query.setFirstResult((currPage - 1) * pageSize);
			query.setMaxResults(pageSize);
			return (List<User>)query.list();
	}



}
