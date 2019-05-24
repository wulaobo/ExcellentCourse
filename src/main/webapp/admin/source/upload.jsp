<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>文件上传</title>
  </head>
  <body>
     <form action="${APP_PATH }/upload" method="post" enctype="multipart/form-data">  
      	  选择文件:<input type="file" name="file" width="120px">  
        <input type="submit" value="上传">  
    </form>  
  </body>
</html>
