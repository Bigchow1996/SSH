<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 获取项目名 -->
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript">
	$(function(){
		//初始化为easyui的from,注意这里不是提交form,提交的话需要使用submit()
		$('#user_login_loginForm').form({
		    url:"${ctx}/user/login.action",
		    success:function(data){
				var obj = $.parseJSON(data);
				//登录成功后关闭登录页面
				if(obj.success) {
					$("#user_login_loginDialog").dialog("close");
				}
				//提示登录成功或者失败的消息
				$.messager.show({
					title: '提示',
					msg: obj.msg
				});
		    }
		});
		//获取光标,打开页面的时候自动将光标定位到输入框上
		window.setTimeout(function() {
			$("#user_login_loginForm input[id=name]").focus();
		}, 0);
		//回车登录功能
		$('#user_login_loginForm input').bind("keyup",function(event){
			if("13" == event.keyCode){
				$("#user_login_loginForm").submit();
			}
		});
	})
</script>
<!--
	title表示div框的名字
	iconCls显示图标
 	modal=true表示背景不可以直接操作 
	closable:false表示div不可以关闭
	buttons:设置两个按钮
		handler:点击按钮后的执行函数
		且打开注册框之前，清空注册框里的内容
-->
<div id="user_login_loginDialog" class="easyui-dialog"
    data-options="title:'登陆',iconCls:'icon-save',modal:true,closable: false,
	    buttons:[{
			text:'注册',
			iconCls:'icon-add',
			handler:function(){
				$('#user_reg_regForm input').val('');
				$('#user_reg_regDialog').dialog('open');
			}
		},{
			text:'登陆',
			iconCls:'icon-ok',
			handler:function(){
				$('#user_login_loginForm').submit();
			}
		}]">
	<form id="user_login_loginForm" method="post">
    	<table>
    		<!-- 
   				设置class=easyui-validatebox 可以开启验证功能
  					 data-options添加验证规则 
   				使用系统自带的验证规则
   				required:true,missingMessage:'重复密码不能为空'
   			-->
    		<tr>
    			<th>用户名</th>
    			<td><input id="name" name="name" class="easyui-validatebox" data-options="required:true,missingMessage:'用户名不能为空'"/></td>
    		</tr>
    		<!-- 
   				设置class=easyui-validatebox 可以开启验证功能
  					 data-options添加验证规则 
   				使用系统自带的验证规则
   				required:true,missingMessage:'重复密码不能为空'
   			-->
    		<tr>
    			<th>密码</th>
    			<td><input type="password" name="pwd" class="easyui-validatebox" data-options="required:true,missingMessage:'密码不能为空'"/></td>
    		</tr>
    	</table>
    </form>
</div>