package com.yc.web.controllers;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.ApplyJob;
import com.yc.biz.ApplyJobBiz;
import com.yc.util.DateFormatUtil;
import com.yc.util.JsonModel;
import com.yc.util.PageUtil;

@Controller
public class ApplyJobController {

	private static final Logger log=Logger.getLogger(ApplyJobController.class);
	
	private ApplyJobBiz applyJobBiz;

	@Resource(name="applyJobBizImpl")
	public void setApplyJobBiz(ApplyJobBiz applyJobBiz) {
		this.applyJobBiz = applyJobBiz;
	}
	
	@RequestMapping(value="/findAllApply",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findAllApply (@ModelAttribute ApplyJob applyJob,HttpServletResponse response,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows){
		log.info("findAllApply called ...."); 
		
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		//处理时间
		String date=DateFormatUtil.ycDateformat(new Date(), "yyyy-MM-dd");
		applyJob.setA_time(date); 
		applyJob.setStart(start);
		applyJob.setOffset(offset);
		List<ApplyJob> list=this.applyJobBiz.findApply(applyJob);
		int total =this.applyJobBiz.findCount(applyJob);
		JsonModel model=new JsonModel();
		model.setRows(list);
		model.setTotal(total);
		Gson gson =new Gson();
		
		return gson.toJson(model);
	} 
	
	@RequestMapping(value="updateApply")
	public @ResponseBody int updateApply ( @RequestParam(value="a_id[]") List<Integer> a_id){
		log.info("updateApply called...");
		for(int id:a_id){
			ApplyJob applyJob =new ApplyJob();
			applyJob.setA_id(id);
			this.applyJobBiz.updateApply(applyJob);
		}
		return 1;
	}
	
}
