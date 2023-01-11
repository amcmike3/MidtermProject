<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
					<label>Title</label> <br> <input type="text" name="title"
						value="${article.title}"> <br> <label>Description</label>
					<input type="text" name="description"
						value="${article.description}"> <br>
					<%-- 			 <label>Date Posted</label>
					<input type="text" name="datePosted" value="${article.datePosted.dayOfMonth }, ${article.datePosted.month },
						${article.datePosted.year} ">  --%>
					<br> <label>Industry for Article</label> <br>
					<h1>${article.industry.name }</h1>

					<select name="industryId">
						<c:forEach var="industry" items="${industryList }">
						
						<c:choose>
						<c:when test="${article.industry.id == industry.id}">
							<option value="${industry.id}" selected="selected">"${industry.name }"</option>
							</c:when>
							<c:otherwise>
							<option value="${industry.id}">"${industry.name }"</option>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</select> <br> <label for="enabled">Enable?</label> <select
						id="enabled" name="enabled">
						<option value="true">Yes</option>
						<option value="false">No</option>
					</select> <br> <input type="submit" value="Update Article" />
				</form>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>