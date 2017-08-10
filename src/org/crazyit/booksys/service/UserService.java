package org.crazyit.booksys.service;

import java.util.List;

import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
/**
 * 
 * @author 易承东
 *
 */
public interface UserService {

	int register(User user);

	User loginCheck(User user);
	//编辑是根据用户id查找用户的信息
	User find(int userId);
	//密码加密
	String encoderByMd5(String userPassword);
	//用户注册时检验用户名和手机号是否已经存在
	User registerCheck(User user);
	//更新用户信息
	void uadateUser(User user);
	/*//分页查找y用户信息
	List<User> getALLUsersByPage(int currentpage, int i);*/
	//查找用户总数
	long findCount();
	//分页查找用户信息
	PageBean<User> findBypage(int currPage);
	//删除用户
	void deleteUser(int userId);
	//like查找用户
	PageBean<User> findLikeUser(String userName, int currPage);
	
}
