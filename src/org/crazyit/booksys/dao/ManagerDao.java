package org.crazyit.booksys.dao;

import org.crazyit.booksys.domain.Manager;
import org.crazyit.common.dao.BaseDao;

public interface ManagerDao extends BaseDao<Manager> {
	//���ݹ���Ա��������û�����֤��¼
	Manager findbyNameAndPassword(Manager manager);

	

}
