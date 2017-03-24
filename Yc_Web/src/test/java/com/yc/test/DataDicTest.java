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
		List<DataDictionary> list=biz.findDataDictionary(new DataDictionary());
		System.out.println(list);
	}
	
	public void test2(){
		ApplicationContext ac= new ClassPathXmlApplicationContext("beans.xml");
		DataDictionaryBiz biz=(DataDictionaryBiz) ac.getBean("dataDictionaryBizImpl");
		DataDictionary dataDictionary =new DataDictionary();
		dataDictionary.setDescription("源辰信息科技是一家定位于大学生软件开发实战培训和企事业单位系统集成、项目研发于一体的综合性软件公司，以大学生高起点就业和为企事业单位"
+"提供信息化解决方案为目标。 公司是由多名资深项目经理共同组建而成，主要技术骨干在国内外从事多年软件项目研发工作，有在大型软件公司担任多"
+"年项目经理的经验；紧跟国内外先进的主流技术，具有较强的软件开发管理和技术指导能力。公司的发展目标是成为领先的软件开发服务商和IT软件工"
+"程师的供应商，我们致力于融合先进管理理念和信息技术，为企业和学员创造价值。 我们的宗旨是服务于学生，致力于企业。");
		biz.updateDescription(dataDictionary);
	}
}
