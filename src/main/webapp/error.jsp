<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>操作失败...</title>
<link href="static/img/secured.jpg" rel="shortcut icon">
</head>
<body onload="run()">
<h1><span style="color: red">错误</span></h1>
<h2><span id="totalSecond">3</span>秒后完成跳转!!!</h2>
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