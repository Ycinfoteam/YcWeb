package com.yc.biz;

import java.util.List;

import com.yc.bean.News;

public interface NewsBiz {
	//查询所有的新闻
	public List<News> selectAllNews();
	//根据新闻编号查询新闻
	public List<News> selectNewsById(News news);
	//删除新闻
	public void deleteNewsById(int cs_id);
	//添加新闻
	public void addNews(News news);
	//修改新闻
	public void updateNews(News news);
}
