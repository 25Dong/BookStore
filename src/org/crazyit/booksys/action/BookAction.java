package org.crazyit.booksys.action;

import java.io.FileNotFoundException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Car;
import org.crazyit.booksys.domain.Comment;
import org.crazyit.booksys.domain.Order;
import org.crazyit.booksys.domain.OrderDetail;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.service.BookService;
import org.crazyit.booksys.service.CarService;
import org.crazyit.booksys.service.CommentService;
import org.crazyit.booksys.service.OrderService;
import org.crazyit.booksys.service.OrderdetailService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author ���ν�
 *
 */
public class BookAction extends ActionSupport
{
	private CarService carService;
	private BookService bookService;
	private OrderdetailService orderdetailService;
	private OrderService orderService;
	private CommentService commentService;
	private Book book = new Book();
	private List<Book> books;
	private int id;
	private String uploadFileName;
	private List<Car> cars;
	private String category;
	private List<Comment> comments;
	private Comment comment;
	private int orderid;
	private int bookFlag;//��־���ز�ͬ���ҽ����ͼ��

	//ע��Service��
	public void setOrderdetailService(OrderdetailService orderdetailService) {
		this.orderdetailService = orderdetailService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	//********************************************�û�����*******************************
	//�鱾��������
	public long getCount() {
		return bookService.findCount();
	}
	
	//��ҳ��ʾ����ͼ��
	private int currPage =1;
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public String list(){
		System.out.println("================================find the books=========================================");
		PageBean<Book> pageBean = bookService.findBypage(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "listsuccess";
	}
	
	//�鿴ͼ����ϸ��Ϣ
	public String listbyid(){
		System.out.println("================================�鿴ͼ����ϸ��Ϣ=========================================");
		String hql = "from Book as b where b.category=:category";
		String hql2 = "from Comment as c where c.book=:book";
		book = bookService.findbyid(this.getId());
		setBook(book);
		PageBean<Comment> pageBean = commentService.findByparam(hql2,book,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		books = bookService.findByparame(hql, book.getCategory());
		setBooks(books);
		return "listbyidsuccess";
	}
	
	//�û�����鿴ͼ�鷽��
	public String showCategory(){
		System.out.println("================================�鿴"+book.getCategory()+"��ͼ��=========================================");
		setBookFlag(2);
		PageBean<Book> pageBean = bookService.categorylist(book.getCategory(),currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "showCategory";
	}
	
	//�û�Like����ͼ��
	public String FindLikeBK(){
		System.out.println("================================�鿴����Ϊ%"+book.getName()+"%ͼ��=========================================");
		setBookFlag(3);
		ActionContext.getContext().getSession().put("likeBookName", book.getName());
		PageBean<Book> pageBean = bookService.findLikeBook(book.getName(),currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "userFindBSu";
	}
	
	//�û��鿴ͼ�����������
	public String bookSales(){
		System.out.println("================================�鿴ͼ�����������=========================================");
		setBookFlag(4);
		String hql = "from Book b order by b.bookSales desc ";
		PageBean<Book> pageBean = bookService.findByParam(hql,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "bookSalesSu";
	}
	
	//�û�����ͼ��۸�����鿴ͼ��
	public String PriceIncrease(){
		System.out.println("================================����ͼ��۸�����鿴ͼ��=========================================");
		setBookFlag(5);
		String hql = "from Book b order by b.price desc ";
		PageBean<Book> pageBean = bookService.findByParam(hql,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "PriceIncreaseSu";
	}
	
	//�û�����ͼ��۸����鿴ͼ��
	public String PriceDecrease(){
		System.out.println("================================����ͼ��۸����鿴ͼ��=========================================");
		setBookFlag(6);
		String hql = "from Book b order by b.price asc";
		PageBean<Book> pageBean = bookService.findByParam(hql,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "PriceDecreaseSu";
	}
	
	//�û����۷���
	public String comment(){
		System.out.println("================================����=========================================");
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time=format.format(date); 
		Book book = bookService.findbyid(this.getId());
		Order order = orderService.getOrder(this.getOrderid());
		OrderDetail orderDetail = orderService.getorderdetail(book, order);
		orderDetail.setIfcomment(1);
		orderdetailService.update(orderDetail);
		System.out.println(time);
		comment.setDate(time);
		comment.setUserid(userid());
		comment.setUserName(userName());
		comment.setBook(book);
		commentService.addComment(comment);
		
		List<OrderDetail> ods=orderService.getorderdetail(order);
		for(OrderDetail od:ods){
			if(od.getIfcomment()==0)
				return "commentpart";
		}
		
		return "commentsuccess";
	}

	//***************************����Ա����*******************************//
	//�����ϼ�
	public String add() throws FileNotFoundException
	{
		this.book.setBookShelvetDate(new Date());//�����ϼ�ʱ������
		int result = bookService.addBook(book);
		if(result > 0)
		{
			addActionMessage("");
			return "addsuccess";
		}
		addActionError("");
		return ERROR;
	}

	//��̨�༭ͼ��ʱ �ȸ���id���ҳ���ͼ��
	public String findbook(){
		book = bookService.findbyid(id);
		return "findbooksuccess";
	}
	
	//���±༭ͼ������Ϣ
	public String edit(){
		bookService.update(book);
		return "editsuccess";
	}

	//��̨�༭ͼ�����ʱ �ȸ���id���ҳ���ͼ��
	public String findbookPhotoEdit(){
		book = bookService.findbyid(id);
		return "findbookPhotosuc";
	}
	public String editPhoto(){
		bookService.update(book);
		return "editPhotoSuc";
	}

	//����Ա����鿴ͼ�鷽��
	public String categorylist(){
		System.out.println("**********************BookAction:categorylist()����Ա����鿴ͼ��,������"+book.getCategory()+"*****************");
		setBookFlag(1);
		PageBean<Book> pageBean = bookService.categorylist(book.getCategory(),currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "categorylist";
	}
	//����Ա��ҳ�������Ʋ���ͼ��
	public String findLikeBook(){
		System.out.println("**********************BookAction:categorylist()����ԱLIke�鿴ͼ��,������%"+book.getName()+"%*****************");
		setBookFlag(2);
		ActionContext.getContext().getSession().put("likeBookName", book.getName());
		PageBean<Book> pageBean = bookService.findLikeBook(book.getName(),currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findLikeBoSu";
	}
	//ɾ��ͼ��
	public String delete()
	{
		bookService.deleteBook(id);
		return "deleteBooksuccess";
	}	
	
	//********************************************set and get*******************************
	public String getCategory() {
		return category;
	}
	public void setBookService(BookService bookService)
	{
		this.bookService = bookService;
	}
	public void setCategory(String category) {
		this.category = category;
		System.out.println("���뵽setcategory����"+category);
	}
	public List<Car> getCars() {
		return cars;
	}

	public void setCars(List<Car> cars) {
		this.cars = cars;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
		book.setPhotoname(uploadFileName);
	}
	public Book getBook()
	{
		return book;
	}
	public void setBook(Book book)
	{
		this.book = book;
	}

	public List<Book> getBooks()
	{
		return books;
	}

	public void setBooks(List<Book> books)
	{
		this.books = books;
	}

	
	public int getTotalpage() {
		return (int)(this.getCount()-1)/3+1;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public int getBookFlag() {
		return bookFlag;
	}
	public void setBookFlag(int bookFlag) {
		this.bookFlag = bookFlag;
	}

	public int userid(){
		ActionContext context = ActionContext.getContext();
		int userid = (Integer)context.getSession().get("userid");
		return userid;

	}
	public String userName(){
		ActionContext context = ActionContext.getContext();
		String userName = (String) context.getSession().get("username");
		return userName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		ActionContext.getContext().getSession().put("detailBookid", id);
		this.id = id;
	}
}

