package com.yc.biz;

import java.util.List;

import com.yc.bean.Students;

public interface StudentsBiz {
	//查询所有的学生报名信息
	public List<Students> selectAllStudents();
	//根据学生报名信息编号查询学生报名信息
	public List<Students> selectStudentsById(int s_id);
	//删除学生报名信息
	public void deleteStudentsById(int s_id);
	//添加学生报名信息
	public void addStudents(Students students);
	//修改学生报名信息
	public void updateStudents(Students students);
}
