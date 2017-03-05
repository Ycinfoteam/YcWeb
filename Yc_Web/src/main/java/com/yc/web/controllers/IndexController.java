package com.yc.web.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	//去主页
	@RequestMapping(value="/tobackmain")
	public String tobackmain(){
		System.out.println( "进来了" );
		return "backjsp/backmain";
		
	}
	
	@RequestMapping(value="/toindex")
	public String toindex(){
		return "jsp/about";
	}
	@RequestMapping(value="/toinews")
	public String 	toinews(){
		return "backjsp/news/inews";
	}
	@RequestMapping(value="/tocompanynews")
	public String tocompanynew(){
		return "backjsp/news/companynews";
	}
	
	@RequestMapping(value="/toadmin")
	public String toadmin(){
		return "backjsp/sys/admins/admin";
	}
	
	@RequestMapping(value="/tojob")
	public String tojob(){
		return "backjsp/applyseekjobs/job";
	}
	
	@RequestMapping(value="/toapply")
	public String toapply(){
		return "backjsp/applyseekjobs/apply";
	}
}
