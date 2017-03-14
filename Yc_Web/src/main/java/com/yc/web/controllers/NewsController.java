package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.News;
import com.yc.biz.NewsBiz;

@Controller
public class NewsController {
	private NewsBiz newsBiz;
	private static final Log logger=LogFactory.getLog(NewsController.class);
	@Resource(name="newsBizImpl")
 	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}
	//查询所有的新闻
//	@RequestMapping(value="/news_list")
//	public void selectAllNews(HttpServletResponse response) throws IOException{
//		logger.info("select all news......");
//		List<News> newList=this.newsBiz.selectAllNews();
//		Gson gson=new Gson();
//		response.getWriter().print(gson.toJson(newList));
//	}
	@RequestMapping(value="/news_list")
	public @ResponseBody List selectAllNews() {
		logger.info("select all news......");
		List<News> newList=this.newsBiz.selectAllNews();
		return newList;
	}
	//添加新闻
	@RequestMapping(value="/news_addNews.action")
	public @ResponseBody String addNews(){
		logger.info("add one new......");

		return "";
	}
	//修改新闻
	@RequestMapping(value="/news_updateNews.action")
	public @ResponseBody String updateNews(){
		logger.info("update one new......");

		return "";
	}
	//删除新闻
	@RequestMapping(value="/news_deleteNews.action")
	public @ResponseBody String deleteNews(){
		logger.info("delete one new......");

		return "";
	}
}
