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
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.MDC;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Activities;
import com.yc.biz.ActivitiesBiz;
import com.yc.utils.GetIp;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;

import com.yc.utils.PropertiesUtil;

import com.yc.utils.UploadFileUtil;
import com.yc.utils.UploadFileUtil.UploadFile;

@Controller
public class ActivitiesController {
	private ActivitiesBiz activitiesBiz;
	private static final Log logger=LogFactory.getLog(ActivitiesController.class);
	@Resource(name="activitiesBizImpl")
	public void SetActivitiesBiz(ActivitiesBiz activitiesBiz){
		this.activitiesBiz = activitiesBiz;
	}
	//查看公司活动
	@RequestMapping(value="/activities")
	public void toactivities(@ModelAttribute Activities activities,HttpServletResponse response,HttpServletRequest request,HttpSession session,@RequestParam(value="page",required=false)Integer page,@RequestParam(value="rows",required=false)Integer rows) throws IOException{
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		activities.setStart(start);
		activities.setOffset(offset);
		List<Activities>activitie=this.activitiesBiz.findall(activities);
		MDC.put("explain" , "查看公司活动");
		MDC.put("mchIp",new GetIp().getRemortIP(request) );
		MDC.put("mchName",session.getAttribute("user"));
		logger.info("selectactivities called...");
		int total =this.activitiesBiz.findCount(activities);
		JsonModel model=new JsonModel();
		model.setRows(activitie);
		model.setTotal(total);
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(gson.toJson(model));
	}
	//添加公司活动
	@RequestMapping(value="/activities_add",method=RequestMethod.POST)
	public void activitiesadd(@RequestParam(value="ac_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		logger.info("addactivities called....");
		Properties p=PropertiesUtil.readProperties("file.properties");
		String picRootName=p.getProperty("picRootName");
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
			e.printStackTrace();
			response.getWriter().print(0);		
		}
		
			response.getWriter().print(1);
		
	}

	//修改学员项目
	@RequestMapping(value="/activities_update")
	public void activitieslist(Activities activities,HttpServletResponse response) throws IOException{
		logger.info("UpdateActivities called.....");
		System.out.println(activities.getAc_illus());
		try {
			this.activitiesBiz.update(activities);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);		
		}
		response.getWriter().print(1);
		}
	
	//修改公司活动图片
	@RequestMapping(value="/updateacpic")
	public void editpic(@RequestParam(value="ac_pic")List<MultipartFile> file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("Updateactivitiespic called.....");
		Properties p=PropertiesUtil.readProperties("file.properties");
		String picRootName=p.getProperty("picRootName");
		String ac_pic="";
		Activities activities=new Activities();
		activities.setAc_picUrl(file);
		String id=request.getParameter("ac_id");
		activities.setAc_id(Integer.parseInt(id));
		if(file!=null){
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request, activities.getAc_picUrl(), picRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			ac_pic+=uploadFile.getNewFileUrl()+",";
		}
		}
		activities.setAc_pic(ac_pic);
		
		try {
			this.activitiesBiz.update(activities);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);		
		}
		response.getWriter().print(1);		
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
