package com.yc.dao;

import java.util.List;
import java.util.Map;


//這是dao层的接口
public interface BaseDao<T> {
	//sqlSession.add/update/delete/selectOne/selectList()
	public List<T> findAll(T t,Map map,String sqlId);
	public void add(T t,String sqlId);
	public void add(T t,Map map,String sqlId);
	public void addMany(T t,List list,String sqlId);
	public void delete(T t,String sqlId);
	public void delete(T t,Map map,String sqlId);
	//批量删
	public void deleteMany(T t,List list,String sqlId);
	public void update(T t,String sqlId);
	public void update(T t,Map map,String sqlId);//update xxx set sex=x where id in (1,2,3
	public void updateMany(T t,List list,String sqlId);
	//聚合
	public double fundFunc(T t,String sqlId);
	public double fundFunc(T t,Map map,String sqlId);
	public List<T> findAll(T t, String sqlId);

}