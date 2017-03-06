package com.yc.biz;

import java.util.List;

import com.yc.bean.Employ;

//招聘业务层
public interface EmployBiz {

	//查询招聘信息
	public List<Employ> findEmploy(Employ employ);
	
	//插入招聘信息
	public void addEmploy(Employ employ);
	
	//修改招聘信息
	public void updateEmploy(Employ employ);
	
	//删除招聘信息
	public void deleteEmploy(Employ employ);
	
}
