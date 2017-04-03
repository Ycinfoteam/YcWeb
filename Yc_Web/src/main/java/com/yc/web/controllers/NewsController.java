package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.MDC;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.Admin;
import com.yc.bean.News;
import com.yc.biz.NewsBiz;
import com.yc.utils.GetIp;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;

@Controller
public class NewsController {
	private static final Log logger=LogFactory.getLog(NewsController.class);
	private NewsBiz newsBiz;
	@Resource(name="newsBizImpl")
 	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}

	//查询所有新闻
	@RequestMapping(value="/news_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllNews(@ModelAttribute News news,
			@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="rows",required=false) Integer rows,
			@RequestParam(value="sort",required=false) String sortcol,
			@RequestParam(value="order",required=false) String order,
			HttpServletResponse resp) throws IOException {
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all news......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		news.setStart(start);
		news.setOffset(offset);
		news.setN_order(order);
		news.setN_sortcol(sortcol);
		List<News> newsList=this.newsBiz.selectAllNews(news);
		int total =this.newsBiz.selectCountAll();
		JsonModel model=new JsonModel();
		model.setRows(newsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//添加新闻
	@RequestMapping(value="/news_addNews")
	public @ResponseBody void addNews(@ModelAttribute Admin admin,News news,HttpServletRequest request,HttpServletResponse  response) throws IOException{
		logger.info("add one new......");
		try {
			String type=request.getParameter("type");
//			News news=new News();
//			news.setN_click(0);
//			news.setN_content(request.getParameter("detail"));
//			//TODO:后期添加登录之后需要修改为获取当前登录的管理员ID
//			news.setN_reportor(request.getParameter("admin"));
//			news.setN_sort(1);
//			news.setN_title(request.getParameter("title"));
			String user=request.getSession().getAttribute("user").toString(); 
			System.out.println(user); 
			news.setN_reportor(user);
			news.setN_status(Integer.parseInt(type));
			this.newsBiz.addNews(news);
			MDC.put("explain" , "添加一条新闻");
			MDC.put("mchIp",new GetIp().getRemortIP(request));
			logger.info("add one new......");

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改新闻标题、排序、状态等
	@RequestMapping(value="/news_updateNews")
	public @ResponseBody void updateNews(HttpServletResponse response,HttpServletRequest request,News news) throws IOException{
		logger.info("修改一条新闻信息");
		try {
			this.newsBiz.updateNews(news);
			MDC.put("explain" , "修改新闻"+news.getN_id());
			MDC.put("mchIp",new GetIp().getRemortIP(request));
			logger.info("update one new......");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改新闻内容
	@RequestMapping(value="/news_updateNewsContent")
	public @ResponseBody void updateNewsContent(HttpServletResponse response,HttpServletRequest request) throws IOException{
		logger.info("修改一条新闻内容");
		try {
			int n_id=Integer.parseInt(request.getParameter("n_id"));
			String n_content=request.getParameter("n_content");
			News news=new News();
			news.setN_id(n_id);
			news.setN_content(n_content);
			this.newsBiz.updateNews(news);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	
	//删除新闻
	@RequestMapping(value="/news_deleteNews")
	public @ResponseBody void deleteNews(@RequestParam(value="id") int cs_id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		try {
			this.newsBiz.deleteNewsById(cs_id);
			MDC.put("explain" , "删除新闻"+cs_id);
			MDC.put("mchIp",new GetIp().getRemortIP(request));
			logger.info("delete one new......");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//去新闻详情的jsp页面
	@RequestMapping(value="/toshownewscontent")
	public @ResponseBody String showNewsContent(@RequestParam(value="n_id") int n_id,Model model){
		News news=new News();
		news.setN_id(n_id);
		List<News> newsList=this.newsBiz.selectAllNews(news);
		System.out.println(news+"==="+newsList);
		model.addAttribute("news", newsList);
		Gson gson =new Gson();
		return gson.toJson(newsList);
	}
}
