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
				<h2 class="sub-header">所有用户</h2>
				<!--搜索表单-->
	            <form class="navbar-form navbar-right" role="search" action="${APP_PATH}/selectByName">
	                <div class="form-group">
	                    <input type="text" class="form-control" placeholder="请输入用户名关键字" name="username">
	                </div>
	                <button type="submit" class="btn navbar-btn">搜索</button>
	            </form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>姓名</th>
							<th>权限/分组</th>
							<th>用户状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${!empty userList}">
								<c:forEach var="user" items="${userList.list}">
								<tr>  
			                        <td>${user.id}</td>  
			                        <td>${user.username}</td>
			                        <td>
			                        	<c:if test="${user.roleId==1}">
			                        		管理员
			                        	</c:if>
			                        	<c:if test="${user.roleId==2}">
			                        		用户
			                        	</c:if>
			                        </td>
			                        <td>
			                        	<c:if test="${user.state==0}">
			                        		用户账号未激活
			                        	</c:if>
			                        	<c:if test="${user.state==1}">
			                        		用户账号已激活
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
												<li><a href="${APP_PATH}/changeRole?username=${user.username}">更改用户分组</a></li>
												<li><a href="${APP_PATH}/changeState?username=${user.username}">更改用户状态</a></li>
												<li><a href="${APP_PATH}/deleteUser?id=${user.id }">删除</a></li>
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
						当前<span class="label label-default">${userList.pageNum }</span>页
						|总<span class="label label-default">${userList.pages }</span>页
						|有<span class="label label-default">${userList.total }</span>位用户.			
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/getAllUser?pn=1">首页</a></li>
						  	<c:if test="${userList.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/getAllUser?pn=${userList.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${userList.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==userList.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=userList.pageNum }">
						    		<li><a href="${APP_PATH}/getAllUser?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${userList.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/getAllUser?pn=${userList.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/getAllUser?pn=${userList.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>			
			</div>
  </body>
</html>
