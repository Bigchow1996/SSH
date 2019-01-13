<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>SSH2</title>
    <!-- easyUI需要引入的js文件 -->
	<script type="text/javascript" src="jslib/jquery-easyui-1.3.1/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="jslib/jquery-easyui-1.3.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jslib/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
	<!-- easyUI需要引入的css文件 -->
	<link rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.3.1/themes/metro/easyui.css"></link>
	<!-- 如果在themes/icon中添加自己的图片，那么需要在icon.css里面编辑一下，才能使用 -->
	<link rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.3.1/themes/icon.css"></link>
	<!-- 自定义验证机制 -->
	<script type="text/javascript" src="jslib/validateUtil.js"></script>
  </head>
  
  <body class="easyui-layout">
  		<div data-options="region:'north'" style="height:100px;"></div>
	    <div data-options="region:'south'" style="height:100px;"></div>
	    <div data-options="region:'east',title:'East'" style="width:200px;"></div>
	    <div data-options="region:'west',title:'功能导航'" style="width:200px;">
	    	<jsp:include page="layout/west.jsp"></jsp:include>
	    </div>
	    <div data-options="region:'center',title:'欢迎使用SSH2'" style="padding:5px;background:#eee;">
	    	<jsp:include page="layout/center.jsp"></jsp:include>
	    </div>
	    <jsp:include page="user/login.jsp"></jsp:include>
	    <jsp:include page="user/register.jsp"></jsp:include>
  </body>
</html>
