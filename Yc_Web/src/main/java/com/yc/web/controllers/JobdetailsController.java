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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Jobdetails;
import com.yc.biz.JobdetailsBiz;
import com.yc.web.utils.UploadFileUtil;
import com.yc.web.utils.UploadFileUtil.UploadFile;

@Controller
public class JobdetailsController {
	private JobdetailsBiz jobdetailsBiz;
	private static final Log logger=LogFactory.getLog(JobdetailsController.class);
	@Resource(name="jobdetailsBizImpl")
	public void SetBookBiz(JobdetailsBiz jobdetailsBiz){
		this.jobdetailsBiz = jobdetailsBiz;
	}
	//查看所有学员就业
		// produces = {"application/json;charset=UTF-8"} 设置http协议响应头，解决编码问题
		@RequestMapping(value="/jobdetails",produces = {"application/json;charset=UTF-8"})
		public void toprojects(HttpServletResponse response) throws IOException{
			logger.info("selectjobdetails called...");
			List<Jobdetails>jobdetails=this.jobdetailsBiz.findall();
			Gson gson=new Gson();
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(gson.toJson(jobdetails));
		}
		//根据id 查看学员就业
		@RequestMapping(value="/findbypid",produces = {"application/json;charset=UTF-8"})
		public String tofindbyid(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException{
			logger.info("selectjobbyid called...");
			String id=request.getParameter("jd_id");
			Jobdetails jobdetails=new Jobdetails();
			jobdetails.setJd_id(Integer.parseInt(id));
			List<Jobdetails>jobdetail=this.jobdetailsBiz.findby(jobdetails);
			response.setContentType("text/html; charset=utf-8");
			model.addAttribute("projects",jobdetails);
			return "updatejobdetails";
		}
		//根据Jd_id 修改图片
		//修改学员项目
			@RequestMapping(value="/updatejdpic")
			public void editpic(@RequestParam(value="jd_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException{
				logger.info("Updatejobdetailspic called.....");
				String jd_pic="";
				Jobdetails jobdetails=new Jobdetails();
				jobdetails.setJd_picUrl(file);
				System.out.println(jobdetails.getJd_pic());
				String id=request.getParameter("jd_id");
				jobdetails.setJd_id(Integer.parseInt(id));
				if(file!=null){
				Map<String,UploadFile> map=UploadFileUtil.uploadFile(request, jobdetails.getJd_picUrl(), picRootName);
				for(Entry<String,UploadFile> entry:map.entrySet()){
					UploadFile uploadFile=entry.getValue();
					jd_pic+=uploadFile.getNewFileUrl()+",";
				}
				}
				jobdetails.setJd_pic(jd_pic);
				
				try {
					this.jobdetailsBiz.update(jobdetails);
				} catch (Exception e) {
					response.getWriter().print(0);		

				}

				response.getWriter().print(1);		
				}
		private String picRootName="uploadpic";
		//添加学员就业
		@RequestMapping(value="/jobdetails_add",method=RequestMethod.POST)
		public void projectsadd(@RequestParam(value="jd_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
			logger.info("addjobdetails called....");
			String jd_pic="";
			Jobdetails jobdetails=new Jobdetails();
			jobdetails.setJd_name(request.getParameter("jd_name"));
			jobdetails.setJd_profession(request.getParameter("jd_profession"));
			jobdetails.setJd_salary(request.getParameter("jd_salary"));
			jobdetails.setJd_school(request.getParameter("jd_school"));
			jobdetails.setJd_emptime(request.getParameter("jd_emptime"));
			jobdetails.setJd_company(request.getParameter("jd_company"));
			jobdetails.setJd_picUrl(file);
			System.out.println(jobdetails.getJd_name()+jobdetails.getJd_profession());
			//上传
			Map<String,UploadFile> map=UploadFileUtil.uploadFile(request, jobdetails.getJd_picUrl(), picRootName);
			for(Entry<String,UploadFile> entry:map.entrySet()){
				UploadFile uploadFile=entry.getValue();
				jd_pic+=uploadFile.getNewFileUrl()+",";
			}
			jobdetails.setJd_pic(jd_pic);
			try {
				jobdetailsBiz.add(jobdetails);
			} catch (Exception e) {
				response.getWriter().print(0);		
			}
			response.getWriter().print(1);
		}
		

		//修改学员就业
		@RequestMapping(value="/jobdetails_update")
		public void projectslist(HttpServletRequest request,Jobdetails jobdetails,HttpServletResponse response) throws IOException{
			logger.info("Updatejobdetails called.....");
			System.out.println(jobdetails.getJd_name()+jobdetails.getJd_pic());
			try {
				this.jobdetailsBiz.update(jobdetails);
			} catch (Exception e) {
				response.getWriter().print("error");		
			}
			response.getWriter().print("success");
			}
		//删除学员就业
		@RequestMapping(value="/jobdetails_delete")
		public String tobook(@RequestParam int id){
			logger.info("Deletejobdetails called.....");
			Jobdetails jobdetails=new Jobdetails();
			jobdetails.setJd_id(id);
			this.jobdetailsBiz.delete(jobdetails);
			return "redirect:/jobdetails";
			}
	}

	
	
	

