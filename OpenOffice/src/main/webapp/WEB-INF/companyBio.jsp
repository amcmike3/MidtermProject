<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CompanyBio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row col card text-center">
			<h1>${company.name }</h1>
			<p>${company.description }
				<br>
			</p>
		</div>
		<div class="row">
			<div class="col card text-center">
				<a href="companyJobs?companyId=${company.id }">${company.name}
					Jobs </a>
			</div>
			<div class="col card text-center">
				<a href="review.do?companyId=${company.id }">Leave a review of
					${company.name } </a>
			</div>
		</div>
		<div class="row col">
			<img alt="A fancy company picture should be here" src="${company.images.get(0).imgUrl }">
		</div>
		<div class="row">
			<c:forEach var="review" items="${company.reviews }">
				<div class="col card">
					<p>
						<a href="userBio?userId=${review.user.id }">
							${review.user.username }</a> rated this company ${review.rating } out
						of 10 <br> this is what they had to say about
						${company.name}: <br> ${review.content }
					</p>
				</div>
			</c:forEach>
		</div>
		<div class="row col card">
			<a href="allReviews?companyId=${company.id }"> See all reviews of ${company.name }</a>
		</div>

	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>