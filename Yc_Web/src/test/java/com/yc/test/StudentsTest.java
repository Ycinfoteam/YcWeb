package com.yc.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.Students;
import com.yc.biz.StudentsBiz;

public class StudentsTest {

	@Test
	public void testSelectAllStudents() {//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		StudentsBiz sb=(StudentsBiz) ac.getBean("studentsBizImpl");
		//List<Students> stuList=sb.selectAllStudents();
		//System.out.println(stuList);
	}

	@Test
	public void testSelectStudentsById() {//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		StudentsBiz sb=(StudentsBiz) ac.getBean("studentsBizImpl");
		List<Students> stuList=sb.selectStudentsById(2);
		System.out.println(stuList);
	}

	@Test
	public void testDeleteStudentsById() {//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		StudentsBiz sb=(StudentsBiz) ac.getBean("studentsBizImpl");	
		sb.deleteStudentsById(1);
	}

	@Test
	public void testAddStudents() {//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		StudentsBiz sb=(StudentsBiz) ac.getBean("studentsBizImpl");	
		Students students=new Students();
		students.setS_direction("b");
		students.setS_name("bb");
		//students.setS_tel(123456789);
		sb.addStudents(students);
	}

	@Test
	public void testUpdateStudents() {//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		StudentsBiz sb=(StudentsBiz) ac.getBean("studentsBizImpl");
		Students students=new Students();
		students.setS_id(2);
		students.setS_direction("bcsdf");
		students.setS_name("bb");
		//students.setS_tel(123456789);
		// TODO : 如果这里只设置了要改的字段，则其它字段会被修改成默认值，即string 会变成NULL
		sb.updateStudents(students);
	}

}
