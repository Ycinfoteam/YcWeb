package com.yc.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;
import com.yc.utils.GetIp;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;

@Controller
public class AdminController {

	private static final Logger log=Logger.getLogger(AdminController.class);
	
	private AdminBiz adminBiz;
	
	@Resource(name="adminBizImpl")
	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	@RequestMapping(value="/findAdmin",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findAdmin(@ModelAttribute Admin admin,HttpServletRequest request,HttpServletResponse response,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows, HttpSession session){
		admin.setStart(PageUtil.judgeStart(page, rows));
		admin.setOffset(PageUtil.judgeOffset(rows));
		List<Admin> list=this.adminBiz.findAdmin(admin);
		MDC.put("explain" , "查看管理员");
		MDC.put("mchIp",new GetIp().getRemortIP(request) );
		MDC.put("mchName",session.getAttribute("user"));
		log.info("findAdmin called...");
		int total=this.adminBiz.findCount(admin);
		JsonModel model =new JsonModel();
		model.setRows(list);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	
	@RequestMapping(value="/addAdmin")
	public @ResponseBody int addAdmin(@ModelAttribute Admin admin){
		log.info("addAdmin called...");
		this.adminBiz.addAdmin(admin);
		return 1;
	}
	
	@RequestMapping(value="/deleteAdmin")
	public @ResponseBody int deleteAdmin(@ModelAttribute Admin admin){
		log.info("deleteAdmin called....");
		this.adminBiz.deleteAdmin(admin);
		return 1;
	}
	
	@RequestMapping(value="/updateAdmin")
	public @ResponseBody int updateAdmin(@ModelAttribute Admin admin){
		log.info("updateAdmin called...");
		this.adminBiz.updateAdmin(admin);
		return 1;
	}
	

	@RequestMapping(value="/login")
	public @ResponseBody int login(@RequestParam String validateCode,@ModelAttribute Admin admin,HttpSession session){
		log.info("login called...");
		
		//TODO:数据库加密
		
		String randCode = (String) session.getAttribute("rand");
		if (!validateCode.equals(randCode)) {
			return 2;
		}
		List<Admin> list=this.adminBiz.findAdmin(admin);
		if(list!=null && list.size()>0){
			if(list.get(0).getA_pwd().equals(admin.getA_pwd())){

				session.setAttribute("user", list.get(0).getA_name());
				return 1;
			}
		}
		return 0;
	}
}
