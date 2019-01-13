<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
	function addTab(opts){
		var t = $("#layout_center_centerTabs");
		if(t.tabs("exists", opts.title)){//表示在当前选项卡列表中是否存在名字为title的选项卡
			t.tabs("select", opts.title);//存在的话就选中
		}else{
			t.tabs("add", opts);//不存在的话就新建，根据opts中的title,url,closable在center中新建选项卡
		}
	}
</script>
<!-- fit=true使用父级菜单的大小 -->
<div id="layout_center_centerTabs" class="easyui-tabs" data-options="fit:true">
    <div title="首页">
		ssh2
    </div>
</div>
