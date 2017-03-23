package com.yc.biz;

import java.util.List;

import com.yc.bean.Activities;
import com.yc.bean.Projects;

public interface ActivitiesBiz {
			//查询全部公司活动
			public List<Activities> findall(Activities  activities);
			//添加公司活动
			public void add(Activities  activities) ;
			//删除公司活动
			public void delete(Activities activities);
			//修改公司活动
			public void update(Activities activities);
			//查询总数
			public int findCount(Activities activities);
}
