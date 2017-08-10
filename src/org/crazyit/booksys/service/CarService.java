package org.crazyit.booksys.service;

import java.util.List;


import org.crazyit.booksys.domain.Car;

public interface CarService {
	int addCar(Car car);

	List<Car> getAllCars();
	
	List<Car> getAllCarsByPage(int pageNo,int pageSize);
	
	Car findById(int id);
	
	void deleteCar(int id);
	
	List<Car> findByparame(String hql,int bookid);
	List<Car> findByparame(String hql,int bookid,int userid);
	List<Car> findByParame(int id,String status);
	List<Car> getAllCarsById(int id);
	void deleteBook(int id);
	public void update(Car car);

	void deleteCar(Car car);
}
