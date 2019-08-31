package org.crazyit.Interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {


	@Override
	public String intercept(ActionInvocation arg) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("进入拦截器");
		Map session = arg.getInvocationContext().getSession();
		String status = (String)session.get("status");
		if(status!=null&&!status.equals("")&&status.equals("islogin")){
			System.out.println("成功登陆");
			
			
			return arg.invoke();
		}else{
			System.out.println("登陆失败");
			session.put("errorMsg", "您还没登录，请登录！");
			return Action.INPUT;
		}
		
	}

}
