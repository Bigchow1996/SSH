package com.bigchow.ssh2.menu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigchow.ssh2.menu.dao.MenuDao;
import com.bigchow.ssh2.menu.pageModel.MenuModel;
import com.bigchow.ssh2.menu.service.MenuService;
import com.bigchow.ssh2.menu.vo.Menu;

@Service("menuService")
@Transactional
public class MenuServiceImpl implements MenuService {
    private MenuDao menuDao;
    
	@Override
	public List<MenuModel> getTree(String id) {
		List<MenuModel> menuModelList = new ArrayList<>();
		String hql = "";
		if(id == null){
			/*
			 * 获取首页
			 * m.menu相当于pid
			 * 当pid等于null的时候就说明是首页了
			 */
			hql = "from Menu as m where m.menu = null";
		}else{
			//m.menu.id = id 时表示选出所有当前id下的子元素
			hql = "from Menu as m where m.menu.id = '"+id+"'";
		}
		List<Menu> menuList = menuDao.get(hql);
		if(menuList != null && menuList.size() > 0){
			for (Menu menu : menuList) {
				MenuModel menuModel = new MenuModel();
				BeanUtils.copyProperties(menu, menuModel);
				Map<String, Object> attribute = new HashMap<>();
				attribute.put("url", menu.getUrl());
				menuModel.setAttributes(attribute);
				//当menu下还有其他菜单的时候，我们可以设置state=open
				if(menu.getMenus() != null && !menu.getMenus().isEmpty()){
					menuModel.setState("closed");// 当设置为 'closed' 时，该节点有子节点
				}else{
					menuModel.setState("open");
				}
				menuModelList.add(menuModel);
			}
		}
		return menuModelList;
	}
	
	@Autowired
	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
}
