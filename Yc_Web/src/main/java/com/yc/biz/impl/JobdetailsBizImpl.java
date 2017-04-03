package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Jobdetails;
import com.yc.bean.Projects;
import com.yc.biz.JobdetailsBiz;
import com.yc.dao.BaseDao;
@Service
@Transactional(readOnly=true)
public class JobdetailsBizImpl implements JobdetailsBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Jobdetails> findall(Jobdetails jobdetails) {
		List<Jobdetails>list=this.baseDao.findAll(jobdetails, "selectJobdetails");
		System.out.println("nali"+list);
		return list;
	}
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void add(Jobdetails jobdetails) {
		this.baseDao.add(jobdetails, "insertJobdetails");

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delete(Jobdetails jobdetails) {
		this.baseDao.delete(jobdetails, "deleteJobdetails");

	}
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void update(Jobdetails jobdetails) {
		this.baseDao.update(jobdetails, "updateJobdetails");

	}
	@Override
	public int findCount(Jobdetails jobdetails) {
		int count=(int) this.baseDao.fundFunc(jobdetails, "countJobdetails");
		return count;

	}

}
