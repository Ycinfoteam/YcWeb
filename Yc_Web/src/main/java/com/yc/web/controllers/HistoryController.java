package com.yc.web.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.History;
import com.yc.biz.HistoryBiz;
import com.yc.utils.JsonModel;
import com.yc.utils.PageUtil;

@Controller
public class HistoryController {
	private HistoryBiz historyBiz;
	private static final Log logger=LogFactory.getLog(ProjectsController.class);
	@Resource(name="historyBizImpl")
	public void SetHistoryBiz(HistoryBiz historyBiz){
		this.historyBiz = historyBiz;
	}
	//查看所有发展历史
	// produces = {"application/json;charset=UTF-8"} 设置http协议响应头，解决编码问题
	@RequestMapping(value="/history",produces = {"application/json;charset=UTF-8"})
	public void tohistory(@ModelAttribute History history,HttpServletResponse response,@RequestParam(value="page",required=false)Integer page,@RequestParam(value="rows",required=false)Integer rows) throws IOException{
		logger.info("selecthistory called...");
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		history.setStart(start);
		history.setOffset(offset);
		List<History>historys=this.historyBiz.findall(history);
		int total =this.historyBiz.findCount(history);
		JsonModel model=new JsonModel();
		model.setRows(historys);
		model.setTotal(total);
		Gson gson=new Gson();
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(gson.toJson(model));
	}

	@RequestMapping(value="showhstime",produces ="text/html;charset=UTF-8")
	public @ResponseBody String showhstime(@ModelAttribute History history){
		logger.info("showhstime called...");
		List<History> list=this.historyBiz.findall(history);
		Gson gson =new Gson();
		return gson.toJson(list);
	}
		//添加学员项目
		@RequestMapping(value="/history_add")
		public void historyadd(HttpServletRequest request,HttpServletResponse response,History history) throws IOException, ParseException{
			logger.info("addhistory called....");
			System.out.println(history.getH_content());
			history.setH_reg(" ");
			try {
				historyBiz.add(history);
			} catch (Exception e) {
				response.getWriter().print(0);		
			}
			response.getWriter().print(1);
		}
		

		//修改学员项目
		@RequestMapping(value="/history_update")
		public void projectslist(HttpServletRequest request,History history,HttpServletResponse response) throws IOException{
			logger.info("Updatehistory called.....");
			history.setH_reg(" ");
			try {
				this.historyBiz.update(history);
			} catch (Exception e) {
				response.getWriter().print(0);		
			}
			response.getWriter().print(1);
			}
		//删除学员项目
		@RequestMapping(value="/history_delete")
		public String deletehistory(@RequestParam int id){
			logger.info("Deletehistory called.....");
			History history=new History();
			history.setH_id(id);
			this.historyBiz.delete(history);
			return "redirect:/history";
			}
		//学员项目
				@RequestMapping(value="/toprehistory",produces="text/html;charset=UTF-8")
				public @ResponseBody void toprehistory(HttpServletResponse response) throws IOException{
					logger.info("selectprehistory called.....");
					History history=new History();
					List<History>historys=this.historyBiz.findall(history);
					Gson gson =new Gson();
					response.setContentType("text/html; charset=utf-8");
					response.getWriter().print(gson.toJson(historys));
					}
		
		
	}