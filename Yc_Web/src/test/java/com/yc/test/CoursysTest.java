package com.yc.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.Coursys;
import com.yc.biz.CoursysBiz;
import com.yc.biz.impl.CoursysBizImpl;

public class CoursysTest{

	@Test
	public void testSelectAllCoursys() {//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		CoursysBiz cb=(CoursysBiz) ac.getBean("coursysBizImpl");
		List<Coursys> csysList=cb.selectAllCoursys();
		System.out.println(csysList);
	}
	@Test
	public void testSelectCoursysById(){//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		CoursysBiz cb=(CoursysBiz) ac.getBean("coursysBizImpl");
		List<Coursys> csysList=cb.selectCoursysById(1);
		System.out.println(csysList);
	}
	@Test
	public void testDeleteCoursysById(){//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		CoursysBiz cb=(CoursysBiz) ac.getBean("coursysBizImpl");
		cb.deleteCoursysById(1);
	}
	@Test
	public void testAddCoursys(){//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		CoursysBiz cb=(CoursysBiz) ac.getBean("coursysBizImpl");
		Coursys csys=new Coursys();
		csys.setCs_name("J2EE");
		csys.setCs_pic("a");
		csys.setCs_text("a");
		csys.setCs_version("1.0");
		cb.addCoursys(csys);
	}
	@Test
	public void testUpdateCoursys(){//ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		CoursysBiz cb=(CoursysBiz) ac.getBean("coursysBizImpl");
		Coursys csys=new Coursys();
		// TODO : 如果这里只设置了要改的字段，则其它字段会被修改成默认值，即string 会变成NULL
		csys.setCs_id(1);
		csys.setCs_version("2.0");
		cb.updateCoursys(csys);
	}
}
