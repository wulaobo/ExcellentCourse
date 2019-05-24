<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>  
<html>
  <head>    
    <title>资料列表</title>
    <link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
  		<div class="col-sm-9 col-sm-offset-3 col-md-11 col-md-offset-1 main">
				<h2 class="sub-header">所有资料</h2>
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
							<th>上传时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${!empty sourceList}">
								<c:forEach var="source" items="${sourceList.list}">
								<tr>  
			                        <td>${source.id}</td>  
			                        <td>${source.filename}</td>
			                        <td>${source.pubtime}</td>
									<td><button onclick="deleteSource(${source.id})">删除</button></td>
			                    </tr>
			          	 </c:forEach>
						</c:if>	               
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
						当前<span class="label label-default">${sourceList.pageNum }</span>页
						|总<span class="label label-default">${sourceList.pages }</span>页
						|有<span class="label label-default">${sourceList.total }</span>位用户.			
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/getAllSource?pn=1">首页</a></li>
						  	<c:if test="${sourceList.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/getAllSource?pn=${sourceList.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${sourceList.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==sourceList.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=sourceList.pageNum }">
						    		<li><a href="${APP_PATH}/getAllSource?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${sourceList.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/getAllSource?pn=${sourceList.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/getAllSource?pn=${sourceList.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>			
			</div>
  </body>


<script type="text/javascript">
	function deleteSource(id) {
		// alert(id);
		window.location.href="${pageContext.request.contextPath}/delete?id="+id;
	}
</script>

</html>
