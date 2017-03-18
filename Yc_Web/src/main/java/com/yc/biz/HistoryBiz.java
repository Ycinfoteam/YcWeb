package com.yc.biz;

import java.util.List;

import com.yc.bean.History;

public interface HistoryBiz {
	//查询全部
		public List<History> findall();
		//根据条件查看
		public List<History> findby(History history);
		//添加公司历史
		public void add(History history) ;
		//删除公司历史
		public void delete(History history);
		//修改公司历史
		public void update(History history);
}
