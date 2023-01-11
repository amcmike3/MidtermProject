<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${company.name } reviews</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="row">
			<div class="col title-container text-center title-container card">
				<div class="card-title">
					<h3>${company.name } reviews</h3>
				</div>
				<c:choose>
					<c:when test="${!empty company.reviews }">
						<c:forEach var="review" items="${company.reviews }">
							<c:if test="${review.enabled }">
								<div class="row col card yellow-containers zoom" style="margin: 15px;">
									<p>
										<a href="userBio?userId=${review.user.id }">
											${review.user.username }</a> rated this company ${review.rating }
										out of 10 <br> this is what they had to say about
										${company.name}: <br> ${review.content }
										<c:choose>
											<c:when test="${sessionScope.user.id == review.user.id}">
												<form action="deleteReview.do" method="POST">
													<input name="userId" value="${sessionScope.user.id}"
														type="hidden" />
													<button type="submit" name="reviewId" value="${review.id}">Delete</button>
												</form>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${sessionScope.user.id == review.user.id || sessionScope.user.role }">
												<form action="updateCompanyReview.do" method="post">
													<input type="hidden" name="companyId"
														value="${company.id }">
													<button type="submit" name="reviewId" value="${review.id}">Update</button>
												</form>
											</c:when>
										</c:choose>
								</div>
								<br />
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col card yellow-containers zoom">
								<p>
									<a href="review.do?companyId=${company.id }">Be the first
										to contribute</a>
								</p>
							</div>
						</div>

					</c:otherwise>

				</c:choose>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>