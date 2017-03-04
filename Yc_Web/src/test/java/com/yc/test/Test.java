package com.yc.test;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;

public class Test extends TestCase {

	public void testConnection() throws SQLException{
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		DataSource ds=(DataSource) ac.getBean("dataSource");
		Connection con =ds.getConnection();
		System.out.println( con ); 
	}
}
