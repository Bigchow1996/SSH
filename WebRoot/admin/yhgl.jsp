<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
	$(function() {
		$('#admin_yhgl_datagrid').datagrid({
		    url:'${ctx}/user/datagrid.action',//数据获取路径
		    fit:true,//随着父窗口的变化而变化
		    border:false,//选项卡下划线去掉
		    pagination:true,//在底部显示一个分页工具栏
		    idField:'id',//指示哪个字段是标识字段，跨页选择时有用
		    pageSize:5,//默认每页显示5条数据
		    pageList:[5,10,20,30,40,50],//每页显示多少数据
		    rownumbers:true,//显示行号
		    checkOnSelect:true,//点击复选框选中当前行，必须添加复选框
		    selectOnCheck:true,//点击当前行选中复选框，必须添加复选框
		    sortName:'name',//具有排序功能的列(刚查出来的时候)
		    sortOrder:'asc',//排序(刚查出来的时候)
		    columns:[[
		    	//checkbox添加复选框，easyUI会自动按照ids发送
		    	{field:'_checkbox',checkbox:true,hidden:false,align:'center'},
				{field:'id',title:'编号',width:200,align:'center'},
				//sortable允许该列排序，easyUI会发送sort和order
				{field:'name',title:'姓名',width:100,sortable:true,align:'center'},
				{field:'pwd',title:'密码',width:200,align:'center'},
				{field:'createTime',title:'创建时间',width:200,align:'center'},
				{field:'modifyTime',title:'修改时间',width:200,align:'center'},
				{field:'options',title:'操作',width:200,align:'center',formatter:function(value,rec,index){  
                        var e = '<a href="#"  onclick="edit(\''+ rec.id+'\',\''+ rec.name + '\')">编辑</a> ';  
                        var d = '<a href="#"  onclick="del(\''+ rec.id +'\')">删除</a> ';  
                        return e+d;  
                    }  
                }
		    ]],
		    toolbar: '#admin_yhgl_toolbar'
		});
	});
	//编辑
	function edit(id,name){
		$('#admin_yhgl_editDialog').dialog('open');
		$('#admin_yhgl_editForm td[name=name]').html(name);
	}
	//查询
	function searchFun(){
		//重新加载数据，并且发送请求带有name参数
		$('#admin_yhgl_datagrid').datagrid('load',{
			name: $('#admin_yhgl_toolbar input[name=name]').val()
		});
	}
	//清空查询结果
	function clearFun() {
		$('#admin_yhgl_toolbar input[name=name]').val('');
		//重新加载数据，不带任何参数
		$('#admin_yhgl_datagrid').datagrid('load',{});
	}
	//添加
	function addFun(){
		$('#admin_yhgl_addForm input').val('');
		$('#admin_yhgl_addDialog').dialog('open');
	}
	//删除
	function deleteFun() {
		var rows = $('#admin_yhgl_datagrid').datagrid('getSelections');//这里不能用getchecked因为getchecked只能获取一页的选中数据
		
		if(rows.length > 0) {
			var ids = [];
			for(var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			
			$.ajax({
				url:'${ctx}/user/delete.action',
				data: {
					ids: ids.join(",")
				},
				dataType:'json',
				success:function(data) {
					if(data.success) {
						//重新加载数据
						$('#admin_yhgl_datagrid').datagrid('load');
					}
					$.messager.show({
						title: '提示',
						msg: data.msg
					});
				}
			});
		}else {
			$.messager.show({
				title: '提示',
				msg: '请勾选要删除的记录'
			});
		}
	}
</script>
<!-- 显示数据区域 -->
<table id="admin_yhgl_datagrid"></table>
<!-- 操作按钮区域 -->
<div id="admin_yhgl_toolbar">
	<a href="#" class="easyui-linkbutton" style="float: left;" data-options="iconCls:'icon-add',plain:true" onclick="addFun()">新增</a>
	<div class="datagrid-btn-separator" style="float: left;"></div><!-- 分割线 -->
	<a href="#" class="easyui-linkbutton" style="float: left;" data-options="iconCls:'icon-remove',plain:true" onclick="deleteFun()">删除</a>
	<div class="datagrid-btn-separator" style="float: left;"></div><!-- 分割线 -->
	<a href="#" class="easyui-linkbutton" style="float: left;" data-options="iconCls:'icon-redo',plain:true" onclick="clearFun()">复位</a>
	<div class="datagrid-btn-separator" style="float: left;"></div><!-- 分割线 -->
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchFun()">查询</a>
	<input  name="name" >
</div>
<!-- 添加用户面板默认是closed=true -->
<div id="admin_yhgl_addDialog" class="easyui-dialog" style="width:230px;height:150px"  data-options="title:'添加',iconCls:'icon-add',modal:true,closable:true,closed:true,
	    buttons:[{
			text:'添加',
			iconCls:'icon-add',
			handler:function(){
				$('#admin_yhgl_addForm').form('submit',{
					url:'${ctx }/user/add.action',
					success:function(data){
						var obj = $.parseJSON(data);
						if(obj.success) {
							$('#admin_yhgl_addDialog').dialog('close');
							$('#admin_yhgl_datagrid').datagrid('reload',{});
						}
						$.messager.show({
							title: '提示',
							msg: obj.msg
						});
					}
				});
			}
		}]">
    <form id="admin_yhgl_addForm" method="post">
    	<table>
    		<tr>
    			<th>用户名</th>
    			<td><input name="name" class="easyui-validatebox" data-options="required:true,missingMessage:'用户名不能为空',validType:'checkOnlyName[\'${ctx}/user/checkonly.action\']'"/></td>
    		</tr>
    		<tr>
    			<th>密码</th>
    			<td><input type="password" name="pwd" class="easyui-validatebox" data-options="required:true,missingMessage:'密码不能为空'"/></td>
    		</tr>
    		<tr>
    			<th>重复密码</th>
    			<td><input type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'重复密码不能为空',validType:'eqPwd[$(\'#admin_yhgl_addForm input[name=pwd]\').val()]'"/></td>
    		</tr>
    	</table>
    </form>
</div>
<!-- 编辑用户面板默认是closed=true -->
<div id="admin_yhgl_editDialog" class="easyui-dialog" style="width:230px;height:150px"  data-options="title:'修改',iconCls:'icon-add',modal:true,closable:true,closed:true,
	    buttons:[{
			text:'修改',
			iconCls:'icon-add',
			handler:function(){
				$('#admin_yhgl_addForm').form('submit',{
					url:'${ctx }/user/edit.action',
					success:function(data){
						var obj = $.parseJSON(data);
						if(obj.success) {
							$('#admin_yhgl_addDialog').dialog('close');
							$('#admin_yhgl_datagrid').datagrid('reload',{});
						}
						$.messager.show({
							title: '提示',
							msg: obj.msg
						});
					}
				});
			}
		}]">
    <form id="admin_yhgl_editForm" method="post">
    	<table>
    		<tr>
    			<th>用户名</th>
    			<td name="name"></td>
    		</tr>
    		<tr>
    			<th>新密码</th>
    			<td><input type="text" name="pwd" class="easyui-validatebox" data-options="required:true,missingMessage:'密码不能为空'"/></td>
    		</tr>
    		<tr>
    			<th>重复新密码</th>
    			<td><input type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'重复密码不能为空',validType:'eqPwd[$(\'#admin_yhgl_addForm input[name=pwd]\').val()]'"/></td>
    		</tr>
    	</table>
    </form>
</div>
