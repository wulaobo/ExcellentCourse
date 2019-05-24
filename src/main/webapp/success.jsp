<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>登录成功...</title>
<link href="static/img/secured.jpg" rel="shortcut icon">
</head>
<body onload="run()">
<shiro:hasRole name="admin">
	欢迎[<shiro:principal/>]
</shiro:hasRole>
<br/><br/><h2><span id="totalSecond">3</span>秒后完成跳转!!!</h2>
</body>
<script language="javascript" type="text/javascript">
    var second = document.getElementById('totalSecond').innerText;
   
    setInterval("redirect()", 1000); //每1秒钟调用redirect()方法一次
    function redirect()
    {
        if (second < 1)
        {
            location.href = '${pageContext.request.contextPath}/admin/home.jsp';
        } else
        {
              document.getElementById('totalSecond').innerText = second--;
        }
    }
</script>
</html>