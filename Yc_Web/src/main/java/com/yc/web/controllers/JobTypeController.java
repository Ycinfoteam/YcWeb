package com.yc.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.JobType;
import com.yc.biz.JobTypeBiz;
import com.yc.utils.GetIp;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;

@Controller
public class JobTypeController {

	private static final Logger log = Logger.getLogger(JobTypeController.class);

	private JobTypeBiz jobTypeBiz;

	@Resource(name="jobTypeBizImpl")
	public void setJobTypeBiz(JobTypeBiz jobTypeBiz) {
		this.jobTypeBiz = jobTypeBiz;
	}
	
	@RequestMapping(value="/findAllJobType",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findAllJobType (HttpServletRequest request,HttpServletResponse response,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows){
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		JobType jobType =new JobType();
		jobType.setStart(start);
		jobType.setOffset(offset);
		List<JobType> list =this.jobTypeBiz.findJobType(jobType);
		int total =this.jobTypeBiz.findCount(jobType);
		MDC.put("explain" , "查询所有职位类型");
		MDC.put("mchIp",new GetIp().getRemortIP(request));
		log.info("findAllJobType called ...."); 
		JsonModel model=new JsonModel();
		model.setRows(list);
		model.setTotal(total);
		Gson gson =new Gson();
		
		return gson.toJson(model);
	} 
	
	@RequestMapping(value="addJobType")
	public @ResponseBody int addJobType(HttpServletRequest request,@ModelAttribute JobType jobType){
		this.jobTypeBiz.addJobType(jobType);
		MDC.put("explain" , "添加职位类型");
		MDC.put("mchIp",new GetIp().getRemortIP(request));
		log.info("addJobType called...");
		return 1;
	}
	
	@RequestMapping(value="deleteJobType")
	public @ResponseBody int deleteJobType(HttpServletRequest request,@RequestParam(value="j_id[]") List<Integer> j_id){
		for(int a :j_id){
			JobType jobType =new JobType();
			jobType.setJ_id(a);
			this.jobTypeBiz.deleteJobType(jobType);
			MDC.put("explain" , "删除职位类型");
			MDC.put("mchIp",new GetIp().getRemortIP(request));
			log.info("deleteJobType called...");
		}
		return 1;
	}
	
	@RequestMapping(value="showJobType",produces ="text/html;charset=UTF-8")
	public @ResponseBody String showJobType(@ModelAttribute JobType jobType){
		log.info("showJobType called...");
		List<JobType> list=this.jobTypeBiz.findJobType(jobType);
		Gson gson =new Gson();
		return gson.toJson(list);
	}

}
