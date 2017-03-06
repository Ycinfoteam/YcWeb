package com.yc.biz;

import java.util.List;

import com.yc.bean.Projects;
import com.yc.bean.Technology;

public interface TechnologyBiz {
	
	//查看技术支持
	public List<Technology> findall();
	//添加技术支持
	public void add(Technology technology);
	//删除技术支持
	public void delete(Technology technology);
	//修改技术支持
	public void update(Technology technology);
}
