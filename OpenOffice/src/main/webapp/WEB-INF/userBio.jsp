<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers">
		<div class="row">
			<div class="col-3 card yellow-containers">
				<div class="card-title">${user.firstName }
					${user.lastName }</div>
				<div class="card-body">
					<img style="width: 100px; height: auto; !important"
						src="${user.imgUrl }">
				</div>

			</div>
			<div class="col card yellow-containers">
				<div class="card-body containers">
					<h3>Description:</h3>
					<br>
					<c:choose>
						<c:when test="${user.description != null}">
							<p>${user.description}</p>
						</c:when>
						<c:otherwise>
							<p>No description</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="card-body containers">
					<h3>Contributions:</h3>
					<br>
					<c:forEach var="review" items="${user.reviews }">
						<div class="card yellow-containers">
							<p>
								<a href="companyBio?companyId=${review.company.id }">
									${review.company.name }</a> rating: ${review.rating } out of 10 <br>
								they said: <br> ${review.content }
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