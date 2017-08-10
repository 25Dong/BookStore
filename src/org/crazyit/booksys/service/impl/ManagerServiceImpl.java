package org.crazyit.booksys.service.impl;

import org.crazyit.booksys.dao.ManagerDao;
import org.crazyit.booksys.domain.Manager;
import org.crazyit.booksys.service.ManagerService;
import org.springframework.transaction.annotation.Transactional;

public class ManagerServiceImpl implements ManagerService {
	//ע��Dao�����
	private ManagerDao managerDao;
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	//����Աע��
	@Override
	@Transactional
	public int login(Manager manager) {
		return (Integer)managerDao.save(manager);
	}
	//����Ա��¼��֤
	@Override
	public Manager find(Manager manager) {
		Manager exitManager = managerDao.findbyNameAndPassword(manager);
		return exitManager;
	}
	
	
}
