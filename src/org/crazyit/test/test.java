package org.crazyit.test;

import org.crazyit.component.MytestImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class test {
	
	/**
	 * @param args
	 */
	@Test
	public void test1(){
		String xmlPath = "applicationContext.xml";
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext
				(xmlPath);
		MytestImpl impl = (MytestImpl)applicationContext.getBean("mytest");
//		MytestImpl impl = new MytestImpl();
//		impl.test();
	}

}
