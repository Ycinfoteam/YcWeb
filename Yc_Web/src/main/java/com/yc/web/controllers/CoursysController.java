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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Coursys;
import com.yc.biz.CoursysBiz;
import com.yc.util.JsonModel;
import com.yc.util.PageUtil;
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
	@RequestMapping(value="/coursys_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllCoursys(@ModelAttribute Coursys csys,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows,HttpServletResponse resp) throws IOException {
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all coursys......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		csys.setStart(start);
		csys.setOffset(offset);
		List<Coursys> coursysList=this.coursysBiz.selectAllCoursys(csys);
		int total =this.coursysBiz.selectCountAll();//查询所有的记录总数，用于分页显示
		JsonModel model=new JsonModel();
		model.setRows(coursysList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//添加一条课程体系信息
	private String pdfRootName="uploadpic";
	@RequestMapping(value="/coursys_add",produces={"text/html; charset=UTF-8"})
	public @ResponseBody void addOneCoursys(Coursys coursys,@RequestParam(value="picUrl") List<MultipartFile> picUrl,HttpServletRequest request,HttpServletResponse response ) throws IOException{
		logger.info("add one coursys......");
		String pics="";
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			pics+=uploadFile.getNewFileUrl()+",";
		}
		coursys.setCs_pic(pics);
		coursys.setCs_status(1);
		boolean flag=this.coursysBiz.judge(coursys);
		if(flag){
			response.getWriter().print(2);
		}else{
			try {
				this.coursysBiz.addCoursys(coursys);
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().print(0);
			}
			response.getWriter().print(1);
		}
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
	}
	//修改课程体系信息
	@RequestMapping(value="/coursys_update")
	public void updateOneCoursys(@ModelAttribute Coursys csys,HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("update one coursys......");
		try {
			this.coursysBiz.updateCoursys(csys);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改课程体系图片
	@RequestMapping(value="/coursys_updatepic")
	public void updateOneCoursysPic(Coursys csys,@RequestParam(value="update_picUrl") List<MultipartFile> picUrl,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("update one coursys......");
			String cs_id=request.getParameter("cs_id");
			String pics="";
			Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
			for(Entry<String,UploadFile> entry:map.entrySet()){
				UploadFile uploadFile=entry.getValue();
				pics+=uploadFile.getNewFileUrl()+",";
			}
			csys.setCs_pic(pics);
		try {
			this.coursysBiz.updateCoursys(csys);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//根据ID查询课程体系
	@RequestMapping(value="/selectCsById",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectCoursysById(@RequestParam(value="cs_id",required=false) Integer cs_id){
		logger.info("select one coursys by id......");
		List<Coursys> csys=this.coursysBiz.selectCoursysById(cs_id);
		Gson gson =new Gson();
		return gson.toJson(csys);
	}
	//根据课程体系名查询
	@RequestMapping(value="/findCsName",produces ="text/html;charset=UTF-8")
	public void selectCoursysByName(String cs_name,HttpServletResponse response) throws IOException{
		logger.info("select coursys by cs_name......");
		Coursys csys=new Coursys();
		csys.setCs_name(cs_name);
		boolean flag=this.coursysBiz.judge(csys);
		System.out.println(flag);
		PrintWriter out = response.getWriter();
		if(flag){
			out.print("exsist");//课程体系名为该名字的记录存在
		}else{
			out.print("disexsist");
		}
	}
}
