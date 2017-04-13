package com.yc.web.controllers;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yc.bean.Activities;
import com.yc.bean.Coursys;
import com.yc.bean.DataDictionary;
import com.yc.bean.Employ;
import com.yc.bean.News;
import com.yc.bean.OpenClass;
import com.yc.bean.Students;
import com.yc.bean.Teachers;
import com.yc.biz.ActivitiesBiz;
import com.yc.biz.CoursysBiz;
import com.yc.biz.DataDictionaryBiz;
import com.yc.biz.EmployBiz;
import com.yc.biz.NewsBiz;
import com.yc.biz.OpenClassBiz;
import com.yc.biz.StudentsBiz;
import com.yc.biz.TeachersBiz;
import com.yc.utils.DateFormatUtil;


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
	private CoursysBiz coursysBiz;
	private EmployBiz employBiz;
	private NewsBiz newsBiz;
	private StudentsBiz stuBiz;
	@Resource(name="studentsBizImpl")
	public void setStuBiz(StudentsBiz stuBiz) {
		this.stuBiz = stuBiz;
	}
	@Resource(name="employBizImpl")
	public void setEmployBiz(EmployBiz employBiz) {
		this.employBiz = employBiz;
	}

	@Resource(name="coursysBizImpl")
	public void setCoursysBiz(CoursysBiz coursysBiz) {
		this.coursysBiz = coursysBiz;
	}

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

	//去关于源辰前端界面
	@RequestMapping(value="/about.html")
	public String about(Model model){
		Map<String, Object> map=this.base();
		String [] company=(String[]) map.get("company");
		String content=(String) (company[0]+company[1]+company[2]);
		
		model.addAttribute("title", map.get("title"));
		model.addAttribute("content", content);
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		model.addAttribute("openClsinfo", this.findAllOpenCls());
		return "about";
	}
	
	//去公司历史前端界面
	@RequestMapping(value="/company.html")
	public String company(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "company";
	}
	
	//去就业详情前端界面
	@RequestMapping(value="/findWork.html")
	public String findWork(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "findWork";
	}
	
	//去招聘信息前端界面
	@RequestMapping(value="/job.html")
	public String job(Model model){
		Employ employ=new Employ();
		String date=DateFormatUtil.ycDateformat(new Date(), "yyyy-MM-dd");
		employ.setE_validtime(date);
		List<Employ> list=employBiz.findEmploy(employ);
		
		Map<String, Object> map=this.base();
		model.addAttribute("job", list);
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "job";
	}
	
	//去首页
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
		
		List<Coursys> courses=this.coursysBiz.selectAllCoursys(new Coursys());
		
		model.addAttribute("courses", courses);
		model.addAttribute("activties", pic);
		model.addAttribute("title", map.get("title"));
		model.addAttribute("company", map.get("company"));
		model.addAttribute("footer", map.get("footer"));
		
		return "index";
	}
	
	//去应聘信息前端界面
	@RequestMapping(value="/joinUs.html")
	public String joinUs(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "joinUs";
	}
	
	//去学员项目前端界面
	@RequestMapping(value="/studentProject.html")
	public String studentProject(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "studentProject";
	}
	
	//去课程体系前端页面
	@RequestMapping(value="/subject.html")
	public String subject(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "subject";
	}
	
	//去简历投递成功页面
	@RequestMapping(value="/success.html")
	public String success(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("newsinfo", this.findNews());
		return "success";
	}
	
	//师资介绍界面
	@RequestMapping(value="/teacher.html")
	public String teacher(Model model) throws IOException{
		Map<String, Object> map=this.base();
		
		Teachers teachers=new Teachers();
		List<Teachers> teachersList=this.teachersBiz.selectAllTeachers(teachers);
		List<OpenClass> openClsList=findAllOpenCls();
		for(int i=0;i<teachersList.size();i++){
			String pics []=teachersList.get(i).getT_pic().split(",");
			teachersList.get(i).setT_pic(pics[0]);
		}
		model.addAttribute("openClsinfo", openClsList);
		model.addAttribute("newsinfo", this.findNews());
		model.addAttribute("teacherinfo", teachersList);
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "teacher";
	}
	
	//公司新闻列表界面
	@RequestMapping(value="/companynews.html/{temp}")
	public String companyNews(HttpSession session,Model model,@PathVariable String temp){
		Map<String, Object> map=this.base();
		
		int total=this.newBiz.selectCountAll();
		if(session.getAttribute("page")==null){
			session.setAttribute("page", 1);
		}else{
			if(temp.equals("1")){	//上一页
				int t=(int) session.getAttribute("page")-1;
				if(t<=0){
					t=1;
				}
				session.setAttribute("page", t); 
			}else if(temp.equals("2")){	//下一页
				int t=(int) session.getAttribute("page")+1;
				if(t>=(total/10+1)){
					t=total/10+1;
				}
				session.setAttribute("page", t); 
			}
		}
		System.out.println(session.getAttribute("page"));
		News news=new News();
		news.setStart(((int)session.getAttribute("page")-1)*10);	//每页10条数据
		news.setOffset(10);
		List<News> newsList=this.newsBiz.selectAllNews(news);
		List<OpenClass> openClsList=findAllOpenCls();
		
		
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		model.addAttribute("openClsinfo", openClsList);
		model.addAttribute("newsList", newsList);
		model.addAttribute("newsinfo", this.findNews());
		return "companynews";
	}
	
	//去某一新闻详情页面
	@RequestMapping(value="/news.html")
	public String news(Model model,@RequestParam(value="n_id") int nid){
		News news=new News();
		news.setN_id(nid);
		List<News> thenews=this.newsBiz.selectNewsById(news);
		int click=thenews.get(0).getN_click()+1;//设置新闻点击量
		news.setN_click(click);
		this.newsBiz.updateNews(news);
		List<News> newsList=findAllNews();
		news.setN_id(nid-1);
		List<News> thenextnews=this.newsBiz.selectNewsById(news);
		news.setN_id(nid+1);
		List<News> thebeforenews=this.newsBiz.selectNewsById(news);
		List<OpenClass> openClsList=findAllOpenCls();
		model.addAttribute("newsList", newsList);
		model.addAttribute("newsinfo", this.findNews());
		model.addAttribute("thenews", thenews);
		model.addAttribute("thenextnews", thenextnews);
		model.addAttribute("thebeforenews", thebeforenews);
		model.addAttribute("openClsinfo", openClsList);
		return "news";
	}
	
	//去我要报名界面
	@RequestMapping(value="/studentEnroll.html")
	public String studentEnroll(Model model,@RequestParam(value="oc_name") String oc_name){
		List<OpenClass> openClsList=findAllOpenCls();
		model.addAttribute("openClsinfo", openClsList);
		model.addAttribute("oc_name", oc_name);
		return "studentEnroll";
	}
	//去报名完成界面
	@RequestMapping(value="/stu_add.html")
	public String student(Model model, Students students){
		try {
			List<Students> stuList=this.stuBiz.selectAllStudents(students);
			if(stuList!=null&&stuList.size()>0){
				students.setS_status(0);
				this.stuBiz.addStudents(students);
			}else{
				return "enrollfailure";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "studentEnroll";
		}
		return "enrollok";
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
	
	//查询所有的新闻信息
	public List<News> findAllNews(){
		News news=new News();
		news.setN_status(1);
		List<News> newsList=this.newsBiz.selectAllNews(news);
		return newsList;
	}
	
	//前端界面右下角新闻模块
	public List<News> findNews(){	
		List<News> newsList=findAllNews();
		for(News news:newsList){
			if(news.getN_title().length()>10){
				String temp=news.getN_title().substring(0,8);
				String title=temp+"...";
				news.setN_title(title);
			}
		}
		List<News> list=new ArrayList<News>();
		for(int i=0;i<8;i++){		//只显示最新的八条新闻
			list.add(newsList.get(i));
		}
		return list;
	}
	
	//标题、公司简介、页脚文字
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
