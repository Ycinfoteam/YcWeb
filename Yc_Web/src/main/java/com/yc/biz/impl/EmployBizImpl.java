package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Employ;
import com.yc.biz.EmployBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional(readOnly = true)
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
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void addEmploy(Employ employ) {
		this.baseDao.add(employ, "addEmploy");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateEmploy(Employ employ) {
		this.baseDao.update(employ, "updateEmploy");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void deleteEmploy(Employ employ) {
		this.baseDao.update(employ, "deleteEmploy");
	}

	@Override
	public int findCount(Employ employ) {
		int count=(int) this.baseDao.fundFunc(employ, "findCount");
		return count;
	}

}
