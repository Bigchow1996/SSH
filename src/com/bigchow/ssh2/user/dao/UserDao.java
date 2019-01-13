package com.bigchow.ssh2.user.dao;

import com.bigchow.ssh2.base.baseClass.dao.BaseDao;
import com.bigchow.ssh2.user.vo.User;
/*
 * BaseDao在这里的作用是：
 * 一个项目可能要有好多Dao接口，每个接口无非是增删改查，
 * 所以将这些方法提取出来都放在一个公共接口中，让其他接口只需要继承这个公共接口就可以了，
 * 让代码变少了
 */
public interface UserDao  extends BaseDao<User>{
	//当前模块自定义的一些复杂查询
}
