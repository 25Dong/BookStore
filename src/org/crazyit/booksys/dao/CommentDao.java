package org.crazyit.booksys.dao;

import java.util.List;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Comment;
import org.crazyit.common.dao.BaseDao;

public interface CommentDao extends BaseDao<Comment>{
	public List<Comment> findByParam(String hql, Book book);

	public long findComCount(Book book);
	
	public List<Comment> findByPage(String hql2, Book book, int currPage,
			int pageSize);
	//查找用户评论的记录数
	
}
