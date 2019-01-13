<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript">
	$(function() {
		//给user_reg_regDialog设置成dialog
		$("#user_reg_regDialog").dialog({
			title: '注册',
		    closable: true,//closable表示可以关闭
		    closed: true, //closed表示默认是关闭的（不显示的）
		    modal: true,//表示背景不可以直接操作 
		    buttons:[{//设置一个按钮
				text:'注册',
				iconCls:'icon-add',
				handler:function(){
					$("#user_reg_regForm").submit();
				}	
			}]
		});
		
		// 初始化为easyui的from 可以拦截验证表单数据，注意只是初始化表单，而不是提交表单，提交的话需要使用submit
		$('#user_reg_regForm').form({
		    url:"${ctx}/user/register.action",
		    success:function(data){
				var obj = $.parseJSON(data);//解析json格式的数据
				if(obj.success) {
					$("#user_reg_regDialog").dialog("close");
				}
				$.messager.show({
					title: '提示',
					msg: obj.msg
				});
		    }
		});
		//添加回车提交功能
		$('#user_reg_regForm input').bind("keyup",function(event){
			if("13" == event.keyCode){
				$("#user_reg_regForm").submit();
			}
		});
	});
</script>
<div id="user_reg_regDialog" style="width: 252px;height: 160px">
    <form id="user_reg_regForm" method="post">
    	<table>
    		<tr>
    			<th>用户名</th>
    			<!-- 
    				设置class=easyui-validatebox 可以开启验证功能
   					 data-options添加验证规则 
    				使用系统自带的验证规则
    				required:true,missingMessage:'重复密码不能为空'
    				引用自定义验证规则 
    				validType:'eqPwd[$(\'#user_reg_regForm input[name=pwd]\').val()]'"
    				中间要输入参数param
    				这里要使用转义斜杠，因为外层已经有了单引号
    			-->
    			<td><input name="name" class="easyui-validatebox" data-options="required:true,missingMessage:'用户名不能为空',validType:'checkOnlyName[\'${ctx}/user/checkonly.action\']'"/></td>
    		</tr>
    		<tr>
    			<th>密码</th>
    			<td><input type="password" name="pwd" class="easyui-validatebox" data-options="required:true,missingMessage:'密码不能为空'"/></td>
    		</tr>
    		<tr>
    			<th>重复密码</th>
    			<!-- 
    				设置class=easyui-validatebox 可以开启验证功能
   					 data-options添加验证规则 
    				使用系统自带的验证规则
    				required:true,missingMessage:'重复密码不能为空'
    				引用自定义验证规则 
    				validType:'eqPwd[$(\'#user_reg_regForm input[name=pwd]\').val()]'"
    				中间要输入参数param
    				这里要使用转义斜杠，因为外层已经有了单引号
    			-->
    			<td><input type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'重复密码不能为空',validType:'eqPwd[$(\'#user_reg_regForm input[name=pwd]\').val()]'"/></td>
    		</tr>
    	</table>
    </form>
</div>
