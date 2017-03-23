package com.yc.web.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Projects;
import com.yc.biz.ProjectsBiz;
import com.yc.util.JsonModel;
import com.yc.util.PageUtil;
import com.yc.web.utils.UploadFileUtil;
import com.yc.web.utils.UploadFileUtil.UploadFile;

@Controller
public class ProjectsController {
	private ProjectsBiz projectsBiz;
	private static final Log logger=LogFactory.getLog(ProjectsController.class);
	@Resource(name="projectsBizImpl")
	public void SetProjectsBiz(ProjectsBiz projectsBiz){
		this.projectsBiz = projectsBiz;
	}
	//查看所有学员项目
	// produces = {"application/json;charset=UTF-8"} 设置http协议响应头，解决编码问题
	@RequestMapping(value="/projects",produces = {"application/json;charset=UTF-8"})
	public void toprojects(@ModelAttribute Projects projects,HttpServletResponse response,@RequestParam(value="page",required=false)Integer page,@RequestParam(value="rows",required=false)Integer rows) throws IOException{
		logger.info("selectprojects called...");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		projects.setStart(start);
		projects.setOffset(offset);
		List<Projects>project=this.projectsBiz.findall(projects);
		int total =this.projectsBiz.findCount(projects);
		JsonModel model=new JsonModel();
		model.setRows(project);
		model.setTotal(total);
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(gson.toJson(model));
	}
	
	//根据p_id 修改图片
	//修改学员项目
		@RequestMapping(value="/updatepropic",produces = {"application/json;charset=UTF-8"})
		public void editpic(@RequestParam(value="p_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException{
			logger.info("Updateprojectpic called.....");
			String p_pic="";
			Projects projects=new Projects();
			projects.setP_picUrl(file);
			String id=request.getParameter("p_id");
			projects.setP_id(Integer.parseInt(id));
			
			Map<String,UploadFile> map=UploadFileUtil.uploadFile(request, projects.getP_picUrl(), picRootName);
			for(Entry<String,UploadFile> entry:map.entrySet()){
				UploadFile uploadFile=entry.getValue();
				p_pic+=uploadFile.getNewFileUrl()+",";
			}
			projects.setP_pic(p_pic);
			try {
				this.projectsBiz.update(projects);
			} catch (Exception e) {
				response.getWriter().print(0);		

			}

			response.getWriter().print(1);		
			}
	private String picRootName="uploadpic";
	//添加学员项目
	@RequestMapping(value="/projects_add",method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	public @ResponseBody void projectsadd(@RequestParam(value="p_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
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
	public void projectslist(HttpServletRequest request,Projects projects,HttpServletResponse response) throws IOException{
		logger.info("Updateprojects called.....");
		try {
			this.projectsBiz.update(projects);
		} catch (Exception e) {
			response.getWriter().print(0);		
		}
		response.getWriter().print(1);
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
