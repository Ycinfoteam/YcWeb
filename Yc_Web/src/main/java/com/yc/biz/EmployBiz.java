package com.yc.biz;

import java.util.List;

import com.yc.bean.Employ;

/**
 * 招聘业务层
 * @author S3
 *
 */
public interface EmployBiz {

	//查询招聘信息
	public List<Employ> findEmploy(Employ employ);
	
	//插入招聘信息
	public void addEmploy(Employ employ);
	
	//修改招聘信息
	public void updateEmploy(Employ employ);
	
	//删除招聘信息
	public void deleteEmploy(Employ employ);
	
	//查询记录总数
	public int findCount(Employ employ);
	
	//分页工具 page
	public int judgeStart(Integer page,Integer rows);
	
	//分页工具 rows
	public int judgeOffset(Integer rows);
	
}
