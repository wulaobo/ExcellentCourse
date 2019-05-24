<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>  
<html>
  <head>    
    <title>所有课程</title>
    <link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
  		<div class="col-sm-8 col-sm-offset-2 col-md-11 col-md-offset-1 main">
  		 		<div class="text-right ">
	             <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
	             <a href="${APP_PATH}" >点此返回上一页</a>
	       		</div>
				<h2 class="sub-header">所有视频</h2>
				<!--搜索表单-->
	            <%-- <form class="navbar-form navbar-right" role="search" action="${APP_PATH}/selectByName">
	                <div class="form-group">
	                    <input type="text" class="form-control" placeholder="请输入用户名关键字" name="username">
	                </div>
	                <button type="submit" class="btn navbar-btn">搜索</button>
	            </form> --%>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>文件名</th>
							<th>文件类型</th>
							<th>上传时间</th>
							<th>播放</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty videoList}">
							<c:forEach var="video" items="${videoList.list}">
							<tr>  
		                        <td>${video.id}</td>  
		                        <td>${video.titleOrig}</td>
		                        <td>${video.type}</td>
		                        <td>${video.uploadTime}</td>
                                <td><button><a href="${APP_PATH}/play?id=${video.id }">播放</a></button></td>
								<td><button><a href="${APP_PATH}/deleteVideoById?id=${video.id}">删除</a></button></td>
		                    </tr>
			          	 </c:forEach>
						</c:if>	               
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
						当前<span class="label label-default">${videoList.pageNum }</span>页
						|总<span class="label label-default">${videoList.pages }</span>页
						|有<span class="label label-default">${videoList.total }</span>个视频.			
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/getAllVideo2?pn=1">首页</a></li>
						  	<c:if test="${videoList.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/getAllVideo2?pn=${videoList.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${videoList.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==videoList.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=videoList.pageNum }">
						    		<li><a href="${APP_PATH}/getAllVideo2?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${videoList.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/getAllVideo2?pn=${videoList.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/getAllVideo2?pn=${videoList.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>		
			</div>
  </body>
</html>
