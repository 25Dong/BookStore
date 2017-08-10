package org.crazyit.common.dao;

import java.util.List;
import java.io.Serializable;

public interface BaseDao<T>
{
	// ����ID����ʵ��
	T get(Class<T> entityClazz , Serializable id);
	// ����ʵ��
	Serializable save(T entity);
	// ����ʵ��
	void update(T entity);
	// ɾ��ʵ��
	void delete(T entity);
	// ����IDɾ��ʵ��
	void delete(Class<T> entityClazz , Serializable id);
	// ��ȡ����ʵ��
	List<T> findAll(Class<T> entityClazz);
	
	List<T> findByPage(Class<T> entityClazz,
			 int pageNo, int pageSize);
	//�׳ж����
		List<T> findByParam(String hql,Class<T> entityClazz,
				 int pageNo, int pageSize);
	// ��ȡʵ������
	long findCount(Class<T> entityClazz);
}
