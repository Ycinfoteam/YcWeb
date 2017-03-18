package com.yc.biz;

import java.util.List;

import com.yc.bean.Aboutyc;

public interface AboutycBiz {
	//查询全部
	public List<Aboutyc> findall();
	//根据条件查看
	public List<Aboutyc> findby(Aboutyc aboutyc);
	//添加关于公司
	public void add(Aboutyc aboutyc) ;
	//删除关于公司
	public void delete(Aboutyc aboutyc);
	//修改关于公司
	public void update(Aboutyc aboutyc);
}
