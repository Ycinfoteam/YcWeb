package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Employ;
import com.yc.biz.EmployBiz;
import com.yc.dao.BaseDao;

@Service
public class EmployBizImpl implements EmployBiz {

	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Employ> findEmploy(Employ employ) {
		List<Employ> list=this.baseDao.findAll(employ, "findEmploy");
		return list;
	}

	@Override
	public void addEmploy(Employ employ) {
		this.baseDao.add(employ, "addEmploy");
	}

	@Override
	public void updateEmploy(Employ employ) {
		this.baseDao.update(employ, "updateEmploy");
	}

	@Override
	public void deleteEmploy(Employ employ) {
		this.baseDao.update(employ, "deleteEmploy");
	}

}
