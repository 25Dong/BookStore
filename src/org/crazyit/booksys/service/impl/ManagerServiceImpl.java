package org.crazyit.booksys.service.impl;

import org.crazyit.booksys.dao.ManagerDao;
import org.crazyit.booksys.domain.Manager;
import org.crazyit.booksys.service.ManagerService;
import org.springframework.transaction.annotation.Transactional;

public class ManagerServiceImpl implements ManagerService {
	//注入Dao层的类
	private ManagerDao managerDao;
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	//管理员注册
	@Override
	@Transactional
	public int login(Manager manager) {
		return (Integer)managerDao.save(manager);
	}
	//管理员登录验证
	@Override
	public Manager find(Manager manager) {
		Manager exitManager = managerDao.findbyNameAndPassword(manager);
		return exitManager;
	}
	
	
}
