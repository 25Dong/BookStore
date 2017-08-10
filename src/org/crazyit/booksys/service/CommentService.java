package org.crazyit.booksys.service;

import java.util.List;

import org.crazyit.booksys.domain.Book;
import org.crazyit.booksys.domain.Comment;
import org.crazyit.booksys.domain.PageBean;

public interface CommentService {
	int addComment(Comment comment);

	List<Comment> findByparam(String hql, Book book);
	//��ҳ��ѯ�û�����
	PageBean<Comment> findByparam(String hql2, Book book, int currPage);
	
}
