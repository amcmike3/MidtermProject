<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Interviews</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers">

		<c:choose>
			<c:when test="${articles != null }">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Article ID</th>
							<th>Article Title</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles}">
							<tr class="zoom">
								<td>${article.id}</td>
								<td><a href="articleBio?articleId=${article.id}">${article.title}</a></td>
								<td><c:if test="${sessionScope.user.role }">
										<a href="updateAArticle?articleId=${article.id }"><button
												class="zoom button" style="color: white;">Update</button></a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</c:when>
			<c:otherwise>
				<div class="zoom title-container">
					<h2>No articles found</h2>
				</div>
			</c:otherwise>
		</c:choose>
	</div>



	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>