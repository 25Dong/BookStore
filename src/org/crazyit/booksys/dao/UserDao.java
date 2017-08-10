package org.crazyit.booksys.dao;

import java.util.List;

import org.crazyit.booksys.domain.User;
import org.crazyit.common.dao.BaseDao;

public interface UserDao extends BaseDao<User> {
	//Dao层实现用户登录验证
	User loginChenk(User user);

	User registerCheck(User user);
	//Like User 的总数
	long findLikeCount(String userName);
	//Like User
	List<User> findLikeUser(String userName, int currPage, int pageSize);
	

}
