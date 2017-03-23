package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;
import com.yc.dao.BaseDao;

@Service
public class AdminBizImpl implements AdminBiz {
	
	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Admin> findAdmin(Admin admin) {
		List<Admin> list =this.baseDao.findAll(admin, "findAdmin");
		return list;
	}

	@Override
	public void addAdmin(Admin admin) {
		this.baseDao.add(admin, "addAdmin");
	}

	@Override
	public void updateAdmin(Admin admin) {
		this.baseDao.update(admin, "updateAdmin");
	}

	@Override
	public void deleteAdmin(Admin admin) {
		this.baseDao.delete(admin, "deleteAdmin"); 
	}

	@Override
	public int findCount(Admin admin) {
		int count=(int) this.baseDao.fundFunc(admin, "findCount");
		return count;
	}

}
