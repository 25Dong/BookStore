package org.crazyit.booksys.service.impl;

import java.util.List;

import org.crazyit.booksys.dao.CarDao;
import org.crazyit.booksys.domain.Car;
import org.crazyit.booksys.service.CarService;

public class CarServiceImpl implements CarService{
	private CarDao carDao;
	
	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}

	@Override
	public int addCar(Car car) {
		// TODO Auto-generated method stub
		return (Integer)carDao.save(car);
	}

	@Override
	public List<Car> getAllCars() {
		// TODO Auto-generated method stub
		return carDao.findAll(Car.class);
	}

	@Override
	public List<Car> getAllCarsByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return carDao.findByPage(Car.class, pageNo, pageSize);
	}

	@Override
	public void deleteCar(int id) {
		// TODO Auto-generated method stub
		carDao.delete(Car.class, id);
	}

	@Override
	public Car findById(int id) {
		// TODO Auto-generated method stub
		return carDao.get(Car.class, id);
	}

	@Override
	public List<Car> findByparame(String hql, int bookid,int userid) {
		// TODO Auto-generated method stub
		return carDao.findByParam(hql, bookid,userid);
	}

	@Override
	public void update(Car car) {
		// TODO Auto-generated method stub
		carDao.update(car);
	}

	@Override
	public List<Car> getAllCarsById(int id) {
		// TODO Auto-generated method stub
		return carDao.getAllCarById(id);
	}

	@Override
	public List<Car> findByparame(String hql, int bookid) {
		// TODO Auto-generated method stub
		return carDao.findByParam(hql, bookid);
	}

	@Override
	public void deleteBook(int id) {
		// TODO Auto-generated method stub
		carDao.delete(Car.class, id);
	}

	@Override
	public List<Car> findByParame(int id,String status) {
		// TODO Auto-generated method stub
		return carDao.findByParam(id,status);
	}

	@Override
	public void deleteCar(Car car) {
		// TODO Auto-generated method stub
		carDao.delete(car);
	}

}
