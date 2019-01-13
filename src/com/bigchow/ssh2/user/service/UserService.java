package com.bigchow.ssh2.user.service;

import com.bigchow.ssh2.user.pageModel.Dategrid;
import com.bigchow.ssh2.user.pageModel.UserModel;
import com.bigchow.ssh2.user.vo.User;

public interface UserService {

	void saveUser(UserModel userModel) throws Exception;
	
	User getUser(UserModel userModel);

	Dategrid datagrid(UserModel userModel);

	boolean checkOnlyName(UserModel userModel);

	void deleteUser(String ids);
	
}
