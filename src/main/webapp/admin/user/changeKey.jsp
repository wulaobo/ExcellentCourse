<%@ page language="java" pageEncoding="utf-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>修改用户信息</title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
    <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/static/js/jquery.validate.min.js"></script>
	<script src="${APP_PATH}/static/js/messages_zh.js"></script>
	<script src="${APP_PATH}/static/js/check.js"></script>
</head>
<body>
   <div class="container"style="margin-top: 200px;">
       <form class="col-sm-offset-4 col-sm-4 col-sm-offset-4 form form-horizontal" action="${APP_PATH}/changeKey" method="post" id="register_form">
             <h3 class="text-center">修改密码</h3>
			 <h5 class="text-center">&nbsp;(带<span style="color: red">*</span>为必填项,已用<span>*</span>标注！)</h5>
             <div class="errorMsg"><span>${errorMsg }</span></div>
             <input type="hidden" name="id" value="${id }">
           <div class="form-group">
             <label for="username">您的登录名(不可更改)<span style="color: red">*</span></label>
             <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" readonly value="${username }">
           </div>
           <div class="form-group">
             <label for="password">登录密码<span style="color: red">*</span></label>
             <input type="password" class="form-control"id="password" name="password" placeholder="请输入密码">
           </div>
      		<button type="submit"class="btn btn-success center-block">确定修改</button>
         </form>
   </div>
</body>
</html>