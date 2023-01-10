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
	<h1>All Articles</h1>
	<c:forEach var="article" items="${articles }">
		<div class="row">
			<div class="col card matcha">

				<div class="card-title">
					<h3>
						<a href="articleBio?articleId=${ article.id}">${article.title }</a>
						<br>
					</h3>
				</div>
				<div class="card-body"></div>
				<p>${article.description }</p>
				<br />
				<c:if test="${sessionScope.user.role }">
					<a href="updateAArticle?articleId=${article.id }"><button>Update</button></a>
				</c:if>
			</div>
		</div>
	</c:forEach>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>