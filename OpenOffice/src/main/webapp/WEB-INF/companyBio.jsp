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
	<div class="containers">
		<div class="row col card text-center yellow-containers">
			<h1>${company.name }</h1>
			<p>${company.description }
				<br>
			</p>
		</div>
		<div class="row">
			<div class="col card text-center yellow-containers">
				<a href="companyJobs?companyId=${company.id }">${company.name}
					Jobs </a>
			</div>
			<div class="col card text-center yellow-containers">
				<a href="review.do?companyId=${company.id }">Leave a review of
					${company.name } </a>
			</div>
		</div>
		<div class="row col yellow-containers">
			<img alt="A fancy company picture should be here"
				src="${company.images.get(0).imgUrl }">
		</div>
		<div class="row col card text-center yellow-containers">
			<h1>Reviews:</h1>
		</div>
		<c:forEach var="review" items="${company.reviews }">
			<div class="row">
				<div class="col card yellow-containers">

					<p>
						<a href="userBio?userId=${review.user.id }">
							${review.user.username }</a> rated this company ${review.rating } out
						of 10 <br> this is what they had to say about
						${company.name}: <br> ${review.content }
					</p>
				</div>
			</div>
		</c:forEach>

		<div class="row col card yellow-containers">
			<a href="allReviews?companyId=${company.id }"> See all reviews of
				${company.name }</a>
		</div>
		<div class="row col card text-center yellow-containers">
			<h1>Jobs:</h1>
		</div>

		<c:forEach var="i" begin="0" end="5" step="3">
			<div class="row">
				<c:forEach var="job" items="${company.jobs }" begin="${i }"
					end="${i + 3 }">
					<div class="col card yellow-containers">
						<p>
							<a href="jobBio?jobId=${job.id}"> ${job.title }</a>
						</p>
					</div>
				</c:forEach>
			</div>
		</c:forEach>

	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>