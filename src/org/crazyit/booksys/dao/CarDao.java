package org.crazyit.booksys.dao;

import java.util.List;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.common.dao.BaseDao;

public interface CarDao extends BaseDao<Car>{
	public List<Car> findByParam(String hql 
			, int bookid,int userid);
	public List<Car> findByParam(String hql 
			, int bookid);
	public List<Car> getAllCarById(int id);
	public List<Car> findByParam(int id,String status);
}
