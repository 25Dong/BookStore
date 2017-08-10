package org.crazyit.booksys.dao;

import java.util.List;

import org.crazyit.booksys.domain.User;
import org.crazyit.common.dao.BaseDao;

public interface UserDao extends BaseDao<User> {
	//Dao��ʵ���û���¼��֤
	User loginChenk(User user);

	User registerCheck(User user);
	//Like User ������
	long findLikeCount(String userName);
	//Like User
	List<User> findLikeUser(String userName, int currPage, int pageSize);
	

}
