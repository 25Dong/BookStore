package org.crazyit.booksys.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.booksys.service.BookService;
import org.crazyit.booksys.service.CarService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author 梁家健
 *
 */
public class AddToCarAction extends ActionSupport {
	private int bookid;
	private CarService carService;
	private BookService bookService;
	private Book book;
	private List<Car> cars;
	private int userid;
	private Integer[] carsid;
	private List<Integer> bookIds;
	private Integer[] ids;
	//修改购物车状态
	public String changestate(){
		for(int i = 0;i<bookIds.size();i++){
			Integer s=bookIds.get(i);
			System.out.println("书本id为"+s);
			String hql = "from Car as s where s.bookid=:bookid";
				
				Car car = carService.findByparame(hql, s).get(0);
				carService.deleteCar(car);
			
		}
		return "changesuccess";
		
	}
	public Integer[] getCarsid() {
		return carsid;
	}
	public void setCarsid(Integer[] carsid) {
		this.carsid = carsid;
	}
	public int getUserid() {
		return userid;
	}
	public int userid(){
		this.addUserid();
		return userid;
	}
	public void addUserid(){
		ActionContext context = ActionContext.getContext();
		this.userid = (Integer)context.getSession().get("userid");
	}

	public List<Car> getCars() {
		return cars;
	}
	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public void setCarService(CarService carService) {
		System.out.println("已经把carservice传进来了");
		this.carService = carService;
	}
	public String add(){
		System.out.println("已经把carservice传进来了gggggggggggggggggggggg");
		Car car = new Car();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time=format.format(date); 
		book = bookService.findbyid(getBookid());
		System.out.println(book.getName());
		String hql = "from Car as s where s.bookid=:bookid and s.userid=:userid";
		List<Car> cars = new ArrayList<Car>();
		
		cars = carService.findByparame(hql,this.getBookid(),this.userid() );
		if(!(cars == null || cars.size() ==0)){
			System.out.println("notnull");
			if(cars.get(0) != null){
				System.out.println("进入if");
				car = cars.get(0);
				car.setCount(car.getCount()+1);
				
				carService.update(car);
			}
			
			
		}else{
			System.out.println("进入else");
			System.out.println("null");
			car.setCount(1);
			car.setName(book.getName());
			car.setPrice(book.getPrice());
			car.setTime(time);
			car.setBookid(getBookid());
			car.setPhotoname(book.getPhotoname());
			car.setStatus("未提交");
			System.out.println("用户id为"+userid);
			car.setUserid(userid);
			carService.addCar(car);
		}
		return "addsuccess";
	}
	//根据用户ID查找用户的购车信息
	public String list()
	{
		setCars(carService.getAllCarsById(this.userid()));
		return "listsuccess";
	}
	public String delete(){
		carService.deleteCar(this.getBookid());
		return "deletesuccess";
	}
	public List<Integer> getBookIds() {
		return bookIds;
	}
	public void setBookIds(List<Integer> bookIds) {
		this.bookIds = bookIds;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
}
