package org.crazyit.Interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("����������");
		Map session = arg.getInvocationContext().getSession();
		String status = (String)session.get("status");
		if(status!=null&&!status.equals("")&&status.equals("islogin")){
			System.out.println("�ɹ���½");
			
			
			return arg.invoke();
		}else{
			System.out.println("��½ʧ��");
			session.put("errorMsg", "����û��¼�����¼��");
			return Action.INPUT;
		}
		
	}

}
