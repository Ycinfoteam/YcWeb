package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.JobType;
import com.yc.biz.JobTypeBiz;
import com.yc.dao.BaseDao;

@Service
public class JobTypeBizImpl implements JobTypeBiz {
	
	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<JobType> findJobType(JobType jobType) {
		List<JobType> list=this.baseDao.findAll(jobType, "findJobType");
		return list;
	}

	@Override
	public void addJobType(JobType jobType) {
		this.baseDao.add(jobType, "addJobType"); 
	}

	@Override
	public void deleteJobType(JobType jobType) {
		this.baseDao.delete(jobType, "deleteJobType");
	}

	@Override
	public int findCount(JobType jobType) {
		int count=(int) this.baseDao.fundFunc(jobType, "findCount");
		return count;
	}

}
