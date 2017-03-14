package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Students;
import com.yc.biz.StudentsBiz;
import com.yc.dao.BaseDao;
@Service
public class StudentsBizImpl implements StudentsBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Students> selectAllStudents() {
		Students students=new Students();
		List<Students> stuList=this.baseDao.findAll(students, "selectStudents");
		return stuList;
	}

	@Override
	public List<Students> selectStudentsById(int s_id) {
		Students students=new Students();
		students.setS_id(s_id);
		List<Students> stuList=this.baseDao.findAll(students, "selectStudents");
		return stuList;
	}

	@Override
	public void deleteStudentsById(int s_id) {
		Students students=new Students();
		students.setS_id(s_id);
		this.baseDao.delete(students, "deleteOneStudent");
	}

	@Override
	public void addStudents(Students students) {
		this.baseDao.add(students, "addOneStudent");
	}

	@Override
	public void updateStudents(Students students) {
		this.baseDao.update(students, "updateOneStudent");
	}

}
