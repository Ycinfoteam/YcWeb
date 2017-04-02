package com.yc.biz;

import java.util.List;

import com.yc.bean.Teachers;

public interface TeachersBiz {
	//查询教师
	public List<Teachers> selectAllTeachers(Teachers teachers);
	//删除教师
	public void deleteTeachersById(int t_id);
	//添加教师
	public void addTeachers(Teachers teachers);
	//修改教师
	public void updateTeachers(Teachers teachers);
	//查询所有的教师记录总数
	public int selectCountAll();
	//判断表中是否存在该教师信息
	public boolean judge(Teachers teachers);
}
