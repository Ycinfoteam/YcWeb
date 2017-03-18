package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Coursys;
import com.yc.biz.CoursysBiz;
import com.yc.utils.JsonUtils;
import com.yc.utils.UploadFileUtil;
import com.yc.utils.UploadFileUtil.UploadFile;

@Controller
public class CoursysController {
	private static final Log logger=LogFactory.getLog(CoursysController.class);
	private CoursysBiz coursysBiz;
	@Resource(name="coursysBizImpl")
	public void setCoursysBiz(CoursysBiz coursysBiz) {
		this.coursysBiz = coursysBiz;
	}
	//查询所有的课程体系信息
	@RequestMapping(value="/coursys_selectAll")
	public String selectAllCoursys(HttpServletResponse resp) throws IOException {
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all coursys......");
		List<Coursys> coursysList=this.coursysBiz.selectAllCoursys();
		JsonUtils.print(coursysList, resp);
		return "coursys";
	}
	//添加一条课程体系信息
	private String pdfRootName="uploadpic";
	@RequestMapping(value="/coursys_add",produces={"text/html; charset=UTF-8"})
	public @ResponseBody void addOneCoursys(@RequestParam(value="picUrl") List<MultipartFile> picUrl,HttpServletRequest request,HttpServletResponse response ) throws IOException{
		logger.info("add one coursys......");
		String pics="";
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			pics+=uploadFile.getNewFileUrl()+",";
		}
		Coursys coursys=new Coursys();
		coursys.setCs_name(request.getParameter("cs_name"));
		coursys.setCs_pic(pics);
		coursys.setCs_version(request.getParameter("cs_version"));
		coursys.setCs_text(request.getParameter("cs_text"));
		coursys.setCs_status(1);
		try {
			this.coursysBiz.addCoursys(coursys);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		//boolean flag=this.coursysBiz.judge("add", coursys);
		response.getWriter().print(1);
	}
	//删除一条课程体系信息
	@RequestMapping(value="/coursys_delete")
	public @ResponseBody void deleteOneCoursys(@RequestParam(value="id") int cs_id,HttpServletResponse response) throws IOException{
		logger.info("delete one coursys......");
		try {
			this.coursysBiz.deleteCoursysById(cs_id);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
		//Coursys coursys=new Coursys();
		//coursys.setCs_id(cs_id);
		//boolean flag=this.coursysBiz.judge("delete", coursys);
	}
	//修改一掉课程体系信息
	@RequestMapping(value="/coursys_update")
	public void updateOneCoursys(Coursys csys,HttpServletResponse response) throws IOException{
		logger.info("update one coursys......");
		System.out.println("name："+csys.getCs_name());
		try {
			this.coursysBiz.updateCoursys(csys);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
}
