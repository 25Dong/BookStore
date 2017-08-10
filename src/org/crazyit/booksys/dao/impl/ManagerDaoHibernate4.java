package org.crazyit.booksys.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.crazyit.booksys.dao.ManagerDao;
import org.crazyit.booksys.domain.Manager;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ManagerDaoHibernate4 extends BaseDaoHibernate4<Manager>implements ManagerDao {

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
	@Override
	public Manager findbyNameAndPassword(Manager manager) {
		String hql = "from Manager where managerName = ? and managerPassword = ?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		query.setString(0, manager.getManagerName());
		query.setString(1,manager.getManagerPassword());
		List< Manager>  list = query.list();
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

/*	@Override
	public Manager get(Class<Manager> entityClazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Serializable save(Manager entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Manager entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Manager entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Class<Manager> entityClazz, Serializable id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Manager> findAll(Class<Manager> entityClazz, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long findCount(Class<Manager> entityClazz) {
		// TODO Auto-generated method stub
		return 0;
	}*/

}
