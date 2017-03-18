package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Coursys;
import com.yc.biz.CoursysBiz;
import com.yc.dao.BaseDao;
@Service
public class CoursysBizImpl implements CoursysBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Coursys> selectAllCoursys() {
		Coursys csys=new Coursys();
		List<Coursys> coursysList=this.baseDao.findAll(csys, "selectCoursys");
		return coursysList;
	}

	@Override
	public List<Coursys> selectCoursysById(int cs_id) {
		Coursys csys=new Coursys();
		csys.setCs_id(cs_id);
		List<Coursys> csysList=this.baseDao.findAll(csys, "selectCoursys");
		return csysList;
	}

	@Override
	public void deleteCoursysById(int cs_id) {
		Coursys csys=new Coursys();
		csys.setCs_id(cs_id);
		this.baseDao.delete(csys, "deleteCoursys");
	}

	@Override
	public void addCoursys(Coursys csys) {
		this.baseDao.add(csys, "addOneCoursys");
	}

	@Override
	public void updateCoursys(Coursys csys) {
		this.baseDao.update(csys, "updateOneCoursys");
	}
	@Override
	public boolean judge(String type,Coursys csys) {
		if(type.equalsIgnoreCase("add")){
			List<Coursys> csyslist=this.baseDao.findAll(csys, "judge");
			if(csyslist!=null){
				return true;
			}
			return false;
		}else if(type.equalsIgnoreCase("delete")){
			List<Coursys> csyslist=this.baseDao.findAll(csys, "judge");
			if(csyslist!=null){
				return false;
			}
			return true;
		}else if(type.equalsIgnoreCase("update")){
			
			return false;
		}
		return false;
	}

}
