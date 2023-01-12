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
						<div class="card yellow-containers zoom"
							style="max-height: 550px; width: 350px; justify-content: center; padding-top: 40px;">
							<div class="title-container zoom">${user.firstName }
								${user.lastName }</div>
							<div class="card-body">
								<img class="user-bio-pic zoom" src="${user.imgUrl }">
							</div>

							<c:if test="${sessionScope.user.role }">
								<br>
								<a href="updatAUser?userId=${user.id }"><button
										class="zoom btn" style="color: white; margin-bottom: 70px;">Update</button></a>
								<br>
							</c:if>
						</div>
						<div class="card-body matcha"
							style="min-width: 200px; max-width: 600px; padding-left: 50px; padding-right: 50px;">

							<div class="title-container zoom"
								style="margin-top: 50px; min-width: 200px;">
								<h3>Description:</h3>
							</div>
							<br>
							<div class="card yellow-containers zoom"
								style="min-height: 400px; min-width: 200px; padding: 75px;">
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

						<div class="card-body yellow-containers zoom"
							style="min-width: 210px;">
							<div class="title-container zoom" style="margin-top: 50px;">
								<h3>Contributions:</h3>
							</div>

							<br>
							<!-- Need a second look at the logic below -->
							<c:choose>
								<c:when test="${!empty user.reviews }">
									<c:forEach var="review" items="${user.reviews }">
										<div class="card yellow-containers zoom">
											<p>
												<a href="companyBio?companyId=${review.company.id }">
													${review.company.name }</a> rating: ${review.rating } out of 10
												<br> you said: <br> ${review.content }
											</p>
										</div>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="card yellow-containers zoom">
										<p>No contributions at this time</p>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
						<div class="card-body yellow-containers zoom"
							style="min-width: 210px; margin-top: 50px;">

							<div class="title-container zoom" style="margin-top: 50px;">
								<h3>Articles written by ${user.username}</h3>
							</div>
							<br>
							<c:choose>
								<c:when test="${!empty user.articles }">
									<c:forEach var="article" items="${user.articles }">
										<div class="card yellow-containers zoom">
											<p>
												<a href="articleBio?articleId=${article.id }">
													${article.title }</a>
											</p>
										</div>
									</c:forEach>

								</c:when>
								<c:otherwise>
									<div class="card yellow-containers zoom">
										<p>
											No articles written by this user at this time
										</p>
									</div>
								</c:otherwise>
							</c:choose>
							<br />
							<form action="createArticle.do" method="get">
								<br>
								<button class="zoom btn" id="add-company-btn" type="submit">Add
									Article</button>
								<br>
							</form>
							<br />
						</div>
						<div class="card-body yellow-containers zoom"
							style="min-width: 210px; margin-top: 50px;">
							<div class="title-container zoom" style="margin-top: 50px;">
								<h3>Subscription:</h3>
							</div>
							<br>
							<c:forEach var="company" varStatus="loop"
								items="${user.companies}">
								<c:if test="${loop.index <= 1 }">
									<div class="card yellow-containers zoom">
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
								<button class="zoom btn" id="add-company-btn" type="submit">View
									Subscriptions</button>
								<br> <br>
							</form>

						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container row col card zoom">
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