package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Activities;
import com.yc.bean.Projects;
import com.yc.biz.ActivitiesBiz;
import com.yc.dao.BaseDao;
@Service
@Transactional(readOnly=true)
public class ActivitiesBizImpl implements ActivitiesBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Activities> findall(Activities activities) {
		List<Activities>list=this.baseDao.findAll(activities, "selectActivities");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void add(Activities activities) {
		this.baseDao.add(activities, "insertActivities");

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delete(Activities activities) {
		this.baseDao.delete(activities, "deleteActivities");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void update(Activities activities) {
		this.baseDao.update(activities, "updateActivities");

	}
	@Override
	public int findCount(Activities activities) {
		int count=(int) this.baseDao.fundFunc(activities, "countActivities");
		return count;
	}

	
}
