<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>互动交流</title>
		<link href="static/img/secured.jpg" rel="shortcut icon">
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	  <script src="static/js/jquery-3.3.1.min.js"></script>
	  <script src="static/bootstrap/js/bootstrap.min.js"></script>
	  <script type="text/javascript" charset="utf-8" 
			src="${APP_PATH}/static/ckeditor/ckeditor.js"></script>
	</head>
	<body>
		 <div class="text-right">
		 	<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
            <a href="${APP_PATH }/selectAllTopic2" >返回上一页</a>
         </div>
		<div class="col-md-8 col-md-offset-2 main" >
			<table width="100%" style="margin-top:8px;">
				<tr bgcolor="#a8d7f1">
					<td align="left" height="30" style="color:#ffffff;font-weight: bold;padding-left:8px">
						<c:out value="${list.title}" />
					</td>
				</tr>
			</table>
			<table width="100%" style="margin-top:8px;border: 1px solid #4dffff;">
				<tr style="border: 1px solid #4dffff;">
					<td width="20%" bgcolor="#e8e9f9" rowspan="3" style="border: 1px solid #4dffff;">
						<table width="100%" >
							<tr>
								<td align="left" valign="middle" style="padding-left:30px;">
									<img src="${APP_PATH }/static/img/photo.jpg">
								</td>
							</tr>
							<tr>
								<td style="padding-top:10px;;padding-left:30px;font-weight: bold;" align="left">
									<c:out value="${list.edituser }"/>
								</td>
							</tr>
						</table>
					</td>
					<td width="80%" height="24" align="left" bgcolor="#e8e9f9">
						<table width="100%">
							<tr>
								<td align="left" height="24" style="padding-left:10px;">发表于：<c:out value="${list.pubtime}" /></td>	
								<td align="right" style="padding-right:10px;font-weight: bold;">楼主</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="160" bgcolor="#e8e9f9" align="left" valign="top" style="padding:10px;">
						<c:out value="${list.detail}" escapeXml="false"/>
					</td>
				</tr>
				<tr>
					<td bgcolor="#e8e9f9" height="24" style="border: 1px solid #4dffff;">
						<table width="100%">
							<tr>
								<td align="left" height="24" style="padding-left:10px;">回复次数：<c:out value="${replyNum}" default="0"/></td>	
								<td align="right" style="padding-right:10px;font-weight: bold;"><a href="#">TOP</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<c:if test="${!empty lists}">
			<c:forEach var="lists" items="${lists}" >
				<c:forEach var="answer" items="${lists.answer}" varStatus="vs">
				<table width="100%" style="margin-top:8px;border: 1px solid #4dffff;">
					<tr style="border: 1px solid #4dffff;">
						<td width="20%" rowspan="3" style="border: 1px solid #4dffff;">
							<table width="100%" >
								<tr>
									<td align="left" valign="middle" style="padding-left:30px;">
										<img src="${APP_PATH }/static/img/photo.jpg">
									</td>
								</tr>
								<tr>
									<td style="padding-top:10px;;padding-left:30px;font-weight: bold;" align="left">
										<c:out value="${answer.answeruser }"/>
									</td>
								</tr>
							</table>
						</td>
						<td width="80%" height="24" align="left">
							<table width="100%">
								<tr>
									<td align="left" height="24" style="padding-left:10px;">发表于：<c:out value="${answer.pubtime2}" /></td>	
									<td align="right" style="padding-right:10px;font-weight: bold;">#<c:out value="${vs.index+1}"/>楼</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="160" align="left" valign="top" style="padding:10px;">
							<c:if test="${answer.state2==0}">
								该回复已被屏蔽！！！
							</c:if>
							<c:if test="${answer.state2==1}">
								<c:out value="${answer.content}" escapeXml="false"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<td height="24" style="border: 1px solid #4dffff;">
							<table width="100%">
								<tr>
									<td align="right" style="padding-right:10px;font-weight: bold;"><a href="#">TOP</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</c:forEach>
			</c:forEach>
			</c:if>
				<form action="${APP_PATH}/addAnswer" method="post">
				<input type="hidden" name="answeruser" value="${username }">
				<input type="hidden" name="topicId" value="${list.id }">
				<div class="table-responsive">
					<h5 class="sub-header">回复主题:</h5>
					<div>
						<textarea id="article" name="content">在此输入内容...</textarea>
						<script type="text/javascript">
							CKEDITOR.replace("article");
						</script>
						<div class="panel-body">
							<button class="btn btn-primary">提交</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
