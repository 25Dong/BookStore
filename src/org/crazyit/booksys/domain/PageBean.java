package org.crazyit.booksys.domain;
/**
 * ��ҳ
 */
import java.util.List;

public class PageBean <T>{
	private int currPage;//��ǰҳ��
	private int pageSize;//ÿҳ��ʾ�ļ�¼��
	private int totalCount;//�ܼ�¼��
	private int totalPage;//��ҳ��
	private List<T> list;//ÿҳ��ʾ����Ŀ
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
	//��װ��ǰҳ������ҳ�����ܼ�¼�ĵ�����
	public void setDate(int currPage,int pageSize,int totalCount ){
		setCurrPage(currPage);//��ǰҳ��
		setPageSize(pageSize);//ҳ���С
		setTotalCount(totalCount);//�ܵļ�¼��
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);
		setTotalPage(num.intValue());//�ܵ�ҳ��
	}
}
