package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Projects;
import com.yc.bean.Technology;
import com.yc.biz.TechnologyBiz;
import com.yc.dao.BaseDao;
@Service
@Transactional(readOnly=true)
public class TechnologyBizImpl implements TechnologyBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Technology> findall() {
		Technology technology=new Technology();
		List<Technology>list=this.baseDao.findAll(technology, "selectTechnology");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void add(Technology technology) {
		this.baseDao.add(technology, "insertTechnology");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delete(Technology technology) {
		this.baseDao.delete(technology, "deleteTechnology");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void update(Technology technology) {
		this.baseDao.update(technology, "updateTechnology");
	}
	
	
}
