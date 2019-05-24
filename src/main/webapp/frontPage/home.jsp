<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>  
<html>  
  <head>  
    <title>个人中心</title>  
      <link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
	  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="${APP_PATH}/static/css/style2.css">
	  <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
	  <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" href="css/style.css">
  </head>  
  <body>  
    <!--顶部导航栏部分-->
	<%@include file="header.jsp" %>
	<!-- 中间主体内容部分 -->
	<div class="pageContainer">
		 <!-- 左侧导航栏 -->
		  <div class="pageSidebar">
			<a href="${APP_PATH}/update.jsp" target="mainFrame" class="btn"><i class="glyphicon glyphicon-user"></i>修改用户信息</a><br/>  
			<a href="addtopic.jsp" target="mainFrame" class="btn"><i class="glyphicon glyphicon-edit"></i>发布帖子</a><br/>
			<a href="../selectAllTopic?edituser=${username}" target="mainFrame" class="btn"><i class="glyphicon glyphicon-tags"></i>帖子管理</a>
		 </div>
		 <!-- 左侧导航和正文内容的分隔线 -->
		 <div class="splitter"></div>
		 <!-- 正文内容部分 -->
		 <div class="pageContent">
<%--			 <iframe src="index.html" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>--%>
	<h1>欢迎进入个人中心</h1>
		 </div>
	 </div>
	 <!-- 底部页脚部分 -->
	 <%@include file="footer.jsp" %>
  </body>  
</html>  