package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Teachers;
import com.yc.biz.TeachersBiz;
import com.yc.dao.BaseDao;
@Service
public class TeachersBizImpl implements TeachersBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Teachers> selectAllTeachers(Teachers teachers) {
		List<Teachers> teacherList=this.baseDao.findAll(teachers, "selectAllTeacher");
		return teacherList;
	}
	@Override
	public void deleteTeachersById(int t_id) {
		Teachers teachers=new Teachers();
		teachers.setT_id(t_id);
		this.baseDao.delete(teachers, "deleteOneTeacher");
	}
	@Override
	public void addTeachers(Teachers teachers) {
		this.baseDao.add(teachers, "addOneTeacher");
	}
	@Override
	public void updateTeachers(Teachers teachers) {
		this.baseDao.update(teachers, "updateOneTeacher");
	}
	@Override
	public int selectCountAll() {
		Teachers teachers=new Teachers();
		int total=(int) this.baseDao.fundFunc(teachers, "findtotal");
		return total;
	}
	@Override
	public boolean judge(Teachers teachers) {
		boolean flag=false;
		List<Teachers> tcList=this.baseDao.findAll(teachers, "judge");
		if(tcList!=null&&tcList.size()>0){
			flag=true;
		}
		return flag;
	}

}
