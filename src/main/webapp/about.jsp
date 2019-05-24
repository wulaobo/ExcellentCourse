<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>about页面</title>
		<link href="static/img/secured.jpg" rel="shortcut icon">
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	  <script src="static/js/jquery-3.3.1.min.js"></script>
	  <script src="static/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="col-md-7 col-md-offset-2 main" >
			<section class="blockGroup">
				<h2 class="s_title">about</h2>
				<div class="views">
					<time>发布于:2019-5-01</time>- 1 次检阅
				</div>
				<article class="single">	
					<h3>简介</h3>
					<p>基于spring+springmvc+mybatis+mysql制作的巢湖学院《数字电视原理与应用》精品课程网站</p>
					<p>主要功能实现包括对所有用户进行的管理、对文章的管理、以及对资料的管理。</p>
					<h3>运用知识点</h3>
					<ul>
						<li>Spring mvc</li>
						<li>Spring</li>
						<li>Mybatis</li>
						<li>Maven</li>
						<li>Bootstrap</li>
						<li>Shiro</li>
						<li>PageHelper</li>
						<li>...</li>
					</ul>
					<h3>运行环境</h3>
					<ul>
						<li>Idea 2019</li>
						<li>Mysql 5.7</li>
						<li>jdk 1.8.131</li>
						<li>ckeditor编辑器</li>
						<li>Tomcat服务器</li>
						<li>...</li>
					</ul>
				</article>
			</section>
			<div class="text-right ">
	             <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
	             <a href="${APP_PATH}" >点此返回上一页</a>
	        </div>
		</div>
	</body>
