package com.bigchow.ssh2.base.baseClass.dao;

import java.io.Serializable;
import java.util.List;
//这里的接口要使用泛型
public interface BaseDao<T> {
	//存储数据
	void save(T o);
	//获取数据(使用params好处就是可以，带参数也可以不带参数，方便后期业务的扩展)
	List<T> get(String hql, Object...params);
	//用于分页展示数据
	List<T> findPage(String hql , int page , int size);
	//用于计算数据总数
	Long count(String hql , Object...params);
	//通过非sql获取数据
	T get(Class<T> clazz, Serializable id);
	//删除数据
	void delete(T o);
}
