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
	

}
