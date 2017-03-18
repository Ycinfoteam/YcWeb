package com.yc.biz;

import java.util.List;

import com.yc.bean.Jobdetails;

//学员就业信息业务层
public interface JobdetailsBiz {
	
	//查询学员就业信息
	public List<Jobdetails> findJobdetails(Jobdetails jobdetails);
	
	//插入学员就业信息
	public void addJobdetails(Jobdetails jobdetails);
	
	//修改学员就业信息
	public void updateJobdetails(Jobdetails jobdetails);
	
	//删除学员就业信息
	public void deleteJobdetails(Jobdetails jobdetails);
}
