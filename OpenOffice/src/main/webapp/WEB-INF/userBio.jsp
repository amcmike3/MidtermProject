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
					<div class="yellow-containers"
						style="display: flex; flex-direction: row; flex-wrap: wrap; padding-left: 25px; padding-right: 25px;">
						<div class="card yellow-containers"
							style="display: flex; flex-direction: column; flex-wrap: wrap; max-height: 500px; width: 350px; justify-content: center;">
							<div class="card-title title-container">${user.firstName }
								${user.lastName }</div>
							<div class="card-body">
								<img class="user-bio-pic zoom" src="${user.imgUrl }">
							</div>

							<c:if test="${sessionScope.user.role }">
								<a href="updatAUser?userId=${user.id }"><button>Update</button></a>
							</c:if>
						</div>
						<div class="card-body card yellow-containers"
							style="min-width: 200px; padding-left: 50px; padding-right: 50px;">

							<div class="title-container" style="margin-top: 50px; min-width: 250px;">
								<h3>Description:</h3>
							</div>
							<br>
							<div class="card yellow-containers"
								style="min-height: 400px; min-width: 250px; padding: 75px;">
								<c:choose>
									<c:when test="${user.description != null}">
										<p>${user.description}</p>
									</c:when>
									<c:otherwise>
										<p>No description</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>

					<div class="col">

						<div class="card-body yellow-containers" style="min-width: 210px;">
							<div class="title-container" style="margin-top: 50px;">
								<h3>Contributions:</h3>
							</div>

							<br>
							<c:forEach var="review" items="${user.reviews }">
								<div class="card yellow-containers">
									<p>
										<a href="companyBio?companyId=${review.company.id }">
											${review.company.name }</a> rating: ${review.rating } out of 10 <br>
										you said: <br> ${review.content }
									</p>
								</div>

							</c:forEach>
						</div>
						<div class="card-body yellow-containers"
							style="min-width: 210px; margin-top: 50px;">

							<div class="title-container" style="margin-top: 50px;">
								<h3>Articles written by ${user.username}</h3>
							</div>
							<br>
							<c:forEach var="article" items="${user.articles }">
								<div class="card yellow-containers">
									<p>
										<a href="articleBio?articleId=${article.id }">
											${article.title }</a>
									</p>
								</div>
							</c:forEach>
							<br />
							<form action="createArticle.do" method="get">
								<br>
								<button id="add-company-btn" type="submit">Add Article</button>
								<br>
							</form>
							<br />
						</div>
						<div class="card-body yellow-containers"
							style="min-width: 210px; margin-top: 50px;">
							<div class="title-container" style="margin-top: 50px;">
								<h3>Subscription:</h3>
							</div>
							<br>
							<c:forEach var="company" varStatus="loop"
								items="${user.companies}">
								<c:if test="${loop.index <= 1 }">
									<div class="card yellow-containers">
										<p>
											<a href="companyBio?companyId=${company.id}">${company.name }</a>
										</p>
									</div>
								</c:if>
							</c:forEach>
							<form action="viewSubscription.do" method="get">
								<input type="hidden" name="userId" value="${user.id }">
								<input type="hidden" name="companyId" value="${company.id }">
								<br>
								<button id="add-company-btn" type="submit">View
									Subscriptions</button>
								<br> <br>
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