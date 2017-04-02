package com.yc.web.controllers;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yc.bean.Activities;
import com.yc.bean.DataDictionary;
import com.yc.bean.News;
import com.yc.bean.OpenClass;
import com.yc.bean.Teachers;
import com.yc.biz.ActivitiesBiz;
import com.yc.biz.DataDictionaryBiz;
import com.yc.biz.NewsBiz;
import com.yc.biz.OpenClassBiz;
import com.yc.biz.TeachersBiz;


/**
 * 前端页面分发器
 * @author lee
 *
 */
@Controller
public class FrontController {
	
	private static final Logger log=Logger.getLogger(FrontController.class);
	
	private DataDictionaryBiz datadicBiz;
	private ActivitiesBiz activitiesBiz;
	private NewsBiz newBiz;
	
	
	@Resource(name="newsBizImpl")
	public void setNewBiz(NewsBiz newBiz) {
		this.newBiz = newBiz;
	}

	@Resource(name="dataDictionaryBizImpl")
	public void setDatadic(DataDictionaryBiz datadicBiz) {
		this.datadicBiz = datadicBiz;
	}

	private TeachersBiz teachersBiz;
	@Resource(name="teachersBizImpl")
	public void setTeachersBiz(TeachersBiz teachersBiz) {
		this.teachersBiz = teachersBiz;
	}
	private NewsBiz newsBiz;
	@Resource(name="newsBizImpl")
 	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}
	private OpenClassBiz openClsBiz;
	@Resource(name="openClassBizImpl")
	public void setOpenClsBiz(OpenClassBiz openClsBiz) {
		this.openClsBiz = openClsBiz;
	}

	
	@Resource(name="activitiesBizImpl")
	public void setActivitiesBiz(ActivitiesBiz activitiesBiz) {
		this.activitiesBiz = activitiesBiz;
	}

	@RequestMapping(value="/about.html")
	public String about(Model model){
		Map<String, Object> map=this.base();
		String [] company=(String[]) map.get("company");
		String content=(String) (company[0]+company[1]+company[2]);
		
		model.addAttribute("title", map.get("title"));
		model.addAttribute("content", content);
		model.addAttribute("footer", map.get("footer"));
		
		return "about";
	}
	
	@RequestMapping(value="/company.html")
	public String company(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "company";
	}
	
	@RequestMapping(value="/findWork.html")
	public String findWork(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "findWork";
	}
	
	@RequestMapping(value="/index.html",produces ="text/html;charset=UTF-8")
	public String index(Model model){
		
		Map<String, Object> map=this.base();
		
		List<Activities> list=this.activitiesBiz.findall(new Activities());
		
		String [] pic = null;
		for(Activities ac:list){	//拼接公司活动图片
			if(pic!=null){
				String [] temp=pic;
				String [] temp2=ac.getAc_pic().split(",");
				pic=new String[temp.length+temp2.length];
				System.arraycopy(temp, 0, pic, 0, temp.length);
				System.arraycopy(temp2, 0, pic, temp.length, temp2.length); 
			}else{
				pic=ac.getAc_pic().split(",");
			}
			 
		}
		
		model.addAttribute("activties", pic);
		model.addAttribute("title", map.get("title"));
		model.addAttribute("company", map.get("company"));
		model.addAttribute("footer", map.get("footer"));
		
		return "index";
	}
	
	@RequestMapping(value="/joinUs.html")
	public String joinUs(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "joinUs";
	}
	
	@RequestMapping(value="/studentProject.html")
	public String studentProject(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "studentProject";
	}
	
	@RequestMapping(value="/subject.html")
	public String subject(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "subject";
	}
	
	@RequestMapping(value="/success.html")
	public String success(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "success";
	}
	//师资介绍界面
	@RequestMapping(value="/teacher.html")
	public String teacher(Model model){
		Map<String, Object> map=this.base();
		Teachers teachers=new Teachers();
		List<Teachers> teachersList=this.teachersBiz.selectAllTeachers(teachers);
		List<News> newsList=findAllNews();
		List<OpenClass> openClsList=findAllOpenCls();
		for(int i=0;i<teachersList.size();i++){
			String pics []=teachersList.get(i).getT_pic().split(",");
			teachersList.get(i).setT_pic(pics[0]);
		}
		model.addAttribute("openClsinfo", openClsList);
		model.addAttribute("newsinfo", newsList);
		model.addAttribute("teacherinfo", teachersList);
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "teacher";
	}
	//公司新闻列表界面
	@RequestMapping(value="/companynews.html")
	public String companyNews(Model model){
		List<News> newsList=findAllNews();
		List<OpenClass> openClsList=findAllOpenCls();
		model.addAttribute("openClsinfo", openClsList);
		model.addAttribute("newsList", newsList);
		return "companynews";
	}
	//去某一新闻详情页面
	@RequestMapping(value="/news.html")
	public String news(Model model,@RequestParam(value="n_id") int nid){
		News news=new News();
		news.setN_id(nid);
		List<News> thenews=this.newsBiz.selectNewsById(news);
		List<News> newsList=findAllNews();
		news.setN_id(nid-1);
		List<News> thenextnews=this.newsBiz.selectNewsById(news);
		news.setN_id(nid+1);
		List<News> thebeforenews=this.newsBiz.selectNewsById(news);
		List<OpenClass> openClsList=findAllOpenCls();
		model.addAttribute("newsList", newsList);
		model.addAttribute("thenews", thenews);
		model.addAttribute("thenextnews", thenextnews);
		model.addAttribute("thebeforenews", thebeforenews);
		model.addAttribute("openClsinfo", openClsList);
		return "news";
	}
	//查询所有的新闻信息
	public List<News> findAllNews(){
		News news=new News();
		List<News> newsList=this.newsBiz.selectAllNews(news);
		return newsList;
	}
	//查询所有的开班信息
	public List<OpenClass> findAllOpenCls(){
		OpenClass openCls=new OpenClass();
		List<OpenClass> openClsList=this.openClsBiz.selectAllOpenClass(openCls);
		for(int i=0;i<openClsList.size();i++){
			String pics []=openClsList.get(i).getOc_pic().split(",");
			openClsList.get(i).setOc_pic(pics[0]);
			String times []=openClsList.get(i).getOc_time().split("-");
			openClsList.get(i).setOc_time(times[1]+"月"+times[2]+"日");
		}
		return openClsList;
	}
	public Map<String, Object> base(){
		Map<String, Object> map =new HashMap<String, Object>();
		
		List<String> title=new ArrayList<String>();
		String [] company=null;
		String [] footer=null;
		
		List<DataDictionary> list= this.datadicBiz.findDataDictionary(new DataDictionary());
		for(DataDictionary d:list){
			if(d.getType().equals("title")){	//存标题
				title.add(d.getDescription());
			}
			if(d.getType().equals("company")){	//存公司简介
				company=d.getDescription().split("/");
			}
			if(d.getType().equals("footer")){	//存页脚文字
				footer=d.getDescription().split("/");
			}
		}
		map.put("title", title);
		map.put("company", company);
		map.put("footer", footer);

		return map;
	}
}
