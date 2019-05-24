<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>修改用户信息</title>
    <link href="static/img/secured.jpg" rel="shortcut icon">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
	<script src="static/js/jquery.validate.min.js"></script>
	<script src="static/js/messages_zh.js"></script>
	<script src="static/js/check.js"></script>
</head>
<body>
   <div class="container"style="margin-top: 200px;">
       <form class="col-sm-offset-4 col-sm-4 col-sm-offset-4 form form-horizontal" action="${pageContext.request.contextPath }/update" method="post" id="register_form">
             <h3 class="text-center">修改用户信息</h3>
             <div class="errorMsg"><span>${errorMsg }</span></div>
             <input type="hidden" name="id" value="${id }">
           <div class="form-group">
             <label for="username"class="col-sm-2 control-label">账&nbsp;号</label>
             <div class="col-sm-10">
                 <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" value="${username }">
             </div>
           </div>
           <div class="form-group">
             <label for="password"class="col-sm-2 control-label">密&nbsp;码</label>
             <div class="col-sm-10">
                 <input type="password" class="form-control"id="password" name="password" placeholder="请输入密码">
             </div>
           </div>
           <div class="form-group">
             <label for="email"class="col-sm-2 control-label">邮&nbsp;箱</label>
             <div class="col-sm-10">
                 <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱" value="${email }">
             </div>
           </div>
      		<button type="submit"class="btn btn-success center-block">确定修改</button>
      		<div class="text-right">
                <a href="home.jsp" >返回上一页</a>
            </div>
      		
         </form>
   </div>
</body>
</html>