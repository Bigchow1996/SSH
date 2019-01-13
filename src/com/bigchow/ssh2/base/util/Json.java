package com.bigchow.ssh2.base.util;

import java.io.Serializable;
//该对象是用来存储转变为JSON之前的各种响应数据的
public class Json implements Serializable{
	private boolean success = false;//告诉前台操作是否成功的信号量，默认false
	private String msg = "";//操作反馈给前台页面的信息 
	private Object object = null;//存储各种类型的对象，传给前台
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
}
 