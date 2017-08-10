package org.crazyit.booksys.service.impl;

import java.util.List;

import org.crazyit.booksys.dao.CommentDao;
import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Comment;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.service.CommentService;

public class CommentServiceImpl implements CommentService {
	private CommentDao commentDao;
	
	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		return (Integer) commentDao.save(comment);
	}

	@Override
	public List<Comment> findByparam(String hql, Book book) {
		// TODO Auto-generated method stub
		return commentDao.findByParam(hql, book);
	}

	@Override
	public PageBean<Comment> findByparam(String hql2, Book book, int currPage) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		int totalCount = (int) commentDao.findComCount(book);
		int pageSize = 7;
		pageBean.setDate(currPage, pageSize, totalCount);
		List<Comment> list =commentDao.findByPage(hql2,book,currPage,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

}
