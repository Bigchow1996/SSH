package com.bigchow.ssh2.user.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bigchow.ssh2.base.util.Encrypt;
import com.bigchow.ssh2.user.dao.UserDao;
import com.bigchow.ssh2.user.pageModel.Dategrid;
import com.bigchow.ssh2.user.pageModel.UserModel;
import com.bigchow.ssh2.user.service.UserService;
import com.bigchow.ssh2.user.vo.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
	@Override
	public void saveUser(UserModel userModel) throws Exception {
		//这里使用User对象
		User u = new User();
		//把userModel中的数据copy到user中
		BeanUtils.copyProperties(userModel, u);
		u.setId(UUID.randomUUID().toString());
		u.setCreateTime(new Date());
		//这里使用加密工具类，把密码加密
		u.setPwd(Encrypt.e(userModel.getPwd()));
		userDao.save(u);
	}
	
	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public User getUser(UserModel userModel) {
		List<User> list = userDao.get("from User u where u.name=? and u.pwd=?",userModel.getName(),Encrypt.e(userModel.getPwd()));
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	/**
	 * 分页数据的展示
	 */
	@Override
	public Dategrid datagrid(UserModel userModel) {
		Dategrid dategrid = new Dategrid();
		String hql = " from User u ";
		//模糊查询
		if(userModel.getName() != null && !"".equals(userModel.getName().trim())){
			hql += " where u.name like '%" + userModel.getName().trim() + "%'";
		}
		//排序查询
		if(userModel.getSort() != null){
			hql +=" order by u."+userModel.getSort() + " " + userModel.getOrder();
		}
		//查询总条数(最后都要执行这一步)
		String totalHql = " select count(id) "+hql;
		dategrid.setTotal(userDao.count(totalHql));
		List<User> userList = userDao.findPage(hql, userModel.getPage(), userModel.getRows());
		if(userList != null && userList.size()>=0){
			dategrid.setRows(userList);
		}
		return dategrid;
	}
	//用户名是否已经存在
	@Override
	public boolean checkOnlyName(UserModel userModel) {
		List<User> list = userDao.get("from User u where u.name=?",userModel.getName());
		if(list != null && list.size()>0){
			return true;
		}
		return false;
	}
	//删除User
	@Override
	public void deleteUser(String ids) {
		for(String id:ids.split(",")){
			//这里通过get(User.class,id)获取数据，可以不用写sql语句
			User u = (User) userDao.get(User.class,id);
			if(u != null){
				userDao.delete(u);
			}
		}
	}
}
