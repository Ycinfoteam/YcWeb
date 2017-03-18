package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.NestedCheckedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value="/news_selectAll")
	public @ResponseBody List selectAllNews() {
		logger.info("select all news......");
		List<News> newList=this.newsBiz.selectAllNews();
		return newList;
	}
	//添加新闻
	@RequestMapping(value="/news_addNews")
	public @ResponseBody void addNews(News news,HttpServletRequest request,HttpServletResponse  response) throws IOException{
		logger.info("add one new......");
		try {
			String type=request.getParameter("type");
			System.out.println(type);
//			News news=new News();
//			news.setN_click(0);
//			news.setN_content(request.getParameter("detail"));
//			//TODO:后期添加登录之后需要修改为获取当前登录的管理员ID
//			news.setN_reportor(request.getParameter("admin"));
//			news.setN_sort(1);
//			news.setN_title(request.getParameter("title"));
			if(type.equals("1")){
				news.setN_status(1);
			}else{
				news.setN_status(0);
			}
			this.newsBiz.addNews(news);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改新闻
	@RequestMapping(value="/news_updateNews")
	public @ResponseBody void updateNews(HttpServletResponse response,News news) throws IOException{
		logger.info("update one new......");
		try {
			this.newsBiz.updateNews(news);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//删除新闻
	@RequestMapping(value="/news_deleteNews")
	public @ResponseBody void deleteNews(@RequestParam(value="id") int cs_id,HttpServletResponse response) throws IOException{
		logger.info("delete one new......");
		try {
			this.newsBiz.deleteNewsById(cs_id);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
}
