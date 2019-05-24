<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8">
	  <title>Secured主页</title>
	  <link href="${APP_PATH}/static/img/secured.jpg" rel="shortcut icon">
	  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="${APP_PATH}/static/css/style2.css">
	  <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
	  <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
   <body>
        <%@include file="header.jsp" %>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- ol指示器  ol标签与ul标签不同 ol为是有序列表 ul为是无序列表 -->
            <ol class="carousel-indicators">
                  <!-- 指示器 -->
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>

            <!-- 包装的轮播图片-->
            <div class="carousel-inner" role="listbox">
                <!--图片-->
                <div class="item active">
                    <img src="${APP_PATH}/static/img/1.jpg" alt="风景1">
                    <div class="carousel-caption">
                        <!--h4中的内容显示到图片上面，-->
                        <h4>真正的才智是刚毅的志向。 —— 拿破仑</h4>
                    </div>
                </div>
                <div class="item">
                    <img src="${APP_PATH}/static/img/2.jpg" alt="风景2">
                    <div class="carousel-caption">
                        <h4>志向不过是记忆的奴隶，生气勃勃地降生，但却很难成长。 —— 莎士比亚</h4>
                    </div>
                </div>
                <div class="item">
                    <img src="${APP_PATH}/static/img/3.jpg" alt="风景3">
                    <div class="carousel-caption">
                        <h4>但行好事，莫问前程。 —— 武文波</h4>
                    </div>
                </div>
                <div class="item">
                    <img src="${APP_PATH}/static/img/4.jpg" alt="风景4">
                    <div class="carousel-caption">
                        <h4>生活有度，人生添寿。 —— 书摘</h4>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
       <div class="container">
       		<div class="row clearfix">
       			<div class="col-md-3 column">
					<h2>
						课程介绍
					</h2>
					<p style="text-indent: 200px">
						《数字电视原理与应用》是电子信息、电子科学与技术、广播电视工程、通讯技术等电子类专业的必修课。本课程涵盖数字电视信号的摄取，压缩编码技术及其标准，输入流复用技术，信道编码与调至传输，条件接收与显示技术等内容。对此，课程中做了清晰的描述。各章节均以应用为主的理论结合实际，数据详实，典例实力充分，
						对最新科技成果如三四融合、视频格式、移动电视等也适当的理论或实验补充。其理论课的主要内容适合电子类本科学生在72个学时左右学习，实验课适合在20个学时的教学。此外，本课程的授课教案等相关内容也合适对数字电视感兴趣的广大读者自学。<a class="btn" href="#">更多 »</a>
					</p>
					<h2>
						联系我们
					</h2>
					<p>
						电话：15256247692<br/>
						邮箱：2480458124@qq.com
					</p>
				</div>
				<div class="col-md-7 col-md-offset-2 main">
					<h2>
                        数字电视原理相关书籍
					</h2>
					<p>
						<img src="${APP_PATH}/static/img/book1.jpg" height="200" width="150" />
                        <img src="${APP_PATH}/static/img/book4.jpg" height="200" width="150" />
                        <img src="${APP_PATH}/static/img/book3.jpg" height="200" width="150" />

					</p>
					<h3 class="text-info">最新文章</h3>
					<c:forEach items="${pageInfo.list }" var="news">
						<ul><li>
							<a href="${APP_PATH }/selectNewsById?id=<c:out value="${news.id}"/>"><c:out value="${news.title}"/></a>
							---------------------------------发布时间：<c:out value="${news.time}"/>
							<a href="${APP_PATH }/selectNewsById?id=<c:out value="${news.id}"/>"><i>阅读全文»»</i></a>
						</li></ul>
					</c:forEach>
					<ul class="pagination">
						<li>
							<c:if test="${pageInfo.hasPreviousPage}">
								<a href="${APP_PATH }/page/${pageInfo.pageNum-1}">Previous page</a>
							</c:if>
						</li>
						<li>
							<c:if test="${pageInfo.hasNextPage}">
								<a href="${APP_PATH }/page/${pageInfo.pageNum+1}">Next page</a>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
	   </div>
     <%@include file="footer.jsp" %>
  </body>
</html>
