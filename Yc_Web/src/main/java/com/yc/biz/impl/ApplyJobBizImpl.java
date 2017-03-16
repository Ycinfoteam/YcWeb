package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.ApplyJob;
import com.yc.biz.ApplyJobBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional(readOnly = true)
public class ApplyJobBizImpl implements ApplyJobBiz {

	private BaseDao baseDao;

	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<ApplyJob> findApply(ApplyJob applyJob) {
		List<ApplyJob> list=this.baseDao.findAll(applyJob, "findApply");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void addApply(ApplyJob applyJob) {
		this.baseDao.add(applyJob, "addApply");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void updateApply(ApplyJob applyJob) {
		this.baseDao.update(applyJob, "updateApply");
	}

	@Override
	public int findCount(ApplyJob applyJob) {
		int count=(int) this.baseDao.fundFunc(applyJob, "findCount");
		return count;
	}

	@Override
	public int judgeStart(Integer page, Integer rows) {
		if(page!=null && page!=null){
			int start=(page-1)*rows;
			return start;
		}
		return 0;
	}

	@Override
	public int judgeOffset(Integer rows) {
		if(rows!=null){
			int offset=rows;
			return offset;
		}
		return 2;
	}

}
