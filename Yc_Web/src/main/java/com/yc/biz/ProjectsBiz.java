package com.yc.biz;

import java.util.List;

import com.yc.bean.Projects;


public interface ProjectsBiz {
		//查询全部学生项目
		public List<Projects> findall(Projects projects);
		//添加学生项目
		public void add(Projects projects) ;
		//删除学生项目
		public void delete(Projects projects);
		//修改学生项目
		public void update(Projects projects);
		//查询总数
		public int findCount(Projects projects);
}
