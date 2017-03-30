package com.yc.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.News;
import com.yc.biz.NewsBiz;

public class NewsTest {
	/**
	 * 获取当前时间，形成时间戳
	 * @return
	 */
	private long getCurrentTime() {
		Date d=new Date();
		return d.getTime();
	}
	
	/*public void testAddNews() {//测试添加新闻方法ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		NewsBiz nb=(NewsBiz) ac.getBean("newsBizImpl");
		News news=new News();
		news.setN_click(0);
		news.setN_content("说两句好听的");
		news.setN_reportor("admin");
		news.setN_sort(1);

		news.setN_title("23333");
		nb.addNews(news);
	}*/
	@Test
	public void testSelectAllNews(){//测试查询所有新闻方法ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		NewsBiz nb=(NewsBiz) ac.getBean("newsBizImpl");
		//List<News> news=nb.selectAllNews();
		//System.out.println(news);
	}
	@Test
	public void testSelectNewsById(){//测试根据新闻编号查询新闻方法ok
		ApplicationContext ac=new ClassPathXmlApplicationContext("beans.xml");
		NewsBiz nb=(NewsBiz) ac.getBean("newsBizImpl");
		News news=new News();
		news.setN_id(2);
		List<News> newsList=nb.selectNewsById(news);
		System.out.println(newsList);
	}
}
