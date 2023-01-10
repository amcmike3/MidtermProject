<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Baseline</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<form action="updatingArticle" method="POST">
					<input type="hidden" name="id" value="${article.id}"> <input
						type="hidden" name="articleUrl" value="${article.articleUrl}">
					<input type="hidden" name="articleId" value="${article.id }">
					<label>Title</label> 
					<br> 
					<input type="text" name="title"
						value="${article.title}"> 
						<br> 
						<label>Description</label>
					<br> 
					<input type="text" name="description" value="${article.description}"> 
						<br> 
						<input type="submit" value="Update Article" />
				</form>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>