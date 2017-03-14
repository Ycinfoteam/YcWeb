package com.yc.web.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	//去后台主页
	@RequestMapping(value="/tobackmain")
	public String tobackmain(){
		return "backjsp/backmain";
		
	}
	//去前台主页
	@RequestMapping(value="/toindex")
	public String toindex(){
		return "jsp/about";
	}
	//去行业新闻
	@RequestMapping(value="/toinews")
	public String 	toinews(){
		return "backjsp/news/inews";
	}
	//去公司新闻
	@RequestMapping(value="/tocompanynews")
	public String tocompanynew(){
		return "backjsp/news/companynews";
	}
	//去管理员
	@RequestMapping(value="/toadmin")
	public String toadmin(){
		return "backjsp/sys/admins/admin";
	}
	//去招聘
	@RequestMapping(value="/tojob")
	public String tojob(){
		return "backjsp/applyseekjobs/job";
	}
	//去应聘
	@RequestMapping(value="/toapply")
	public String toapply(){
		return "backjsp/applyseekjobs/apply";
	}
	
	//去学员项目
	@RequestMapping(value="/toprojects")
	public String toprojects(){
		return "backjsp/projects/projects";
	}
	//去公司活动
	@RequestMapping(value="/toactivities")
	public String toactivities(){
		return "backjsp/activities/activities";
	}
}
