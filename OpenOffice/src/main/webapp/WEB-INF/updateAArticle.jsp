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
	<div class="container">
		<div class="row">

			<div class="col card card-body text-center">

	<form action="updatingAArticle" method="POST">

					<input type="hidden" name="id" value="${article.id}"> <input
						type="hidden" name="articleUrl" value="${article.articleUrl}">
					<input type="hidden" name="articleId" value="${article.id }">
					<label>Title</label> 
					<br> 
					<input type="text" name="title"
						value="${article.title}"> 
						<br> 
					<label>Description</label>
					<input type="text" name="description" value="${article.description}"> 
						<br> 
					 <label>Date Posted</label>
					<input type="text" name="datePosted" value="${article.datePosted}"> 
						<br> 
					 <label>Industry for Article</label>
					<input type="text" name="industry" value="${article.industry}"> 
						<br> 
						
						<input type="submit" value="Update Article" />
				</form>
				
				<form action="deletedArticle" method="post">
					<input type="hidden" name="articleId" value="${article.id }">
					<input type="submit" value="Delete Article"/>
				</form>
				</div>
				</div>
				</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>