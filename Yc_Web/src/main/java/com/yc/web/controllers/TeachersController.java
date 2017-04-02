package com.yc.web.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Teachers;
import com.yc.biz.TeachersBiz;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;
import com.yc.utils.UploadFileUtil;
import com.yc.utils.UploadFileUtil.UploadFile;
@Controller
public class TeachersController {
	private static final Log logger=LogFactory.getLog(TeachersController.class);
	private String pdfRootName="uploadpic";
	private TeachersBiz teachersBiz;
	@Resource(name="teachersBizImpl")
	public void setTeachersBiz(TeachersBiz teachersBiz) {
		this.teachersBiz = teachersBiz;
	}
	//查询所有的教师信息用于数据表格分页显示
	@RequestMapping(value="/selectAllTeacher",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllTeachers(@ModelAttribute Teachers teachers,
			@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="rows",required=false) Integer rows,
			Model model,HttpServletResponse resp) throws IOException {
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all teacher......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		teachers.setStart(start);
		teachers.setOffset(offset);
		List<Teachers> teachersList=this.teachersBiz.selectAllTeachers(teachers);
		int total =this.teachersBiz.selectCountAll();//查询所有的记录总数，用于分页显示
		JsonModel jsonModel=new JsonModel();
		jsonModel.setRows(teachersList);
		jsonModel.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(jsonModel);
	}
	//查询所有的教师信息用于COMBOBOX动态数据添加
	@RequestMapping(value="/findTeachers",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findTeachers(@ModelAttribute Teachers teachers,Model model){
		logger.info("select all teacher for combobox......");
		List<Teachers> teachersList=this.teachersBiz.selectAllTeachers(teachers);
		model.addAttribute("teacherinfo", teachersList);
		Gson gson =new Gson();
		return gson.toJson(teachersList);
	}
	//根据教师姓名查找，用于检查教师重名等
	@RequestMapping(value="/findTeacherByName",produces ="text/html;charset=UTF-8")
	public void findTeacherByName(String t_name,HttpServletResponse response) throws IOException{
		logger.info("判断是否重名......");
		Teachers teachers=new Teachers();
		teachers.setT_name(t_name);
		boolean flag=this.teachersBiz.judge(teachers);
		System.out.println(flag);
		PrintWriter out = response.getWriter();
		if(flag){
			out.print("1");//存在该姓名的教师记录
		}else{
			out.print("0");
		}
	}
	//添加一条教师信息
	@RequestMapping(value="/teacher_add",produces={"text/html; charset=UTF-8"})
	public @ResponseBody void addTeachers(Teachers teachers,@RequestParam(value="picUrl") List<MultipartFile> picUrl,
			HttpServletRequest request,HttpServletResponse  response) throws IOException{
		logger.info("add one teacher......");
		String pics="";
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			pics+=uploadFile.getNewFileUrl()+",";
		}
//		Teachers teachers=new Teachers();
//		String t_job=request.getParameter("t_job");
//		teachers.setT_job(t_job);
//		teachers.setT_motto(request.getParameter("t_motto"));
//		teachers.setT_name(request.getParameter("t_name"));
		teachers.setT_pic(pics);
//		teachers.setT_skill(request.getParameter("t_skill"));
//		teachers.setT_title(request.getParameter("t_title"));
		teachers.setR_id(1);
		System.out.println(teachers);
		try {
			this.teachersBiz.addTeachers(teachers);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//删除一条教师信息
	@RequestMapping(value="/teacher_delete")
	public @ResponseBody void deleteOneCoursys(@RequestParam(value="id") int t_id,HttpServletResponse response) throws IOException{
		logger.info("delete one teachers......");
		try {
			this.teachersBiz.deleteTeachersById(t_id);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改教师信息
	@RequestMapping(value="/teacher_update")
	public void updateOneCoursys(@ModelAttribute Teachers teachers,HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("update one teacher......");
		try {
			this.teachersBiz.updateTeachers(teachers);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改教师图片
	@RequestMapping(value="/teacher_updatepic")
	public void updateOneTeachersPic(@RequestParam(value="update_picUrl") List<MultipartFile> picUrl,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("update one teacher......");
		String t_id=request.getParameter("t_id");
		String pics="";
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			pics+=uploadFile.getNewFileUrl()+",";
		}
		Teachers teachers=new Teachers();
		teachers.setT_id(Integer.parseInt(t_id));
		teachers.setT_pic(pics);
		try {
			this.teachersBiz.updateTeachers(teachers);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
}
