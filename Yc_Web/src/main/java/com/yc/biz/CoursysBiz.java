package com.yc.biz;

import java.util.List;

import com.yc.bean.Coursys;

public interface CoursysBiz {
	//查询所有的课程体系
	public List<Coursys> selectAllCoursys(Coursys csys);
	//根据条件查询课程体系
	public List<Coursys> selectCoursysById(int cs_id);
	//删除课程体系
	public void deleteCoursysById(int cs_id);
	//添加课程体系
	public void addCoursys(Coursys csys);
	//修改课程体系
	public void updateCoursys(Coursys csys);
	//查寻课程体系中是否存在所查记录
	public boolean judge(Coursys csys);
	//查询课程体系表的总记录数
	public int selectCountAll();
}
