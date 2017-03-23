package com.yc.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;

import junit.framework.TestCase;

public class AdminTest extends TestCase {

	public void test1(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		AdminBiz adminBiz=ac.getBean("adminBizImpl",AdminBiz.class);
		Admin admin =new Admin();
		admin.setA_name("田七");
		admin.setA_pwd("666"); 
		adminBiz.addAdmin(admin);
	}
	
	public void test2(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		AdminBiz adminBiz =ac.getBean("adminBizImpl",AdminBiz.class);
		Admin admin =new Admin();
		admin.setA_pwd("6789");
		adminBiz.updateAdmin(admin);
	}
	
	public void test3(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		AdminBiz adminBiz =ac.getBean("adminBizImpl",AdminBiz.class);
		Admin admin =new Admin();
		admin.setA_id(1);
		adminBiz.deleteAdmin(admin);
	}
	
	public void test4(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		AdminBiz adminBiz =ac.getBean("adminBizImpl",AdminBiz.class);
		Admin admin =new Admin();
		System.out.println(adminBiz.findAdmin(admin));
	}
}
