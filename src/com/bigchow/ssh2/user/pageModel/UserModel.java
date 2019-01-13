package com.bigchow.ssh2.user.pageModel;

import java.util.Date;
//UserModel用于页面的展示，这样可以不用真正去操作实体类
public class UserModel {
	private String id;
	private String name;
	private String pwd;
	private Date createTime;
	private Date modifyTime;
	private int page;//用于接收easyUI发送过来的page参数
	private int rows;//用于接收easyUI发送过来的rows参数
	private String sort;
	private String order;
	private String ids;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", name=" + name + ", pwd=" + pwd + ", createTime=" + createTime
				+ ", modifyTime=" + modifyTime + ", page=" + page + ", rows=" + rows + ", sort=" + sort + ", order="
				+ order + ", ids=" + ids + "]";
	}
}
