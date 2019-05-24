<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>  
<html>
<head>
<title>教程</title>
 <link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
</head>
<body>
	<!-- 遍历Map集合 -->
     <c:forEach var="list" items="${list}">
         <c:url value="download" var="downurl">
             <c:param name="filename" value="${list}"></c:param>
         </c:url>
         ${list}<a href="${downurl}">下载</a>
         <br/>
    </c:forEach>
</body>
</html>