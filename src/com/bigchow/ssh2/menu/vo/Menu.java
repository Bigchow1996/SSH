package com.bigchow.ssh2.menu.vo;

import java.util.HashSet;
import java.util.Set;

//import javax.persistence.CascadeType;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.OneToMany;

//@Entity
public class Menu {
	/*
	 * Menu的属性名称要符号easyUI取名规范，否则不会展示出树形菜单
	 * easyUI将Menu实体属性转化为HTML标签用于 页面的展示
	 */
	private String id;
	private Menu menu;
	private String text;
	private String iconCls;
	private String url;//url用于生成选项卡
	private Set<Menu> menus = new HashSet<>();
	
//	@Id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "pid")
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "menu")
	public Set<Menu> getMenus() {
		return menus;
	}
	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}
}