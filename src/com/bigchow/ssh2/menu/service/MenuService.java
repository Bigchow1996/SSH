package com.bigchow.ssh2.menu.service;

import java.util.List;

import com.bigchow.ssh2.menu.pageModel.MenuModel;

public interface MenuService {

	List<MenuModel> getTree(String id);

}
