package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.OpenClass;
import com.yc.biz.OpenClassBiz;
import com.yc.dao.BaseDao;
@Service
public class OpenClassBizImpl implements OpenClassBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<OpenClass> selectAllOpenClass(OpenClass openCls) {
		List<OpenClass> openClsList=this.baseDao.findAll(openCls, "selectOpenCls");
		return openClsList;
	}

	@Override
	public int selectCountAll() {
		OpenClass openCls=new OpenClass();
		int total=(int) this.baseDao.fundFunc(openCls, "findtotal");
		return total;
	}

	@Override
	public void deleteOpenClass(OpenClass openCls) {
		this.baseDao.delete(openCls, "deleteOpenCls");
	}

	@Override
	public void updateOpenClass(OpenClass openCls) {
		this.baseDao.delete(openCls, "updateOpenCls");
	}
	@Override
	public void addOpenClass(OpenClass openCls) {
		this.baseDao.add(openCls, "insertOpenCls");
	}

}
