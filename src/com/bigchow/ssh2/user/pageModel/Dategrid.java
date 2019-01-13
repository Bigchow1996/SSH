package com.bigchow.ssh2.user.pageModel;

import java.util.ArrayList;
import java.util.List;
//用于分页列表数据的展示
public class Dategrid {
	private Long total = 0L;//存储总行数，发送给easyUI
	private List rows = new ArrayList();//存储所有用户
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
}
