<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>  
<html>
  <head>    
    <title></title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<div class="col-sm-9 col-sm-offset-3 col-md-11 col-md-offset-1 main">
			<h1>${msg}</h1>
			<h2 class="sub-header">所有文章</h2>
			<form class="navbar-form navbar-right" role="search" action="${APP_PATH}/selectByTitle">
	                <div class="form-group">
	                    <input type="text" class="form-control" placeholder="请输入新闻标题关键字" name="title">
	                </div>
	                <button type="submit" class="btn navbar-btn">搜索</button>
	        </form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>标题</th>
						<th>发布时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="newsInfo" items="${news.list}">
						<tr>
							<td>${newsInfo.id}</td>
							<td>${newsInfo.title}</td>
							<td>${newsInfo.time}</td>
							<td>
								<shiro:hasRole name="admin">
									<div class="btn-group">
										<button type="button"
											class="btn btn-sm btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="${APP_PATH}/getNews?id=${newsInfo.id}">编辑</a></li>
											<li><a href="${APP_PATH}/deleteNewsById?id=${newsInfo.id }">删除</a></li>
										</ul>
									</div>
								</shiro:hasRole>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 分页信息 -->
			<div class="col-md-6">
					当前<span class="label label-default">${news.pageNum }</span>页
					|总<span class="label label-default">${news.pages }</span>页
					|总<span class="label label-default">${news.total }</span>篇文章.	
			</div>
			<div class="col-md-6">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	<li><a href="${APP_PATH}/anews?pn=1">首页</a></li>
					  	<c:if test="${news.hasPreviousPage}">
						    <li>
						      <a href="${APP_PATH}/anews?pn=${news.pageNum-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:if>
					    <c:forEach items="${news.navigatepageNums}" var="navigatepageNums">
					    	<c:if test="${navigatepageNums==news.pageNum }">
					    		<li class="active"><a>${navigatepageNums }</a></li>
					    	</c:if>
					    	<c:if test="${navigatepageNums!=news.pageNum }">
					    		<li><a href="${APP_PATH}/anews?pn=${navigatepageNums}">${navigatepageNums }</a></li>
					    	</c:if>
					    </c:forEach>
					    <c:if test="${news.hasNextPage}">
						    <li>
						      <a href="${APP_PATH}/anews?pn=${news.pageNum+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					    <li><a href="${APP_PATH}/anews?pn=${news.pages }">末页</a></li>
					  </ul>
					</nav>			
				</div>	
		</div>
  </body>
</html>
