package com.yc.web.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import com.taobao.api.ApiException;
import com.yc.bean.Students;
import com.yc.biz.StudentsBiz;
import com.yc.utils.JsonModel;
import com.yc.utils.MessageUtil;
import com.yc.utils.PageUtil;
import com.yc.utils.PropertiesUtil;

@Controller
public class StudentEnrollController {
	private static final Log logger=LogFactory.getLog(StudentEnrollController.class);
	private StudentsBiz stuBiz;
	@Resource(name="studentsBizImpl")
	public void setStuBiz(StudentsBiz stuBiz) {
		this.stuBiz = stuBiz;
	}
	//查询所有的学生报名信息
	@RequestMapping(value="/stu_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllStudent(@ModelAttribute Students stus,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows,HttpServletResponse resp){
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all students......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		stus.setStart(start);
		stus.setOffset(offset);
		stus.setS_status(0);
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
			HttpServletResponse resp,HttpServletRequest request) throws IOException{
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("根据条件查询学生报名信息");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		String direction=request.getParameter("direction");
		Students stus=new Students();
		stus.setStart(start);
		stus.setOffset(offset);
		if(direction!=null&&!"".equals(direction)&&!"查询所有".equals(direction)){
			stus.setS_direction(direction);
		}
		stus.setS_status(0);
		System.out.println(stus);
		List<Students> newsList=this.stuBiz.selectAllStudents(stus);
		int total =this.stuBiz.selectCountAll();
		JsonModel model=new JsonModel();
		model.setRows(newsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//发送开班短信
	@RequestMapping(value="/sendclsinfo",produces ="text/html;charset=UTF-8")
	public @ResponseBody void sendClsInfo(Students stus, @RequestParam(value="planIds[]") List<Integer> planIds,
			@RequestParam(value="tels[]") List<String> tels,
			@RequestParam(value="names[]") List<String> names,
			String oc_time,String address,String s_direction,
			HttpServletResponse response) throws IOException{
		logger.info("发送开班信息短信到报名学生手机");
		int total=planIds.size();
		try {
			for(int i=0;i<total;i++){
				String name=names.get(i);
				String tel=tels.get(i);
				MessageUtil.sendMessageforOpenCls(name, tel, oc_time, address, s_direction, "SMS_60020056");
			}
		} catch (ApiException e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//将学生录入源辰学员信息库
	@RequestMapping(value="/addStuIntoYc",produces ="text/html;charset=UTF-8")
	public @ResponseBody void updateStudent(@RequestParam(value="ids[]") List<Integer> planIds,HttpServletResponse response) throws IOException{
		logger.info("录入学生信息");
		int total=planIds.size();
		try {
			for(int i=0;i<total;i++){
				Students students=new Students();
				students.setS_id(planIds.get(i));
				students.setS_status(1);
				this.stuBiz.updateStudents(students);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//将学生移除学生报名信息
	@RequestMapping(value="/stu_delete",produces ="text/html;charset=UTF-8")
	public @ResponseBody void deleteStudent(@RequestParam(value="id") int s_id,HttpServletResponse response) throws IOException{
		logger.info("删除学生信息");
		try {
				this.stuBiz.deleteStudentsById(s_id);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//发送短信验证码
	@RequestMapping(value="/sendTelYZM")
	public @ResponseBody void sendTelYZM(Students stus, @RequestParam(value="s_name") String s_name,@RequestParam(value="s_tel") String s_tel,
			HttpServletResponse response) throws IOException{
		logger.info("发送短信验证码到报名学生手机");
		//SMS_60020056
//		Random r=new Random();
		String YZM="20170403";
		try {
				MessageUtil.sendMessageforCheckTel(s_name, s_tel,YZM, "SMS_60050569");
		} catch (ApiException e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(YZM);
	}
}
