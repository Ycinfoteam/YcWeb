package com.yc.biz;

import java.util.List;

import com.yc.bean.ApplyJob;

/**
 * 应聘申请业务层
 * @author S3
 *
 */
public interface ApplyJobBiz {

	//查询应聘申请
	public List<ApplyJob> findApply(ApplyJob applyJob);
	
	//插入应聘申请
	public void addApply(ApplyJob applyJob);
	
	//修改应聘信息审核状态
	public void updateApply(ApplyJob applyJob);
	
	//查询记录总数
	public int findCount(ApplyJob applyJob);
	
}
