<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>文章详情页</title>
    <link href="static/img/secured.jpg" rel="shortcut icon">
	<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
    <div class="col-md-7 col-md-offset-2 main" >
			<section class="blockGroup">
				<span><h2 class="s_title"><c:out value="${news.title}" /></h2></span>
				<div class="views">
					<time>发布于:<c:out value="${news.time}" /></time>- 
					<c:out value="${news.id}" /> 次检阅
					<shiro:hasRole name="admin">
						<a href="${APP_PATH }/getNews?id=<c:out value="${news.id}" />">编辑</a>
					</shiro:hasRole>
				</div>
			<article class="single">
	   			<div id="text">
	   				${news.article}
	   			</div>
			</article>
			</section>
		</div>
  </body>
</html>
