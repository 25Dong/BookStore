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
 * @author �׳ж�
 *
 */
public class UserServiceImpl implements UserService {
	//ע��Dao�����
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int register(User user) {
		return (Integer) userDao.save(user);	
	}

	//�û���¼��֤
	@Override
	public User loginCheck(User user) {
		User exitUser = userDao.loginChenk(user);
		return exitUser;
	}
	//�༭�Ǹ����û�id�����û�����Ϣ
	@Override

	public User find(int userId) {
		User editUser = userDao.get(User.class, userId);
		return editUser;
	}

	//�������
	@Override
	public String encoderByMd5(String userPassword) {
		String resultString = null;
		resultString = new String(userPassword);
		MessageDigest md;// ��ϢժҪ
		try
		{
			md = MessageDigest.getInstance("MD5");// ʵ����
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

	//�û�ע��ʱ�����û������ֻ����Ƿ��Ѿ�����
	@Override
	public User registerCheck(User user) {
		User editUser = userDao.registerCheck(user);
		return editUser;
	}
	//�����û���Ϣ
	@Override

	public void uadateUser(User user) {
		userDao.update(user);
	}

	//�����û�������
	@Override
	public long findCount() {
		return userDao.findCount(User.class);
	}
	
	//��ҳ�����û���Ϣ
	@Override
	public PageBean<User> findBypage(int currPage) {
		PageBean<User> pageBean = new PageBean<User>();
		//��װÿҳ����ʾ�ļ�¼��
		int pageSize = 9;
		//��װ�ܼ�¼��
		int totalCount = (int) userDao.findCount(User.class);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<User> list = userDao.findByPage(User.class, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	//ɾ���û�
	public void deleteUser(int userId) {
		userDao.delete(User.class, userId);

	}

	//��ҳlike�����û�
	@Override
	public PageBean<User> findLikeUser(String userName,int currPage) {
		PageBean<User> pageBean = new PageBean<User>();
		//��װÿҳ����ʾ�ļ�¼��
		int pageSize = 9;
		//��װ�ܼ�¼��
		int totalCount = (int) userDao.findLikeCount(userName);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<User> list = userDao.findLikeUser(userName, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

}
