package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.News;
import com.yc.biz.NewsBiz;
import com.yc.dao.BaseDao;
@Service
public class NewsBizImpl implements NewsBiz {
	private BaseDao baseDao;
	@Resource(name="baseDaoMybatisImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public List<News> selectAllNews() {
		News news=new News();
		List<News> newsList=this.baseDao.findAll(news, "selectAll");
		return newsList;
	}
	@Override
	public void deleteNewsById(int n_id) {
		News news=new News();
		news.setN_id(n_id);
		this.baseDao.delete(news, "deleteOneNew");
	}
	@Override
	public void addNews(News news) {
		this.baseDao.add(news, "addOneNew");
	}
	@Override
	public void updateNews(News news) {
		this.baseDao.update(news, "updateOneNew");
	}
	@Override
	public List<News> selectNewsById(News news) {
		List<News> newsList=this.baseDao.findAll(news, "selectByNid");
		return newsList;
	}
}
