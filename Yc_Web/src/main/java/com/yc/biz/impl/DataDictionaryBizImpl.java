package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.DataDictionary;
import com.yc.biz.DataDictionaryBiz;
import com.yc.dao.BaseDao;

@Service
public class DataDictionaryBizImpl implements DataDictionaryBiz {

	private BaseDao baseDao;
	
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<DataDictionary> findDataDictionary(DataDictionary dataDictionary) {
		List<DataDictionary> list=this.baseDao.findAll(dataDictionary, "findDataDictionary");
		return list;
	}

	@Override
	public void updateFooter(DataDictionary dataDictionary) {
		this.baseDao.update(dataDictionary, "updateFooter");
	}

	@Override
	public void updateDescription(DataDictionary dataDictionary) {
		this.baseDao.update(dataDictionary, "updateDescription");
	}

	@Override
	public void updateLogo(DataDictionary dataDictionary) {
		this.baseDao.update(dataDictionary, "updateLogo");
	}

	
}
