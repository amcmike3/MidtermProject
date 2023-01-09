<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserBio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="row text-center">
			<div class="col-3" id="user-profile-pic-container">
				<div class="card-title">${sessionScope.user.firstName }
					${sessionScope.user.lastName }</div>
				<div class="card-body">
					<img class="user-bio-pic zoom"
						src="${user.imgUrl }">
				</div>
				<div class="card-body yellow" style="margin-top: 40px;">
					<a href="updateUser"><button class="button" style="color: white;">Update Profile</button></a>
				</div>


			</div>
			<div class="col">
				<div class="card-body title-container" style="min-width: 210px;">
					<h3>Description:</h3>
					<br>
					<c:choose>
						<c:when test="${sessionScope.user.description != null}">
							<p>${sessionScope.user.description}</p>
						</c:when>
						<c:otherwise>
							<a href="updateUser">Add a description</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="card-body title-container" style="min-width: 210px;">
					<h3>Contributions:</h3>
					<br>
					<c:forEach var="review" items="${sessionScope.user.reviews }">
						<div class="card yellow-containers">
							<p>
								<a href="companyBio?companyId=${review.company.id }">
									${review.company.name }</a> rating: ${review.rating } out of 10 <br>
								you said: <br> ${review.content }
							</p>
						</div>

					</c:forEach>
				<input type="submit" formaction="createArticle" value="Add Article" />
					<h4>Articles written by ${sessionScope.user.username}</h4>
					<c:forEach var="article" items="${sessionScope.user.articles }">
						<div class="card yellow-containers">
							<p>
								<a href="articleBio?articleId=${article.id }">
									${article.title }</a>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>