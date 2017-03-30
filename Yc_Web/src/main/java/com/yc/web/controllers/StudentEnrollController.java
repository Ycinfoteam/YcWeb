package com.yc.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.News;
import com.yc.bean.Students;
import com.yc.biz.StudentsBiz;
import com.yc.util.JsonModel;
import com.yc.util.PageUtil;

@Controller
public class StudentEnrollController {
	private static final Log logger=LogFactory.getLog(StudentEnrollController.class);
	private StudentsBiz stuBiz;
	@Resource(name="studentsBizImpl")
	public void setStuBiz(StudentsBiz stuBiz) {
		this.stuBiz = stuBiz;
	}
	//去学生报名界面
	@RequestMapping(value="/toStudentEnroll")
	public String toStudentEnroll(Model model,@RequestParam(value="classType") String classType){
		model.addAttribute("classType", classType);
		return "studentEnroll";
	}
	//查询所有的学生报名信息
	@RequestMapping(value="/stu_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllStudent(@ModelAttribute Students stus,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows,HttpServletResponse resp){
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all news......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		stus.setStart(start);
		stus.setOffset(offset);
		List<Students> newsList=this.stuBiz.selectAllStudents(stus);
		int total =this.stuBiz.selectCountAll();
		JsonModel model=new JsonModel();
		model.setRows(newsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//根据条件查询学生报名信息
	@RequestMapping(value="/stu_selectByTag",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllStudent(@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="rows",required=false) Integer rows,
			HttpServletResponse resp,HttpServletRequest request){
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all news......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		String direction=request.getParameter("direction");
		String status=request.getParameter("status");
		Students stus=new Students();
		stus.setStart(start);
		stus.setOffset(offset);
		if(status.equals("1")||status.equals("0")){
			stus.setS_status(Integer.parseInt(status));
		}
		if(direction!=null&&!"".equals(direction)&&!"请选择".equals(direction)){
			stus.setS_direction(direction);
		}
		List<Students> newsList=this.stuBiz.selectAllStudents(stus);
		int total =this.stuBiz.selectCountAll();
		JsonModel model=new JsonModel();
		model.setRows(newsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
}
