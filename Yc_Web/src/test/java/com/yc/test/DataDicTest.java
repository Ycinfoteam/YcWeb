package com.yc.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.DataDictionary;
import com.yc.biz.DataDictionaryBiz;

import junit.framework.TestCase;

public class DataDicTest extends TestCase {

	public void test1(){
		ApplicationContext ac= new ClassPathXmlApplicationContext("beans.xml");
		DataDictionaryBiz biz=(DataDictionaryBiz) ac.getBean("dataDictionaryBizImpl");
		DataDictionary dataDictionary =new DataDictionary();
		dataDictionary.setType("title");
		List<DataDictionary> list=biz.findDataDictionary(dataDictionary);
		for(DataDictionary a:list){
			System.out.println(a.getDescription());
		}
	}
	
	public void test2(){
		ApplicationContext ac= new ClassPathXmlApplicationContext("beans.xml");
		DataDictionaryBiz biz=(DataDictionaryBiz) ac.getBean("dataDictionaryBizImpl");
		DataDictionary dataDictionary =new DataDictionary();
		dataDictionary.setType("logo");
		dataDictionary.setDescription("22");
		biz.updateDataDictionary(dataDictionary);
		List<DataDictionary> list=biz.findDataDictionary(dataDictionary);
		for(DataDictionary a:list){
			System.out.println(a.getDescription());
		}
	}
}
