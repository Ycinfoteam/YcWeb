package com.yc.biz;

import java.util.List;

import com.yc.bean.History;
import com.yc.bean.JobType;

public interface HistoryBiz {
	//查询全部
		public List<History> findall(History history);
		//添加公司历史
		public void add(History history) ;
		//删除公司历史
		public void delete(History history);
		//修改公司历史
		public void update(History history);
		//查询总数
		public int findCount(History history);
		
}
