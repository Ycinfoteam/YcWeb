package com.yc.biz;

import java.util.List;

import com.yc.bean.JobType;

public interface JobTypeBiz {

	//查询方向类信息
	public List<JobType> findJobType(JobType jobType);
	
	//插入方向类信息
	public void addJobType(JobType jobType);
	
	//删除方向类信息
	public void deleteJobType(JobType jobType);
	
	//记录总条数
	public int findCount(JobType jobType);
}
