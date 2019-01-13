package com.bigchow.ssh2.base.baseClass.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.bigchow.ssh2.base.baseClass.dao.BaseDao;
@Repository("baseDao")
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>{
	@Autowired
	private void setSession(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	//存储数据
	@Override
	public void save(T o) {
		this.getHibernateTemplate().save(o);
	}
	//通过sql语句获取数据
	@Override
	public List<T> get(String hql, Object... params) {
		return (List<T>) this.getHibernateTemplate().find(hql,params);
	}
	//通过非sql语句获取数据
	@Override
	public T get(Class<T> clazz, Serializable id) {
		return this.getHibernateTemplate().get(clazz, id);
	}
	//用于分页展示数据
	@Override
	public List<T> findPage(String hql, int page, int rows) {
		Query query = this.getSessionFactory().openSession().createQuery(hql);
		query.setFirstResult((page-1)*rows);
		query.setMaxResults(rows);
		return (List<T>) query.list();
	}
	//用于计算数据总数
	@Override
	public Long count(String hql, Object... params) {
		return (Long) this.getHibernateTemplate().iterate(hql, params).next();
	}
	//删除数据
	@Override
	public void delete(T o) {
		this.getHibernateTemplate().delete(o);
	}
}
