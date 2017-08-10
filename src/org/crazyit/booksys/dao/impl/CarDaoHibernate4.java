package org.crazyit.booksys.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.crazyit.booksys.dao.CarDao;
import org.crazyit.booksys.domain.Car;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;

public class CarDaoHibernate4 extends BaseDaoHibernate4<Car> implements CarDao {
	@SuppressWarnings("unchecked")
	public List<Car> findByParam(String hql 
		, int bookid,int userid)
	{
		System.out.println("���뵽��ѯ���");
		// ������ѯ
		Query query = getSessionFactory().getCurrentSession()
			.createQuery(hql);
		// Ϊ����ռλ����HQL������ò���
		query.setInteger("bookid", bookid);
		query.setInteger("userid", userid);
		// ִ�з�ҳ�������ز�ѯ���
		return (List<Car>)query
				.list();
	}
	@SuppressWarnings("unchecked")
	public List<Car> findByParam(String hql 
			, int bookid){
		System.out.println("���뵽��ѯ���");
		// ������ѯ
		Query query = getSessionFactory().getCurrentSession()
			.createQuery(hql);
		// Ϊ����ռλ����HQL������ò���
		query.setInteger("bookid", bookid);
		// ִ�з�ҳ�������ز�ѯ���
		return (List<Car>)query
				.list();
	}
	@SuppressWarnings("unchecked")
	public List<Car> getAllCarById(int id){
		String hql = "from Car as s where s.userid=:userid";
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
			// Ϊ����ռλ����HQL������ò���
		query.setInteger("userid", id);
		
		return (List<Car>)query
				.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Car> findByParam(int id,String status) {
		// TODO Auto-generated method stub
		String hql = "from Car as s where s.userid=:userid and s.status=:status";
		Query query = getSessionFactory().getCurrentSession().createQuery(hql);
		query.setInteger("userid", id);
		query.setString("status", status);
		return (List<Car>)query.list();
	}
	
}
