<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<c:choose>
		<c:when test="${user.enabled }">

			<div class="containers text-center">
				<div class="row text-center">
					<div class="col-3" id="user-profile-pic-container">
						<div class="card-title" style="padding: 0;">${user.firstName }
							${user.lastName }</div>
						<div class="card-body text-center">
							<img class="user-bio-pic zoom" src="${user.imgUrl }">
						</div>

						<c:if test="${sessionScope.user.role }">
							<a href="updatAUser?userId=${user.id }"><button>Update</button></a>
						</c:if>
					</div>
					<div class="col matcha">
						<div class="card-body title-container">
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
						<div class="card-body title-container">
							<h3>Contributions:</h3>
							<br>
							<c:forEach var="review" items="${user.reviews }">
								<div class="card white-containers">
									<p>
										<a href="companyBio?companyId=${review.company.id }">
											${review.company.name }</a> rating: ${review.rating } out of 10 <br>
										they said: <br> ${review.content }
									</p>
								</div>

							</c:forEach>
						</div>
						<div class="card-body title-container">
							<h3>Subscription:</h3>
							<br>
							<c:forEach var="company" varStatus="loop"
								items="${user.companies}">
								<c:if test="${loop.index <= 1 }">
									<div class="card white-containers">
										<p>
											<a href="companyBio?companyId=${company.id}">${company.name }</a>
										</p>
									</div>
								</c:if>
							</c:forEach>
							<form action="viewSubscription.do" method="get">
								<input type="hidden" name="userId" value="${user.id }">
								<input type="hidden" name="companyId" value="${company.id }">
								<button type="submit">View Subscriptions</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container row col card">
				<div class="card-title text-center">
					<h1>This user has been deactivated</h1>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>