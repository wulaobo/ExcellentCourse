<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>视频上传</title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
     <div class="panel panel-default">
	    <div class="panel-body">
	        <div class="panel-heading" align="center"><h1 class="sub-header h3">视频上传</h1></div>
	           <hr>
	        <form class="form-horizontal" id="upload" method="post" action="${APP_PATH}/videoUpload" enctype="multipart/form-data">
	            <div class="form-group" align="center">
	                <div class="col-md-4 col-sm-4  col-xs-4 col-lg-4">
	                   视频上传 <input type="file" class="form-control" name="file" id="file">
	                <br>
	                   <input type="submit" value="上传">
	                </div>
	            </div>
	          </form>
	    </div>
	</div>
  </body>
</html>
