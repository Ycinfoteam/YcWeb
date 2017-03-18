package com.yc.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.ApplyJob;
import com.yc.biz.ApplyJobBiz;

import junit.framework.TestCase;

public class ApplyTest extends TestCase {

	public void test1(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		ApplyJobBiz applyJobBiz=(ApplyJobBiz) ac.getBean("applyJobBizImpl");
		ApplyJob applyJob =new ApplyJob();
		List<ApplyJob> list=applyJobBiz.findApply(applyJob);
		System.out.println(list);
	}
	
	public void test2(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		ApplyJobBiz applyJobBiz=(ApplyJobBiz) ac.getBean("applyJobBizImpl");
		ApplyJob applyJob =new ApplyJob();
		applyJob.setA_name("haha");
		applyJob.setA_orientation("嵌入式工程师");
		applyJob.setA_tel("18541818348");
		applyJob.setA_email("gggg@163.com");
		applyJob.setA_detail("团队意识好");
		applyJob.setA_time("2017-6-6"); 
		applyJobBiz.addApply(applyJob);
	}
	
	public void test3(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		ApplyJobBiz applyJobBiz=(ApplyJobBiz) ac.getBean("applyJobBizImpl");
		ApplyJob applyJob =new ApplyJob();
		applyJob.setA_status(1);
		applyJobBiz.updateApply(applyJob);
	}
	
	public void test4(){
		ApplicationContext ac =new ClassPathXmlApplicationContext("beans.xml");
		ApplyJobBiz applyJobBiz=(ApplyJobBiz) ac.getBean("applyJobBizImpl");
		ApplyJob applyJob =new ApplyJob();
		int count=applyJobBiz.findCount(applyJob);
		System.out.println(count); 
	}
	
}
