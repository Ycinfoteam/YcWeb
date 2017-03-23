package com.yc.web.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Activities;
import com.yc.bean.Projects;
import com.yc.biz.ActivitiesBiz;
import com.yc.web.utils.UploadFileUtil;
import com.yc.web.utils.UploadFileUtil.UploadFile;

@Controller
public class ActivitiesController {
	private ActivitiesBiz activitiesBiz;
	private static final Log logger=LogFactory.getLog(ActivitiesController.class);
	@Resource(name="activitiesBizImpl")
	public void SetBookBiz(ActivitiesBiz activitiesBiz){
		this.activitiesBiz = activitiesBiz;
	}
	//查看公司活动
	@RequestMapping(value="/activities")
	public void toprojects(HttpServletResponse response) throws IOException{
		logger.info("selectactivities called...");
		List<Activities>activities=this.activitiesBiz.findall();
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(gson.toJson(activities));
	}
	private String picRootName="uploadpic";
	//添加学员项目
	@RequestMapping(value="/activities_add",method=RequestMethod.POST)
	public void projectsadd(@RequestParam(value="ac_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		logger.info("addprojects called....");
		String ac_pic="";
		Activities activities = new Activities();
		activities.setAc_illus(request.getParameter("ac_illus"));
		activities.setAc_picUrl(file);
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(request.getParameter("ac_time"));
		*/
		activities.setAc_time(request.getParameter("ac_time"));
		//上传
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request, activities.getAc_picUrl(), picRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			ac_pic+=uploadFile.getNewFileUrl()+",";
		}
		
		activities.setAc_pic(ac_pic);
		try {
			activitiesBiz.add(activities);;
		} catch (Exception e) {
			response.getWriter().print(0);		
		}
		response.getWriter().print(1);
	}

	//修改学员项目
	@RequestMapping(value="/activities_update")
	public String activitieslist(Activities activities){
		logger.info("UpdateActivities called.....");
		this.activitiesBiz.update(activities);
		return "redirect:/activities";
	}
	//删除学员项目
	@RequestMapping(value="/activities_delete")
	public String tobook(@RequestParam int id){
		logger.info("Deleteprojects called.....");
		Activities activities=new Activities();
		activities.setAc_id(id);
		this.activitiesBiz.delete(activities);
		return "redirect:/activities";
	}
}
