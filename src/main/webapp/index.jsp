<%@ page language="java" pageEncoding="utf-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%> 
<!DOCTYPE HTML>  
<html>  
  <head>  
    <title></title> 
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script>
		window.onload = function(){ //设置当页面加载时执行
		window.location ="${APP_PATH }/page" 
		}
	</script>
  </head>
  <body>
  </body>
</html>