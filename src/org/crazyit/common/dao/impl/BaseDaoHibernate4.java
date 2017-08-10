package org.crazyit.common.dao.impl;

import org.hibernate.*;

import java.util.List;
import java.io.Serializable;

import org.crazyit.booksys.domain.Book;
import org.crazyit.common.dao.*;
public class BaseDaoHibernate4<T> implements BaseDao<T>
{
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
	// ����ID����ʵ��
	@SuppressWarnings("unchecked")
	public T get(Class<T> entityClazz , Serializable id)
	{
		System.out.println("���뵽get�����");
		return (T)getSessionFactory().getCurrentSession()
			.get(entityClazz , id);
	}
	// ����ʵ��
	public Serializable save(T entity)
	{
		return getSessionFactory().getCurrentSession()
			.save(entity);
	}
	// ����ʵ��
	public void update(T entity)
	{
		getSessionFactory().getCurrentSession().saveOrUpdate(entity);
	}
	// ɾ��ʵ��
	public void delete(T entity)
	{
		getSessionFactory().getCurrentSession().delete(entity);
	}
	// ����IDɾ��ʵ��
	public void delete(Class<T> entityClazz , Serializable id)
	{
		getSessionFactory().getCurrentSession()
			.createQuery("delete " + entityClazz.getSimpleName()
				+ " en where en.id = ?0")
			.setParameter("0" , id)
			.executeUpdate();
	}
	// ��ȡ����ʵ��
	public List<T> findAll(Class<T> entityClazz)
	{
		return find("select en from "
			+ entityClazz.getSimpleName() + " en");
	}
	// ��ȡʵ������
	
	public long findCount(Class<T> entityClazz)
	{
		List<?> l = find("select count(*) from "
			+ entityClazz.getSimpleName());
		// ���ز�ѯ�õ���ʵ������
		if (l != null && l.size() == 1 )
		{
			return (Long)l.get(0);
		}
		return 0;
	}

	// ����HQL����ѯʵ��
	@SuppressWarnings("unchecked")
	protected List<T> find(String hql)
	{
		
		return (List<T>)getSessionFactory().getCurrentSession()
				.createQuery(hql)
				.list();
	}
	@SuppressWarnings("unchecked")
	protected List<T> find(String hql,int pageNo,int pageSize)
	{
		
		return (List<T>)getSessionFactory().getCurrentSession()
			.createQuery(hql)
			.setFirstResult((pageNo-1)*pageSize)
			.setMaxResults(pageSize)
			.list();
	}
	// ���ݴ�ռλ������HQL����ѯʵ��
	@SuppressWarnings("unchecked")
	protected List<T> find(String hql , Object... params)
	{
		// ������ѯ
		Query query = getSessionFactory().getCurrentSession()
			.createQuery(hql);
		// Ϊ����ռλ����HQL������ò���
		for(int i = 0 , len = params.length ; i < len ; i++)
		{
			query.setParameter(i  , params[i]);
		}
		return (List<T>)query.list();
	}
	
	//��ҳ��ѯ����
	public List<T> findByPage(Class<T> entityClazz,
		 int pageNo, int pageSize)
	{
		return find("select en from "
				+ entityClazz.getSimpleName() + " en",pageNo,pageSize);
	}
	
	@Override
	public List<T> findByParam(String hql, Class<T> entityClazz, int pageNo,
			int pageSize) {
		try{
			Query queryObject = getSessionFactory().getCurrentSession().createQuery(hql);
			queryObject.setFirstResult((pageNo - 1) * pageSize);
			queryObject.setMaxResults(pageSize);
			return queryObject.list();
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	
}
