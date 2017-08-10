package org.crazyit.booksys.domain;
/**
 * 分页
 */
import java.util.List;

public class PageBean <T>{
	private int currPage;//当前页数
	private int pageSize;//每页显示的记录数
	private int totalCount;//总记录数
	private int totalPage;//总页数
	private List<T> list;//每页显示的数目
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	//封装当前页数，总页数，总记录的等数据
	public void setDate(int currPage,int pageSize,int totalCount ){
		setCurrPage(currPage);//当前页数
		setPageSize(pageSize);//页面大小
		setTotalCount(totalCount);//总的记录数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);
		setTotalPage(num.intValue());//总的页数
	}
}
