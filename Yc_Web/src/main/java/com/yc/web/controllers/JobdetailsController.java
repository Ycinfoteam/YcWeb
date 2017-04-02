package com.yc.web.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.MDC;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Jobdetails;
import com.yc.bean.Projects;
import com.yc.biz.JobdetailsBiz;
import com.yc.utils.GetIp;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;
import com.yc.utils.PropertiesUtil;
import com.yc.web.utils.UploadFileUtil;
import com.yc.web.utils.UploadFileUtil.UploadFile;

@Controller
public class JobdetailsController {
	private JobdetailsBiz jobdetailsBiz;
	private static final Log logger = LogFactory.getLog(JobdetailsController.class);

	@Resource(name = "jobdetailsBizImpl")
	public void SetBookBiz(JobdetailsBiz jobdetailsBiz) {
		this.jobdetailsBiz = jobdetailsBiz;
	}

	// 查看所有学员就业
	// produces = {"application/json;charset=UTF-8"} 设置http协议响应头，解决编码问题
	@RequestMapping(value = "/jobdetails", produces = { "application/json;charset=UTF-8" })
	public void tojobdetails(HttpServletRequest request,@ModelAttribute Jobdetails jobdetails,HttpServletResponse response,@RequestParam(value="page",required=false)Integer page,@RequestParam(value="rows",required=false)Integer rows) throws IOException {
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		jobdetails.setStart(start);
		jobdetails.setOffset(offset);
		List<Jobdetails> jobdetail = this.jobdetailsBiz.findall(jobdetails);
		MDC.put("explain" , "查询了学员就业");
		MDC.put("mchIp",new GetIp().getRemortIP(request) );
		logger.info("selectjobdetails called...");
		int total =this.jobdetailsBiz.findCount(jobdetails);
		JsonModel model=new JsonModel();
		model.setRows(jobdetail);
		model.setTotal(total);
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(gson.toJson(model));
	}


	// 根据Jd_id 修改图片
	// 修改学员项目
	@RequestMapping(value = "/updatejdpic",produces = {"application/json;charset=UTF-8"})
	public void editpic(@RequestParam(value = "jd_pic") List<MultipartFile> file, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("Updatejobdetailspic called.....");
		Properties p=PropertiesUtil.readProperties("file.properties");
		String picRootName=p.getProperty("picRootName");
		String jd_pic = "";
		Jobdetails jobdetails = new Jobdetails();
		jobdetails.setJd_picUrl(file);
		System.out.println(jobdetails.getJd_pic());
		String id = request.getParameter("jd_id");
		jobdetails.setJd_id(Integer.parseInt(id));
		if (file != null) {
			Map<String, UploadFile> map = UploadFileUtil.uploadFile(request, jobdetails.getJd_picUrl(), picRootName);
			for (Entry<String, UploadFile> entry : map.entrySet()) {
				UploadFile uploadFile = entry.getValue();
				jd_pic += uploadFile.getNewFileUrl() + ",";
			}
		}
		jobdetails.setJd_pic(jd_pic);

		try {
			this.jobdetailsBiz.update(jobdetails);
			MDC.put("explain" , "修改学员就业"+jobdetails.getJd_id());
			MDC.put("mchIp",new GetIp().getRemortIP(request) );
			logger.info("selectjobdetails called...");
		} catch (Exception e) {
			response.getWriter().print(0);

		}

		response.getWriter().print(1);
	}


	// 添加学员就业
	@RequestMapping(value = "/jobdetails_add", method = RequestMethod.POST)
	public void projectsadd(@RequestParam(value = "jd_pic") List<MultipartFile> file, HttpServletRequest request,
		HttpServletResponse response) throws IOException, ParseException {
		Properties p=PropertiesUtil.readProperties("file.properties");
		String picRootName=p.getProperty("picRootName");
		String jd_pic = "";
		Jobdetails jobdetails = new Jobdetails();
		jobdetails.setJd_name(request.getParameter("jd_name"));
		jobdetails.setJd_profession(request.getParameter("jd_profession"));
		jobdetails.setJd_salary(request.getParameter("jd_salary"));
		jobdetails.setJd_school(request.getParameter("jd_school"));
		jobdetails.setJd_emptime(request.getParameter("jd_emptime"));
		jobdetails.setJd_company(request.getParameter("jd_company"));
		jobdetails.setJd_palace(request.getParameter("jd_palace"));
		jobdetails.setJd_picUrl(file);
		// 上传
		Map<String, UploadFile> map = UploadFileUtil.uploadFile(request, jobdetails.getJd_picUrl(), picRootName);
		for (Entry<String, UploadFile> entry : map.entrySet()) {
			UploadFile uploadFile = entry.getValue();
			jd_pic += uploadFile.getNewFileUrl() + ",";
		}
		jobdetails.setJd_pic(jd_pic);
		try {
			jobdetailsBiz.add(jobdetails);
			MDC.put("explain" , "添加学员就业"+jobdetails.getJd_name());
			MDC.put("mchIp",new GetIp().getRemortIP(request) );
			logger.info("addjobdetails called....");
		} catch (Exception e) {
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}

	// 修改学员就业
	@RequestMapping(value = "/jobdetails_update")
	public void projectslist(HttpServletRequest request, Jobdetails jobdetails, HttpServletResponse response)
			throws IOException {
		try {
			this.jobdetailsBiz.update(jobdetails);
			MDC.put("explain" , "修改学员就业");
			MDC.put("mchIp",new GetIp().getRemortIP(request) );
			logger.info("Updatejobdetails called.....");
		} catch (Exception e) {
			response.getWriter().print("error");
		}
		response.getWriter().print("success");
	}

	// 删除学员就业
	@RequestMapping(value = "/jobdetails_delete")
	public String tobook(HttpServletRequest request,@RequestParam int id) {
		Jobdetails jobdetails = new Jobdetails();
		jobdetails.setJd_id(id);
		this.jobdetailsBiz.delete(jobdetails);
		MDC.put("explain" , "删除编号为"+id+"学员就业");
		MDC.put("mchIp",new GetIp().getRemortIP(request) );
		logger.info("Deletejobdetails called.....");
		return "redirect:/jobdetails";
	}
	
	
	@RequestMapping(value="/toprejobdetails",produces="text/html;charset=UTF-8")
	public @ResponseBody void toprejobdetails(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Jobdetails jobdetails=new Jobdetails();
		List<Jobdetails>jobdetail=this.jobdetailsBiz.findall(jobdetails);
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		MDC.put("explain" , "查询了官网就业详情");
		MDC.put("mchIp",new GetIp().getRemortIP(request) );
		logger.info("Deletejobdetails called.....");
		logger.info("selectpreprojects called...");
		response.getWriter().print(gson.toJson(jobdetail));
	}
	
}
