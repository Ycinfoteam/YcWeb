package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Aboutyc;
import com.yc.biz.AboutycBiz;
import com.yc.dao.BaseDao;
@Service
@Transactional(readOnly=true)
public class AboutycBizImpl implements  AboutycBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Aboutyc> findall() {
		Aboutyc aboutyc=new Aboutyc();
		List<Aboutyc>list=this.baseDao.findAll(aboutyc, "selectAboutyc");
		return list;
	}
	

	@Override
	public List<Aboutyc> findby(Aboutyc aboutyc) {
		List<Aboutyc>list=this.baseDao.findAll(aboutyc, "selectAboutyc");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void add(Aboutyc aboutyc) {
		this.baseDao.add(aboutyc, "insertAboutyc");
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delete(Aboutyc aboutyc) {
		this.baseDao.delete(aboutyc, "deleteAboutyc");
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void update(Aboutyc aboutyc) {
		this.baseDao.update(aboutyc, "updateAboutyc");
	}

}
