package org.crazyit.booksys.service;

import java.util.List;

import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
/**
 * 
 * @author �׳ж�
 *
 */
public interface UserService {

	int register(User user);

	User loginCheck(User user);
	//�༭�Ǹ����û�id�����û�����Ϣ
	User find(int userId);
	//�������
	String encoderByMd5(String userPassword);
	//�û�ע��ʱ�����û������ֻ����Ƿ��Ѿ�����
	User registerCheck(User user);
	//�����û���Ϣ
	void uadateUser(User user);
	/*//��ҳ����y�û���Ϣ
	List<User> getALLUsersByPage(int currentpage, int i);*/
	//�����û�����
	long findCount();
	//��ҳ�����û���Ϣ
	PageBean<User> findBypage(int currPage);
	//ɾ���û�
	void deleteUser(int userId);
	//like�����û�
	PageBean<User> findLikeUser(String userName, int currPage);
	
}
