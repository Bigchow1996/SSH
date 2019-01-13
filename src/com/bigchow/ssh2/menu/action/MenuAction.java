package com.bigchow.ssh2.menu.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bigchow.ssh2.base.baseClass.action.BaseAction;
import com.bigchow.ssh2.menu.service.MenuService;
import com.bigchow.ssh2.menu.vo.Menu;
import com.opensymphony.xwork2.ModelDriven;

@Controller("menuAction")
@Scope("prototype")
public class MenuAction extends BaseAction implements ModelDriven<Menu>{
	private MenuService menuService;
	private Menu menu = new Menu();//用于接收菜单标签的ID值，注意这里只能用模型驱动
	
	//获取树形菜单
	public String getTree(){
		super.writeJson(menuService.getTree(menu.getId()));
		return null;
	}
	@Autowired
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	@Override
	public Menu getModel() {
		return menu;
	}
}
