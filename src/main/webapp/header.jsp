<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">巢湖学院《数字电视原理与应用》精品课程</a>
				</div>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="${APP_PATH}">首页</a></li>
                        <li><a href="${APP_PATH}/getAllVideo">视频教程</a></li>
                        <li><a href="${APP_PATH}/getAllSource2">资料下载</a></li>
                        <li><a href="${APP_PATH}/selectAllTopic2">留言板</a></li>
                        <li><a href="${APP_PATH}/frontPage/home.jsp">个人中心</a></li>
                        <li><a href="${APP_PATH}/about.jsp">关于</a></li>
                    </ul>
                    <c:if test="${username==null }">
	                    <ul class="nav navbar-nav navbar-right">
	                        <li><a href="login.jsp">登录</a></li>
	                        <li><a href="register.jsp">注册</a></li>
	                    </ul>
                    </c:if>
                    <c:if test="${username!=null }">
	                    <ul class="nav navbar-nav navbar-right">
	                        <li><a href="update.jsp">欢迎你${username }</a></li>
	                        <li><a href="logout">退出登陆</a></li>
	                    </ul>
                    </c:if>
                </div>
            </div><!-- /.container-fluid -->
        </nav>
</html>