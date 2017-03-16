package com.yc.web.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Projects;
import com.yc.biz.ProjectsBiz;
import com.yc.web.utils.UploadFileUtil;
import com.yc.web.utils.UploadFileUtil.UploadFile;

@Controller
public class ProjectsController {
	private ProjectsBiz projectsBiz;
	private static final Log logger=LogFactory.getLog(ProjectsController.class);
	@Resource(name="projectsBizImpl")
	public void SetBookBiz(ProjectsBiz projectsBiz){
		this.projectsBiz = projectsBiz;
	}
	//查看学员项目
	/*@RequestMapping(value="/projects")
	public String toprojects(){
		logger.info("查看学员项目");
		List<Projects>projects=this.projectsBiz.findall();
		Gson gson=new Gson();
		return gson.toJson(projects);
	}*/
	//分页

	// produces = {"application/json;charset=UTF-8"} 设置http协议响应头，解决编码问题
	@RequestMapping(value="/projects",produces = {"application/json;charset=UTF-8"})
	public void toprojects(HttpServletResponse response) throws IOException{
		logger.info("selectprojects called...");
		List<Projects>projects=this.projectsBiz.findall();
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(gson.toJson(projects));
	}
	private String picRootName="uploadpic";
	//添加学员项目
	@RequestMapping(value="/projects_add",method=RequestMethod.POST)
	public void projectsadd(@RequestParam(value="p_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		logger.info("addprojects called....");
		String p_pic="";
		Projects projects = new Projects();
		projects.setP_name(request.getParameter("p_name"));
		projects.setP_developer(request.getParameter("p_developer"));
		projects.setP_addr(request.getParameter("p_addr"));
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(request.getParameter("p_time"));
		*/
		projects.setP_time(request.getParameter("p_time"));
		projects.setP_picUrl(file);
		//上传
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request, projects.getP_picUrl(), picRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			p_pic+=uploadFile.getNewFileUrl()+",";
		}
		projects.setP_pic(p_pic);
		try {
			projectsBiz.add(projects);
		} catch (Exception e) {
			response.getWriter().print(0);		
		}
		response.getWriter().print(1);
	}
	

	//修改学员项目
	@RequestMapping(value="/projects_update")
	public String projectslist(Projects projects){
		logger.info("Updateprojects called.....");
		System.out.println(projects.getP_name()+projects.getP_time());
		this.projectsBiz.update(projects);
		return "redirect:/projects";
	}
	//删除学员项目
	@RequestMapping(value="/projects_delete")
	public String tobook(@RequestParam int id){
		logger.info("Deleteprojects called.....");
		Projects projects=new Projects();
		projects.setP_id(id);
		this.projectsBiz.delete(projects);
		return "redirect:/projects";
		}
}