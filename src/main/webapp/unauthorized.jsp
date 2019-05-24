<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="static/img/secured.jpg" rel="shortcut icon">
<title>认证失败</title>
</head>
<body onload="run()">
认证未通过，或者权限不足>>>
<h3><span id="totalSecond">3</span>秒后完成跳转!!!</h3>
</body>
<script language="javascript" type="text/javascript">
    var second = document.getElementById('totalSecond').innerText;
   
    setInterval("redirect()", 1000); //每1秒钟调用redirect()方法一次
    function redirect()
    {
        if (second < 0)
        {
            location.href = '${pageContext.request.contextPath}/login.jsp';
        } else
        {
              document.getElementById('totalSecond').innerText = second--;
        }
    }
</script>
</html>