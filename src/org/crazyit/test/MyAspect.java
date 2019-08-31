package org.crazyit.test;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
/*
 * 切面类，在此编写通知
 * 可以在xml配置文件确定通知类型
 */
public class MyAspect {
	// 前置通知
	public void myBefore(JoinPoint joinPoint) {
		System.out.print("前置通知 ，目标：");
		System.out.print(joinPoint.getTarget() + "方法名称");
		System.out.println(joinPoint.getSignature().getName());
	}
	// 后置通知
	public void myAfterReturning(JoinPoint joinPoint) {
		System.out.print("后置通知,方法名称" + joinPoint.getSignature().getName());
	}
	// 环绕通知
	// ProceedingJoinPoint 是JoinPoint子接口，表示可以执行目标方法
	// * 1 必须Object返回�?
	// * 2 必须接受�?��参数，类型为ProceedingJoinPoint
	// * 3 必须throws Throwable
	public Object myAround(ProceedingJoinPoint proceedingJoinPoint)
			throws Throwable {
		
		System.out.println("环绕");
		// 执行当前目标方法
		Object obj = proceedingJoinPoint.proceed();
		// 结束
		System.out.println("环绕结束");
		return obj;
	}
	// 异常通知
	public void myAfterThrowing(JoinPoint joinPoint, Throwable e) {
		System.out.println("异常通知" + "出错" + e.getMessage());
	}
	// 后置通知
	public void myAfter() {
		System.out.println("后置通知");
	}
}
