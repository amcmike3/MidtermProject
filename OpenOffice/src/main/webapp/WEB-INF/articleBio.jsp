<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Bio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col card text-center">
				<div class="card-title">
					<h1>${article.title }</h1>
					<br/>
					<p> ${article.datePosted.dayOfMonth }, ${article.datePosted.month }, ${article.datePosted.year}
					<br/>
					<a href="userBio?userId=${article.user.id }">Author: ${article.user.username }</a>
					</p>
					
				</div>
				<div class="card-body">
				<p>${article.description }</p>
				<a href="${article.articleUrl }" target="_blank">Read more</a>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>