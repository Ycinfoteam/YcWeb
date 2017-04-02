package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.yc.bean.Projects;
import com.yc.biz.ProjectsBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional(readOnly=true)
public class ProjectsBizImpl implements ProjectsBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<Projects> findall(Projects projects) {
		List<Projects>list=this.baseDao.findAll(projects, "selectProjects");
		return list;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void add(Projects projects) {
		this.baseDao.add(projects, "insertProjects");
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void delete(Projects projects) {
		this.baseDao.delete(projects, "deleteProjects");
	}
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void update(Projects projects) {
		this.baseDao.update(projects, "updateProjects");
	}
	@Override
	public int findCount(Projects projects) {
		int count=(int) this.baseDao.fundFunc(projects, "countProjects");
		return count;
	}

	
}
