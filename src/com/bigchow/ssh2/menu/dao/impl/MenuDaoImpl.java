package com.bigchow.ssh2.menu.dao.impl;

import org.springframework.stereotype.Repository;

import com.bigchow.ssh2.base.baseClass.dao.impl.BaseDaoImpl;
import com.bigchow.ssh2.menu.dao.MenuDao;
import com.bigchow.ssh2.menu.vo.Menu;

@Repository("menuDao")
public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao{}
