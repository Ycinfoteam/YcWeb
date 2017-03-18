package com.yc.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.Aboutyc;
import com.yc.bean.Activities;
import com.yc.bean.History;
import com.yc.bean.Jobdetails;
import com.yc.bean.Projects;
import com.yc.bean.Technology;
import com.yc.biz.AboutycBiz;
import com.yc.biz.ActivitiesBiz;
import com.yc.biz.HistoryBiz;
import com.yc.biz.JobdetailsBiz;
import com.yc.biz.ProjectsBiz;
import com.yc.biz.TechnologyBiz;

import junit.framework.TestCase;

public class Test extends TestCase {

	public void testConnection() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		DataSource ds = (DataSource) ac.getBean("dataSource");
		Connection con = ds.getConnection();
		System.out.println(con);
	}

	public void testSqlSessionFactory() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		assertNotNull(ac.getBean("sqlSessionFactory"));
		System.out.println(ac.getBean("sqlSessionFactory"));
		SqlSessionFactory ds = (SqlSessionFactory) ac.getBean("sqlSessionFactory");
		System.out.println(ds);

	}

	/////// 学生项目表
	// 添加学生项目
	/*
	 * public void testProadd() throws SQLException{ ApplicationContext ac=new
	 * ClassPathXmlApplicationContext("beans.xml"); ProjectsBiz
	 * bab=(ProjectsBiz) ac.getBean("projectsBizImpl"); Projects ba=new
	 * Projects(); ba.setP_name("仓库管理系统"); Date date=new Date();
	 * date.setTime(date.getTime()); ba.setP_pic(""); ba.setP_time(date);
	 * ba.setP_developer("钟霞"); ba.setP_addr("衡阳"); bab.add(ba); }
	 */
	// 删除学生项目
	public void testProdelete() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		ProjectsBiz bab = (ProjectsBiz) ac.getBean("projectsBizImpl");
		Projects ba = new Projects();
		ba.setP_name("网易云音乐");
		bab.delete(ba);
	}

	// 修改技术支持
	/*
	 * public void testProupdate() throws SQLException{ ApplicationContext
	 * ac=new ClassPathXmlApplicationContext("beans.xml"); ProjectsBiz
	 * bab=(ProjectsBiz) ac.getBean("projectsBizImpl"); Projects ba=new
	 * Projects(); ba.setP_id(2);; ba.setP_name("xixi"); Date date=new Date();
	 * date.setTime(date.getTime()); ba.setP_time(date); bab.update(ba); }
	 */
	// 查询学生项目
	public void testProselect() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		ProjectsBiz bab = (ProjectsBiz) ac.getBean("projectsBizImpl");
		Projects ba = new Projects();
		List<Projects> list = bab.findall();
		System.out.println(list);
	}

	// 根据条件查询学生项目
	public void testProselectby() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		ProjectsBiz bab = (ProjectsBiz) ac.getBean("projectsBizImpl");
		Projects ba = new Projects();
		ba.setP_name("xixi");
		List<Projects> list = bab.findby(ba);
		System.out.println(list);
	}
	////// 技术支持
	// 添加技术支持
	/*
	 * public void testTechadd() throws SQLException{ ApplicationContext ac=new
	 * ClassPathXmlApplicationContext("beans.xml"); TechnologyBiz
	 * bab=(TechnologyBiz) ac.getBean("technologyBizImpl"); Technology ba=new
	 * Technology(); ba.setTe_name("sss"); Date date=new Date();
	 * date.setTime(date.getTime()); ba.setTe_click(3); ba.setTe_time(date);
	 * ba.setTe_content("hahahah"); ba.setTe_title("钟霞"); bab.add(ba); }
	 */

	// 删除技术支持
	public void testTechdelete() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		TechnologyBiz bab = (TechnologyBiz) ac.getBean("technologyBizImpl");
		Technology ba = new Technology();
		ba.setTe_title("钟霞");
		bab.delete(ba);
	}

	// 修改技术支持
	/*
	 * public void testTechupdate() throws SQLException{ ApplicationContext
	 * ac=new ClassPathXmlApplicationContext("beans.xml"); TechnologyBiz
	 * bab=(TechnologyBiz) ac.getBean("technologyBizImpl"); Technology ba=new
	 * Technology(); ba.setTe_id(1); ba.setTe_title("从开始到现在"); Date date=new
	 * Date(); date.setTime(date.getTime()); ba.setTe_time(date);
	 * bab.update(ba); }
	 */
	// 查询技术支持
	public void testTechselect() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		TechnologyBiz bab = (TechnologyBiz) ac.getBean("technologyBizImpl");
		Technology ba = new Technology();
		List<Technology> list = bab.findall();
		System.out.println(list);
	}
	//////// 公司活动
	// 添加公司活动
	/*
	 * public void testActadd() throws SQLException{ ApplicationContext ac=new
	 * ClassPathXmlApplicationContext("beans.xml"); ActivitiesBiz
	 * bab=(ActivitiesBiz) ac.getBean("activitiesBizImpl"); Activities ba=new
	 * Activities(); ba.setAc_illus("活动"); Date date=new Date();
	 * date.setTime(date.getTime()); ba.setAc_time(date);; ba.setAc_pic("");
	 * bab.add(ba); }
	 */

	// 删除技术支持
	public void testActdelete() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		ActivitiesBiz bab = (ActivitiesBiz) ac.getBean("activitiesBizImpl");
		Activities ba = new Activities();
		ba.setAc_id(2);
		bab.delete(ba);
	}

	// 修改技术支持
	/*
	 * public void testActupdate() throws SQLException{ ApplicationContext
	 * ac=new ClassPathXmlApplicationContext("beans.xml"); ActivitiesBiz
	 * bab=(ActivitiesBiz) ac.getBean("activitiesBizImpl"); Activities ba=new
	 * Activities(); ba.setAc_id(2); Date date=new Date();
	 * date.setTime(date.getTime()); ba.setAc_time(date); ba.setAc_illus("hao");
	 * bab.update(ba); }
	 */
	// 查询技术支持
	public void testActselect() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		ActivitiesBiz bab = (ActivitiesBiz) ac.getBean("activitiesBizImpl");
		Activities ba = new Activities();
		List<Activities> list = bab.findall();
		System.out.println(list);
	}

	// 添加学员就业
	public void testctadd() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		JobdetailsBiz bab = (JobdetailsBiz) ac.getBean("jobdetailsBizImpl");
		Jobdetails ba = new Jobdetails();
		ba.setJd_name("xixi");
		ba.setJd_pic("");
		ba.setJd_profession("lala");
		ba.setJd_salary("kkk");
		ba.setJd_company("mm");
		ba.setJd_emptime("1995-09-23");
		ba.setJd_school("hugong");
		bab.add(ba);
	}

	// 修改学员就业
	public void testActupdate() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		JobdetailsBiz bab = (JobdetailsBiz) ac.getBean("jobdetailsBizImpl");
		Jobdetails ba = new Jobdetails();
		ba.setJd_name("xixi");
		ba.setJd_pic("");
		ba.setJd_profession("lala");
		ba.setJd_salary("kkk");
		ba.setJd_company("mm");
		ba.setJd_emptime("1995-09-23");
		ba.setJd_school("hugong");
		ba.setJd_id(2);
		bab.update(ba);
	}

	// 查询关于公司
	public void testycselect() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		AboutycBiz bab = (AboutycBiz) ac.getBean("aboutycBizImpl");
		Aboutyc ba = new Aboutyc();
		List<Aboutyc> list = bab.findall();
		System.out.println(list);
	}

	// 添加关于公司
	public void testycadd() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		AboutycBiz bab = (AboutycBiz) ac.getBean("aboutycBizImpl");
		Aboutyc ba = new Aboutyc();
		ba.setA_title("xxx");
		ba.setA_time("1995-12-20");
		ba.setA_tel("15073453495");
		ba.setA_source("xxx");
		ba.setA_reptor("lalla");
		ba.setA_qq("11343");
		ba.setA_copr("dd");
		ba.setA_content("xxx");
		ba.setA_code(11);
		ba.setA_address("xxxx");
		bab.add(ba);
	}

	// 修改关于公司
	public void testycupdate() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		AboutycBiz bab = (AboutycBiz) ac.getBean("aboutycBizImpl");
		Aboutyc ba = new Aboutyc();
		ba.setA_title("xxx");
		ba.setA_time("1995-12-20");
		ba.setA_tel("15073453495");
		ba.setA_source("xxx");
		ba.setA_reptor("lalla");
		ba.setA_qq("11343");
		ba.setA_copr("dd");
		ba.setA_content("xxx");
		ba.setA_code(33);
		ba.setA_address("xxxx");
		ba.setA_id(1);
		bab.update(ba);
	}
	//删除关于公司
	public void testycdelete() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		AboutycBiz bab = (AboutycBiz) ac.getBean("aboutycBizImpl");
		Aboutyc ba = new Aboutyc();
		ba.setA_id(1);
		bab.delete(ba);
	}
	
	// 查询公司历史
	public void testhselect() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		HistoryBiz bab = (HistoryBiz) ac.getBean("historyBizImpl");
		History ba = new History();
		List<History> list = bab.findall();
		System.out.println(list);
	}

	// 添加公司历史
	public void testhadd() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		HistoryBiz bab = (HistoryBiz) ac.getBean("historyBizImpl");
		History ba = new History();
		ba.setH_content("xxxx");
		ba.setH_createtime("1998-03-19");
		ba.setH_reg("");
		ba.setH_creator("zhongxia");
		bab.add(ba);
	}

	// 修改公司历史
	public void testhupdate() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		HistoryBiz bab = (HistoryBiz) ac.getBean("historyBizImpl");
		History ba = new History();
		ba.setH_content("xxxx");
		ba.setH_createtime("1998-03-19");
		ba.setH_reg("xx");
		ba.setH_creator("zhongxia");
		ba.setH_id(1);
		bab.update(ba);
	}
	
	//删除公司历史
	public void testhdelete() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		HistoryBiz bab = (HistoryBiz) ac.getBean("historyBizImpl");
		History ba = new History();
		ba.setH_id(1);
		bab.delete(ba);
	}

}
