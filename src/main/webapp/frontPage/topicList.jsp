<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h2 class="sub-header">我发表的帖子</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>标题</th>
							<th>发表时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${!empty topicList}">
								<c:forEach var="topic" items="${topicList.list}">
								<tr>  
			                        <td>${topic.id}</td>  
			                        <td>${topic.title}</td>
			                        <td>${topic.pubtime}</td>
			                        <td>
				                        <div class="btn-group">
											<button type="button"
												class="btn btn-sm btn-default dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												操作 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a href="${APP_PATH}/selectTopicById?id=${topic.id }">修改</a></li>
												<li><a href="${APP_PATH}/deleteTopic?id=${topic.id }">删除</a></li>
											</ul>
										</div>
			                        </td>
			                    </tr>
			          	 </c:forEach>
						</c:if>	               
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
						当前<span class="label label-default">${topicList.pageNum }</span>页
						|总<span class="label label-default">${topicList.pages }</span>页
						|有<span class="label label-default">${topicList.total }</span>个帖子.			
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/selectAllTopic?pn=1">首页</a></li>
						  	<c:if test="${topicList.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/selectAllTopic?pn=${topicList.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${topicList.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==topicList.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=topicList.pageNum }">
						    		<li><a href="${APP_PATH}/selectAllTopic?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${topicList.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/selectAllTopic?pn=${topicList.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/selectAllTopic?pn=${topicList.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>			
			</div>
  </body>
</html>
