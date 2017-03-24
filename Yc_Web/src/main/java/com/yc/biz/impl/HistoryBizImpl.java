package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Aboutyc;
import com.yc.bean.History;
import com.yc.bean.JobType;
import com.yc.biz.HistoryBiz;
import com.yc.dao.BaseDao;
@Service
@Transactional(readOnly=true)
public class HistoryBizImpl implements HistoryBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<History> findall(History history) {
		List<History>list=this.baseDao.findAll(history, "selectHistory");
		return list;
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void add(History history) {
		this.baseDao.add(history, "insertHistory");

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delete(History history) {
		this.baseDao.delete(history, "deleteHistory");

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void update(History history) {
		this.baseDao.update(history, "updateHistory");
	}
	@Override
	public int findCount(History history) {
		int count=(int) this.baseDao.fundFunc(history, "countHistory");
		return count;
	}
	

}
