package com.yc.biz;

import java.util.List;

import com.yc.bean.Activities;

public interface ActivitiesBiz {
			//查询全部公司活动
			public List<Activities> findall();
			//添加公司活动
			public void add(Activities  activities) ;
			//删除公司活动
			public void delete(Activities activities);
			//修改公司活动
			public void update(Activities activities);
}
