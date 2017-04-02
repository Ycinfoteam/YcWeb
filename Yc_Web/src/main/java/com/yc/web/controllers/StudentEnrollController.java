package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.taobao.api.ApiException;
import com.yc.bean.Students;
import com.yc.biz.StudentsBiz;
import com.yc.utils.JsonModel;
import com.yc.utils.MessageUtil;
import com.yc.utils.PageUtil;
import com.yc.utils.PropertiesUtil;

@Controller
public class StudentEnrollController {
	private static final Log logger=LogFactory.getLog(StudentEnrollController.class);
	private StudentsBiz stuBiz;
	@Resource(name="studentsBizImpl")
	public void setStuBiz(StudentsBiz stuBiz) {
		this.stuBiz = stuBiz;
	}
	//去学生报名界面
	@RequestMapping(value="/toStudentEnroll")
	public String toStudentEnroll(Model model,@RequestParam(value="classType") String classType){
		model.addAttribute("classType", classType);
		return "studentEnroll";
	}
	//查询所有的学生报名信息
	@RequestMapping(value="/stu_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllStudent(@ModelAttribute Students stus,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows,HttpServletResponse resp){
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("select all news......");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		stus.setStart(start);
		stus.setOffset(offset);
		List<Students> newsList=this.stuBiz.selectAllStudents(stus);
		int total =this.stuBiz.selectCountAll();
		JsonModel model=new JsonModel();
		model.setRows(newsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//根据条件查询学生报名信息
	@RequestMapping(value="/stu_selectByTag",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllStudent(@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="rows",required=false) Integer rows,
			HttpServletResponse resp,HttpServletRequest request){
		resp.setContentType("application/text;charset=utf-8 ");
		logger.info("根据条件查询学生报名信息");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		String direction=request.getParameter("direction");
		String status=request.getParameter("status");
		Students stus=new Students();
		stus.setStart(start);
		stus.setOffset(offset);
		if(status.equals("1")||status.equals("0")){
			stus.setS_status(Integer.parseInt(status));
		}
		if(direction!=null&&!"".equals(direction)&&!"请选择".equals(direction)){
			stus.setS_direction(direction);
		}
		List<Students> newsList=this.stuBiz.selectAllStudents(stus);
		int total =this.stuBiz.selectCountAll();
		JsonModel model=new JsonModel();
		if(newsList.size()==0){
			Students stu=new Students();
			List<Students> newslist=this.stuBiz.selectAllStudents(stu);
			model.setRows(newslist);
		}else{
			model.setRows(newsList);
		}
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//发送开班短信
	private static int SCORE_COUNT = 0;//执行过的数目
	private int total=0;//执行的总数
	@RequestMapping(value="/sendclsinfo",produces ="text/html;charset=UTF-8")
	public @ResponseBody void sendClsInfo(Students stus, @RequestParam(value="planIds[]") List<Integer> planIds,
			@RequestParam(value="tels[]") List<String> tels,
			@RequestParam(value="names[]") List<String> names,
			String oc_time,String address,String s_direction,
			HttpServletResponse response) throws IOException{
		logger.info("发送开班信息短信到报名学生手机");
		//SMS_60020056
		System.out.println(tels+"-"+ planIds+names+oc_time+address);
		SCORE_COUNT = 0;//执行过的数目 进来就置为0
		total=planIds.size();
		try {
			for(int i=0;i<total;i++){
				String name=names.get(i);
				String tel=tels.get(i);
				MessageUtil.sendMessageforOpenCls("a", tel, oc_time, address, s_direction, "SMS_60020056");
				Students stu=new Students();
				stu.setS_id(planIds.get(i));
				stu.setS_status(1);
				this.stuBiz.updateStudents(stu);
			}
		} catch (ApiException e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//修改学生报名信息
	@RequestMapping(value="/stu_update",produces ="text/html;charset=UTF-8")
	public @ResponseBody void updateStudent(Students students,HttpServletResponse response) throws IOException{
		logger.info("修改学生报名信息");
		try {
			this.stuBiz.updateStudents(students);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
	//删除学生报名信息
	@RequestMapping(value="/stu_delete")
	public @ResponseBody void deleteStudent(@RequestParam(value="id") int s_id,HttpServletResponse response) throws IOException{
		logger.info("删除学生报名信息");
		try {
			this.stuBiz.deleteStudentsById(s_id);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(1);
	}
}
