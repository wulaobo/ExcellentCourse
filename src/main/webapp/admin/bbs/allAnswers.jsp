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
				<h2 class="sub-header">所有留言</h2>
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
							<th>留言用户</th>
							<th>具体内容</th>
							<th>发布时间</th>
							<th>留言状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${!empty answerLists}">
								<c:forEach var="answers" items="${answerLists.list}">
								<tr>  
			                        <td>${answers.id}</td>  
			                        <td>${answers.answeruser}</td>
			                        <td>${answers.content }</td>
			                        <td>${answers.pubtime2 }</td>	
			                        <td>
			                        	<c:if test="${answers.state2==0}">
			                        		留言已屏蔽
			                        	</c:if>
			                        	<c:if test="${answers.state2==1}">
			                        		留言未屏蔽
			                        	</c:if>
			                        </td>
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
												<li><a href="${APP_PATH}/updateAnswerState?id=${answers.id}">更改留言状态</a></li>
												<li><a href="${APP_PATH}/deleteAnswer?id=${answers.id }">删除留言</a></li>
											</ul>
										</div>
				                        </shiro:hasRole>
			                        </td>
			                    </tr>
			          	 </c:forEach>
						</c:if>	               
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
						当前<span class="label label-default">${answerLists.pageNum }</span>页
						|总<span class="label label-default">${answerLists.pages }</span>页
						|有<span class="label label-default">${answerLists.total }</span>个留言.
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/selectAllAnswer?pn=1">首页</a></li>
						  	<c:if test="${answerLists.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/selectAllAnswer?pn=${answerLists.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${answerLists.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==answerLists.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=answerLists.pageNum }">
						    		<li><a href="${APP_PATH}/selectAllAnswer?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${answerLists.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/selectAllAnswer?pn=${answerLists.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/selectAllAnswer?pn=${answerLists.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>			
			</div>
  </body>
</html>
