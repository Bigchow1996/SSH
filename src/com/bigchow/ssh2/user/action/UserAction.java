package com.bigchow.ssh2.user.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bigchow.ssh2.base.baseClass.action.BaseAction;
import com.bigchow.ssh2.base.util.Json;
import com.bigchow.ssh2.user.pageModel.UserModel;
import com.bigchow.ssh2.user.service.UserService;
import com.bigchow.ssh2.user.vo.User;
import com.opensymphony.xwork2.ModelDriven;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction implements ModelDriven<UserModel>{
	private UserService userService;
	/*
	 * UserModel用于存储用户信息，方便对用户进行各种操作
	 * UesrModel用于Action层，对User更细粒度的封装
	 * User用于Service层和Dao层是最原始的User
	 * 这样就可以保持最原始的User对象
	 */
	private UserModel userModel = new UserModel();
	
	//方法名起名方式：动词+名词
	public String registerUser(){
			Json json = new Json(); 	
			try {
				userService.saveUser(userModel);
				json.setSuccess(true);
				json.setMsg("注册成功！");
			} catch (Exception e) {
				e.printStackTrace();
				json.setMsg("注册失败！");
			}
			super.writeJson(json);
			//不需要视图跳转所以不需要有返回值
			return null;
	}
	//验证用户名是否已经存在
	public String checkOnlyName(){
		Json json = new Json();
		try {
			boolean flag = userService.checkOnlyName(userModel);
				json.setSuccess(flag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.writeJson(json);
		return null;
	}
	//登录功能
	public String loginUser(){
		Json json = new Json(); 
		try {
			User u = userService.getUser(userModel);
			if(u != null){
				json.setSuccess(true);
				json.setMsg("登录成功！");
			}else{
				json.setMsg("登录失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("登录失败！");
		}
		super.writeJson(json);
		return null;
	}
	//添加用户
	public String addUser(){
		Json json = new Json(); 	
		try {
			userService.saveUser(userModel);
			json.setSuccess(true);
			json.setMsg("添加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("添加失败！");
		}
		super.writeJson(json);
		return null;
	}
	//显示数据列表
	public String datagrid(){
		super.writeJson(userService.datagrid(userModel));
		return null;
	}
	//删除用户
	public String deleteUser(){
		Json json = new Json();
		try {
			userService.deleteUser(userModel.getIds());
			json.setSuccess(true);
			json.setMsg("删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("删除失败！");
		}
		super.writeJson(json);
		return null;
	}
	
	//在这里设置自动注入的好处是，如果在属性上设置会使userService的权限变成public
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//getter方法用于struts2给前台传输数据
	@Override
	public UserModel getModel() {
		return userModel;
	}
}
