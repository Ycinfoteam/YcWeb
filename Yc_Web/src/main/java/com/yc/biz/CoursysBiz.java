package com.yc.biz;

import java.util.List;

import com.yc.bean.Coursys;

public interface CoursysBiz {
	//查询所有的课程体系
	public List<Coursys> selectAllCoursys();
	//根据条件查询课程体系
	public List<Coursys> selectCoursysById(int cs_id);
	//删除课程体系
	public void deleteCoursysById(int cs_id);
	//添加课程体系
	public void addCoursys(Coursys csys);
	//修改课程体系
	public void updateCoursys(Coursys csys);
}
