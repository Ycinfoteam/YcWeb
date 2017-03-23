package com.yc.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.Employ;
import com.yc.biz.EmployBiz;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;

@Controller
public class EmployController {
	
	private static final Logger log=Logger.getLogger(EmployController.class);
	
	private EmployBiz employBiz;
	
	@Resource(name="employBizImpl")
	public void setEmployBiz(EmployBiz employBiz) {
		this.employBiz = employBiz;
	}

	@RequestMapping(value="/findAllEmployInfo",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findAllEmployInfo(HttpServletResponse response,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows) {
		log.info("findAllEmployInfo called...");

		//处理分页
		int start=PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		
		Employ employ =new Employ();
		employ.setStart(start);
		employ.setOffset(offset);
		List<Employ> list=this.employBiz.findEmploy(employ);
		int total=this.employBiz.findCount(new Employ());

		JsonModel model =new JsonModel();
		model.setRows(list);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	
	@RequestMapping(value="addEmployInfo")
	public @ResponseBody int addEmployInfo(@ModelAttribute Employ employ){
		log.info("addEmployInfo called...");
		this.employBiz.addEmploy(employ);
		return 1;
	}

	@RequestMapping(value="/deleteEmployInfo")
	public @ResponseBody int deleteEmployInfo(@RequestParam int id){
		log.info("deleteEmployInfo called... ");
		Employ employ =new Employ();
		employ.setE_id(id);
		this.employBiz.deleteEmploy(employ);
		return 1;
	}
	
	@RequestMapping(value="updateEmployInfo")
	public @ResponseBody int updateEmployInfo(@ModelAttribute Employ employ){
		log.info("updateEmployInfo called...");
		this.employBiz.updateEmploy(employ);
		return 1;
	}
	
	
	
}




