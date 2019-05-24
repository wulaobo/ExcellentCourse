<%@ page language="java" pageEncoding="utf-8"%>
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
	<script type="text/javascript" charset="utf-8" 
			src="${APP_PATH}/static/ckeditor/ckeditor.js"></script>
  </head>
  <body>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-1 main">
		<form action="${APP_PATH}/addTopic" method="post">
			<input type="hidden" name="edituser" value="${username }">
			<div class="table-responsive">
				<h2 class="sub-header">发布帖子</h2>
				<div class="col-md-11">
					<input type="text" class="form-control" name="title" id="title" placeholder="在此输入标题">
					<textarea id="article" name="detail">在此输入内容...</textarea>
					<script type="text/javascript">
						CKEDITOR.replace("article");
					</script>
				</div>
				<div class="col-md-11">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">发布选项</h3>
						</div>
						<div class="panel-body">
							<button class="btn btn-primary">提交</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
  </body>
</html>
