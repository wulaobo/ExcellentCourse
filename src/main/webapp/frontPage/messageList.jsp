<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8">
	  <title>互动交流</title>
	  <link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
	  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="${APP_PATH}/static/css/style3.css">
	  <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
	  <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
   <body>
        <%@include file="header.jsp" %>
		<div class="container">
			 	<div class="col-md-7 col-md-offset-2 main">
					<h3 class="text-info">所有留言</h3><br/>
					<c:forEach items="${topicLists.list }" var="topics">
						<div>
							<c:out value="${topics.title}"/>
							<div class="text-right">[发布人:<c:out value="${topics.edituser}"/>][时间:<c:out value="${topics.pubtime }"/>]</div>
						</div>
						<div class="text-right">
							<a href="${APP_PATH }/selectTopicAnswerById?id=<c:out value="${topics.id}"/>"><i>点击这里查看更多内容»»</i></a>
						</div>
						<hr/>
					</c:forEach>
				</div>
				<!-- 分页信息 -->
				<div id="page" class="col-md-7 col-md-offset-2">
						<br/><br/><br/>当前<span class="label label-default">${topicLists.pageNum }</span>页
						|总<span class="label label-default">${topicLists.pages }</span>页
						|有<span class="label label-default">${topicLists.total }</span>个主题.			
				</div>
				<div id="page" class="col-md-3">
					<nav aria-label="Page navigation">
					  <br/><br/><ul class="pagination">
					  	<li><a href="${APP_PATH}/selectAllTopic2?pn=1">首页</a></li>
					  	<c:if test="${topicLists.hasPreviousPage}">
						    <li>
						      <a href="${APP_PATH}/topics?pn=${topicLists.pageNum-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:if>
					    <c:forEach items="${topicLists.navigatepageNums}" var="navigatepageNums">
					    	<c:if test="${navigatepageNums==topicLists.pageNum }">
					    		<li class="active"><a>${navigatepageNums }</a></li>
					    	</c:if>
					    	<c:if test="${navigatepageNums!=topicLists.pageNum }">
					    		<li><a href="${APP_PATH}/selectAllTopic2?pn=${navigatepageNums}">${navigatepageNums }</a></li>
					    	</c:if>
					    </c:forEach>
					    <c:if test="${topicLists.hasNextPage}">
						    <li>
						      <a href="${APP_PATH}/selectAllTopic2?pn=${topicLists.pageNum+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					    <li><a href="${APP_PATH}/selectAllTopic2?pn=${topicLists.pages }">末页</a></li>
					  </ul>
					</nav>			
				</div>
			</div>
     	<%@include file="footer.jsp" %>
  </body>
</html>
