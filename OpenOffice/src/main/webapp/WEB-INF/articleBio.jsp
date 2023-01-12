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
			<div class="col card text-center yellow-containers zoom">
				<div class="card-title title-container zoom">
					<h1>${article.title }</h1>
					<br />
				</div>
				<div class="yellow-containers zoom">


					<p class="matcha">
						${article.datePosted.dayOfMonth }, ${article.datePosted.month },
						${article.datePosted.year} <br /> <a
							href="userBio?userId=${article.user.id }">Author:
							${article.user.username }</a>
					</p>
				</div>
				<div class="card-body yellow-containers zoom">
					<p>${article.description }</p>
					<a href="${article.articleUrl }" target="_blank">Read more</a>
					<c:choose>
						<c:when test="${sessionScope.user.id == article.user.id || sessionScope.user.role }">

							<ul class="list-group list-group-flush matcha">
								<li class="list-group-item" style="background-color:#81B29A"><a
									href="updateArticle?articleId=${article.id}"><button class="zoom btn" style="color: white;">Update</button></a>
								</li>
								<li class="list-group-item" style="background-color:#81B29A"><a
									href="deleteArticle?articleId=${article.id}"><button class="zoom btn" style="color: white;">Delete</button></a></li>
							</ul>
						</c:when>

					</c:choose>
				</div>
			</div>
		</div>
	</div>


	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>