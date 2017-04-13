package com.yc.test;

import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.Employ;
import com.yc.biz.EmployBiz;

import junit.framework.TestCase;

public class EmployTest extends TestCase {

	public void testaddEmploy(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		EmployBiz e=(EmployBiz) ac.getBean("employBizImpl");
		Employ employ =new Employ();
		employ.setE_position("大数据工程师");
		Date date=new Date();
		//employ.setE_validtime(date);
		employ.setE_amount(20);
		employ.setE_salary("8000");
		employ.setE_addr("衡阳市珠晖区");
		e.addEmploy(employ);
	}
	
	public void testfindEmploy(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		EmployBiz e=(EmployBiz) ac.getBean("employBizImpl");
		Employ employ =new Employ();
		List<Employ> list=e.findEmploy(employ);
		for( Employ em:list){
			System.out.println( em );
		}
	}
	
	public void testfindEmploy2(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		EmployBiz e=(EmployBiz) ac.getBean("employBizImpl");
		Employ employ =new Employ();
		employ.setE_position("java工程师");
		employ.setE_salary("3000");
		List<Employ> list=e.findEmploy(employ);
		for( Employ em:list){
			System.out.println( em );
		}
	}
	
	public void testdeleteEmploy(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		EmployBiz e=(EmployBiz) ac.getBean("employBizImpl");
		Employ employ =new Employ();
		employ.setE_id(3);
		e.deleteEmploy(employ);
	}
	
	public void testupdateEmploy(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		EmployBiz e=(EmployBiz) ac.getBean("employBizImpl");
		Employ employ =new Employ();
		employ.setE_id(2);
		employ.setE_position("大数据工程师");
		Date date=new Date();
		//employ.setE_validtime(date);
		employ.setE_amount(20);
		employ.setE_salary("8000");
		employ.setE_addr("长沙市");
		employ.setE_detail("福利好"); 
		e.updateEmploy(employ);
	}
	
	public void testfindCount(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		EmployBiz e=(EmployBiz) ac.getBean("employBizImpl");
		Employ employ =new Employ();
		System.out.println(e.findCount(employ)); 
	}
	
}
