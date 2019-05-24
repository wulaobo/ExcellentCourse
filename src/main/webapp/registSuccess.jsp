<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>注册成功</title>
   	<link href="static/img/secured.jpg" rel="shortcut icon">
  </head>
  <body>
   <!--注册成功了，过5s之后跳转到登录页面  -->
	<div align="center" >
		<table  style="padding-top: 300px;"  >
			<tr>
				<td rowspan="2"><img alt="img" src="static/img/success.jpg"></td>
			</tr>
			<tr>
				<td style="padding-bottom:50px;padding-left: 10px;"><span id="totalSecond">3</span>秒后完成跳转!!!</td>
				<td style="padding-top:50px;padding-left: 10px;"><font color="red"><a href="login.jsp">没有跳转？点击跳转到我们的登录页面</a></font></td>	
			</tr>
		</table>
	</div>
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
