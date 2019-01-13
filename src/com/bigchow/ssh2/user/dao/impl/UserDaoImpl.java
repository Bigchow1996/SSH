package com.bigchow.ssh2.user.dao.impl;
import org.springframework.stereotype.Repository;

import com.bigchow.ssh2.base.baseClass.dao.impl.BaseDaoImpl;
import com.bigchow.ssh2.user.dao.UserDao;
import com.bigchow.ssh2.user.vo.User;
/*
 * 这里继承BaseDaoImpl与UserDao的原理一样
 * 接口继承接口
 * 实现类继承实现类
 */
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{}
