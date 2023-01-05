<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserBio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="containers">
		<div class="row">
			<div class="col-3 card yellow-containers">
				<div class="card-title">${sessionScope.user.firstName }
					${sessionScope.user.lastName }</div>
				<div class="card-body">
					<img style="width: 100px; height: auto; !important"
						src="${user.imgUrl }">
				</div>
				<div class="card card-body containers">
					<a href="updateUser">Update Profile</a>
				</div>


			</div>
			<div class="col card yellow-containers">
				<div class="card-body containers">
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
				<div class="card-body containers">
					<h3>Contributions:</h3>
					<br>
					<c:forEach var="review" items="${sessionScope.user.reviews }">
						<div class="card yellow-containers">
							<p>
								<a href="userBio?userId=${review.user.id }">
									${review.company.name }</a> rating: ${review.rating } out of 10 <br>
								you said: <br> ${review.content }
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