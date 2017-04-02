package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.Coursys;
import com.yc.bean.OpenClass;
import com.yc.bean.Teachers;
import com.yc.biz.OpenClassBiz;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;
import com.yc.utils.UploadFileUtil;
import com.yc.utils.UploadFileUtil.UploadFile;

@Controller
public class OpenClassController {
	private static final Logger logger=Logger.getLogger(OpenClassController.class);
	private OpenClassBiz openClsBiz;
	@Resource(name="openClassBizImpl")
	public void setOpenClsBiz(OpenClassBiz openClsBiz) {
		this.openClsBiz = openClsBiz;
	}
	//查询所有的开班信息
	@RequestMapping(value="/openCls_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllOpenCls(@ModelAttribute OpenClass openCls,
			@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="rows",required=false) Integer rows,
			HttpServletResponse resp) throws IOException {
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("查询所有的开班信息");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		openCls.setStart(start);
		openCls.setOffset(offset);
		List<OpenClass> openClsList=this.openClsBiz.selectAllOpenClass(openCls);
		int total =this.openClsBiz.selectCountAll();//查询所有的记录总数，用于分页显示
		JsonModel model=new JsonModel();
		model.setRows(openClsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//显示开班信息
	@RequestMapping(value="/findopenCls",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectOpenCls(@ModelAttribute OpenClass openCls,
			@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="rows",required=false) Integer rows,
			HttpServletResponse resp) throws IOException {
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("根据条件查询的开班信息");
		List<OpenClass> openClsList=this.openClsBiz.selectAllOpenClass(openCls);
		Gson gson =new Gson();
		return gson.toJson(openClsList);
	}
	//添加一条开班信息
	private String pdfRootName="uploadpic";
	@RequestMapping(value="/openCls_add",produces={"text/html; charset=UTF-8"})
	public @ResponseBody void addOneOpenCls(OpenClass openCls,@RequestParam(value="picUrl") List<MultipartFile> picUrl,HttpServletRequest request,HttpServletResponse response ) throws IOException{
		logger.info("添加一条开班信息");
		String pics="";
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			pics+=uploadFile.getNewFileUrl()+",";
		}
		openCls.setOc_pic(pics);
		openCls.setOc_status(1);
		System.out.println(openCls);
		try {
			this.openClsBiz.addOpenClass(openCls);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//删除一条开班信息
	@RequestMapping(value="/openCls_delete")
	public @ResponseBody void deleteOneOpenCls(@RequestParam(value="id") int oc_id,HttpServletResponse response) throws IOException{
		logger.info("删除一条开班信息......");
		try {
			OpenClass openCls=new OpenClass();
			this.openClsBiz.deleteOpenClass(openCls);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改开班信息
	@RequestMapping(value="/openCls_update")
	public void updateOneCoursys(@ModelAttribute OpenClass openCls,HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("修改一条开班信息......");
		try {
			this.openClsBiz.updateOpenClass(openCls);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改图片
	@RequestMapping(value="/openCls_updatepic")
	public void updateOneTeachersPic(Integer oc_id,@RequestParam(value="update_picUrl") List<MultipartFile> picUrl,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("修改开班信息图片......");
		String pics="";
		Map<String,UploadFile> map=UploadFileUtil.uploadFile(request,picUrl,pdfRootName);
		for(Entry<String,UploadFile> entry:map.entrySet()){
			UploadFile uploadFile=entry.getValue();
			pics+=uploadFile.getNewFileUrl()+",";
		}
		OpenClass openCls=new OpenClass();
		openCls.setOc_id(oc_id);
		openCls.setOc_pic(pics);
		try {
			this.openClsBiz.updateOpenClass(openCls);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
}
