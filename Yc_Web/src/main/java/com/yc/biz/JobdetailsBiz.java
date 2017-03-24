package com.yc.biz;

import java.util.List;

import com.yc.bean.Jobdetails;

public interface JobdetailsBiz {
			//查询学员就业
			public List<Jobdetails> findall(Jobdetails jobdetails);
			//添加
			public void add(Jobdetails jobdetails) ;
			//删除学生就业
			public void delete(Jobdetails jobdetails);
			//修改学生就业
			public void update(Jobdetails jobdetails);
			//查找记录条数
			public int findCount(Jobdetails jobdetails);
}
