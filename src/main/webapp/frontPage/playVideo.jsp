<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE>
<html>
<head>
<title>在线视频播放</title>
	<link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
	<link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<%--<body onload="play()">--%>
<body>
	<%@include file="header.jsp" %><br/><br/><br/>
	<div class="panel panel-default">
		<div class="panel-body" align="center">
			<div id="a1" align="center">${name}</div><br/>
			<video width="600" height="400" align="center" controls>
				<source src="${APP_PATH}/${path}" type="video/mp4">

				您的浏览器不支持 HTML5 video 标签。
			</video>

		</div>
	</div>

</body>

</html>