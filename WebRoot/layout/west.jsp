<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!-- fit=true 可以菜单适应父窗口 -->
<div  class="easyui-accordion" data-options="fit:true">
	<!-- 
		lines=true 是否显示树型线 
		selected=true 默认该菜单展开
		addTab调用自己写好的添加标签方法
		URL只需要填写url就可以获取菜单列，菜单列的属性就是实体类的属性，每次请求都是通过这个url获取菜单的
		onClick表示当前节点点击后的触发事件
	--> 
    <div title="系统菜单" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">
    	<ul class="easyui-tree" data-options="url:'${ctx}/menu/menu.action',lines:true,
    		onClick: function(node){
				if(node.attributes.url) {
					var url = '${ctx }' + node.attributes.url;
					addTab({
						title: node.text,
						href: url,
						closable: true
					});
				}
    	}"></ul>
    	<!-- 有url的话就打开/新增选项卡 -->
    </div>
    <div title="Title2" data-options="iconCls:'icon-reload'" style="padding:10px;">
		content2
    </div>
</div>