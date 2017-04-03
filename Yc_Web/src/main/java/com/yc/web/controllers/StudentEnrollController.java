package com.yc.web.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.taobao.api.ApiException;
import com.yc.bean.Students;
import com.yc.biz.StudentsBiz;
import com.yc.utils.GetIp;
import com.yc.utils.JsonModel;
import com.yc.utils.MessageUtil;
import com.yc.utils.PageUtil;
import com.yc.utils.PdfFileExport;

@Controller
public class StudentEnrollController {
	private static final Log logger=LogFactory.getLog(StudentEnrollController.class);
	private StudentsBiz stuBiz;
	@Resource(name="studentsBizImpl")
	public void setStuBiz(StudentsBiz stuBiz) {
		this.stuBiz = stuBiz;
	}
	//查询所有的学生报名信息
	@RequestMapping(value="/stu_selectAll",produces ="text/html;charset=UTF-8")
	public @ResponseBody String selectAllStudent(@ModelAttribute Students stus,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="rows",required=false) Integer rows,HttpServletResponse resp, HttpServletRequest request, HttpSession session){
		resp.setContentType("application/text;charset=utf-8 ");
		//处理分页
		int start =PageUtil.judgeStart(page, rows);
		int offset=PageUtil.judgeOffset(rows);
		stus.setStart(start);
		stus.setOffset(offset);
		List<Students> newsList=this.stuBiz.selectAllStudents(stus);
		MDC.put("explain" , "查找所有学生报名");
		MDC.put("mchIp",new GetIp().getRemortIP(request) );
		MDC.put("mchName",session.getAttribute("user"));
		logger.info("select all studentenroll......");
		int total =this.stuBiz.selectCountAll();
		JsonModel model=new JsonModel();
		model.setRows(newsList);
		model.setTotal(total);
		Gson gson =new Gson();
		return gson.toJson(model);
	}
	//根据条件查询学生报名信息
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

	//导出为pdf文件
	@RequestMapping(value="/loadpdf",produces ="text/html;charset=UTF-8")
	public @ResponseBody void loadpdf(@RequestParam(value="planids[]")List<Integer>planids,@RequestParam(value="names[]")List<String>names,@RequestParam(value="tels[]")List<String>tels,@RequestParam(value="classess[]")List<String>classess,HttpServletResponse resp,HttpServletRequest request){
		System.out.println("jinlailele");
		int total=planids.size()+1;
		String[][] tableContent=new String[total][6];
		for(int i=0;i<total;i++){
			if(i==0){
				tableContent[i][0]="序号";
				tableContent[i][1]="报名编号";
				tableContent[i][2]="姓名";
				tableContent[i][3]="联系方式";
				tableContent[i][4]="意向";
				tableContent[i][5]="备注";
				}else{
					tableContent[i][0]=i+"";
					tableContent[i][1]=planids.get(i-1)+"";
					tableContent[i][2]=names.get(i-1);
					tableContent[i][3]=tels.get(i-1);
					tableContent[i][4]=classess.get(i-1);
					tableContent[i][5]="";
				}
			System.out.println(tableContent[i][0]);
		}
	PdfFileExport pdfFileExport = new PdfFileExport();
	pdfFileExport.exportTableContent("D:/报名名单.pdf", tableContent, total, 2000);


	
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
				MessageUtil.sendMessageforOpenCls(name, tel, oc_time, address, s_direction, "SMS_60020056");
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
	//添加学生报名信息
	@RequestMapping(value="/stu_add")
	public @ResponseBody void addStudent(@RequestParam(value="s_name") String s_name,
			@RequestParam(value="s_tel") String s_tel,@RequestParam(value="s_direction") String s_direction){
		Students stu=new Students();
		try {
			this.stuBiz.addStudents(stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//发送短信验证码
	@RequestMapping(value="/sendTelYZM")
	public @ResponseBody void sendTelYZM(Students stus, @RequestParam(value="s_name") String s_name,@RequestParam(value="s_tel") String s_tel,
			HttpServletResponse response) throws IOException{
		logger.info("发送短信验证码到报名学生手机");
		//SMS_60020056
		Random r=new Random();
		String YZM=""+r.nextInt(9999-1000+1)+1000;
		try {
				MessageUtil.sendMessageforCheckTel(s_name, s_tel,YZM, "SMS_59965389");
		} catch (ApiException e) {
			e.printStackTrace();
			response.getWriter().print(0);
		}
		response.getWriter().print(YZM);
	}
}
