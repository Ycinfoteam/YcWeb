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

import com.yc.bean.Activities;
import com.yc.bean.DataDictionary;
import com.yc.biz.ActivitiesBiz;
import com.yc.biz.DataDictionaryBiz;
import com.yc.biz.NewsBiz;

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
	
	@RequestMapping(value="/teacher.html")
	public String teacher(Model model){
		Map<String, Object> map=this.base();
		model.addAttribute("title", map.get("title"));
		model.addAttribute("footer", map.get("footer"));
		return "teacher";
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
