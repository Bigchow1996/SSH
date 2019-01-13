package com.bigchow.ssh2.base.baseClass.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
//使用阿里的fastjson
//把对象转换成json并发送到前台
public class BaseAction {
	public void writeJson(Object object){
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			//把json对象转化为真正的json字符串
			ServletActionContext.getResponse().getWriter().write(JSON.toJSONString(object));
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
