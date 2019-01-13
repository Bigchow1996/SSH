package com.bigchow.ssh2.menu.pageModel;

import java.util.Map;
//pageModel用于前台页面展示，可以随意更改
public class MenuModel {
	private String id;
	private String text;
	private String iconCls;
	private Map attributes;//绑定到节点的自定义属性，这里用于绑定url，用于生成选项卡
	private String state;//节点状态，'open' 或 'closed'

	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Map getAttributes() {
		return attributes;
	}
	public void setAttributes(Map attributes) {
		this.attributes = attributes;
	}
}
