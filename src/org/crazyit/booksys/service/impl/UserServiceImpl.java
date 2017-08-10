package org.crazyit.booksys.service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.crazyit.booksys.dao.UserDao;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
import org.crazyit.booksys.service.UserService;

/**
 * 
 * @author 易承东
 *
 */
public class UserServiceImpl implements UserService {
	//注入Dao层的类
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int register(User user) {
		return (Integer) userDao.save(user);	
	}

	//用户登录验证
	@Override
	public User loginCheck(User user) {
		User exitUser = userDao.loginChenk(user);
		return exitUser;
	}
	//编辑是根据用户id查找用户的信息
	@Override

	public User find(int userId) {
		User editUser = userDao.get(User.class, userId);
		return editUser;
	}

	//密码加密
	@Override
	public String encoderByMd5(String userPassword) {
		String resultString = null;
		resultString = new String(userPassword);
		MessageDigest md;// 信息摘要
		try
		{
			md = MessageDigest.getInstance("MD5");// 实例化
			md.update(userPassword.getBytes());
			byte[] digest = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < digest.length; i++)
			{
				sb.append(Integer.toHexString(((int) digest[i]) & 0xFF));
			}
			resultString = sb.toString();
		} catch (NoSuchAlgorithmException e)
		{
			e.printStackTrace();
		}
		return resultString;
	}

	//用户注册时检验用户名和手机号是否已经存在
	@Override
	public User registerCheck(User user) {
		User editUser = userDao.registerCheck(user);
		return editUser;
	}
	//更新用户信息
	@Override

	public void uadateUser(User user) {
		userDao.update(user);
	}

	//查找用户的总数
	@Override
	public long findCount() {
		return userDao.findCount(User.class);
	}
	
	//分页查找用户信息
	@Override
	public PageBean<User> findBypage(int currPage) {
		PageBean<User> pageBean = new PageBean<User>();
		//封装每页的显示的记录数
		int pageSize = 9;
		//封装总记录数
		int totalCount = (int) userDao.findCount(User.class);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<User> list = userDao.findByPage(User.class, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	//删除用户
	public void deleteUser(int userId) {
		userDao.delete(User.class, userId);

	}

	//分页like查找用户
	@Override
	public PageBean<User> findLikeUser(String userName,int currPage) {
		PageBean<User> pageBean = new PageBean<User>();
		//封装每页的显示的记录数
		int pageSize = 9;
		//封装总记录数
		int totalCount = (int) userDao.findLikeCount(userName);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<User> list = userDao.findLikeUser(userName, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

}
