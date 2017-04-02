package com.yc.biz;

import java.util.List;

import com.yc.bean.OpenClass;

public interface OpenClassBiz {
	public List<OpenClass> selectAllOpenClass(OpenClass openCls);
	public int selectCountAll();
	public void deleteOpenClass(OpenClass openCls);
	public void updateOpenClass(OpenClass openCls);
	public void addOpenClass(OpenClass openCls);
}
