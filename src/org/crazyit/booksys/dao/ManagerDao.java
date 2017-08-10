package org.crazyit.booksys.dao;

import org.crazyit.booksys.domain.Manager;
import org.crazyit.common.dao.BaseDao;

public interface ManagerDao extends BaseDao<Manager> {
	//根据管理员的密码和用户名验证登录
	Manager findbyNameAndPassword(Manager manager);

	

}
