<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CompanyBio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<c:choose>
	<c:when test="${company.enabled }">
	<div class="containers">
		<div class="row col card text-center title-container">
			<h1>${company.name }</h1>
			<p>${company.description }
				<br>
			</p>
			<c:if test="${sessionScope.user.role }">
				<a href="updateACompany?companyId=${company.id }"><button>Update</button></a>
			</c:if>
		</div>
		<div class="row">
			<div class="col card text-center white-containers">
				<a href="companyJobs?companyId=${company.id }">${company.name}
					Jobs </a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.user != null }">
					<div class="col card text-center white-containers">
						<a href="review.do?companyId=${company.id }">Leave a review of
							${company.name } </a>

					</div>
				</c:when>
				<c:otherwise>
					<div class="col card text-center white-containers">
						<a href="reviewLogin?companyId=${company.id }">Leave a review
							of ${company.name } </a>
					</div>

				</c:otherwise>
			</c:choose>
		</div>
		<hr>
		<div class="white-containers text-center">
			<c:choose>
				<c:when test="${sessionScope.user.id != null}">
					<input name="userId" value="${sessionScope.user.id}" type="hidden" />
					<form action="subscribe.do" method="GET">
						<input name="userId" value="${user.id}" type="hidden" /> <input
							name="companyId" value="${company.id}" type="hidden" />
						<button type="submit">Subscribe</button>
					</form>
				</c:when>
			</c:choose>
		</div>
		<hr>
		<div class="row col">
			<img class="company-pic" alt="A fancy company picture should be here"
				src="${company.images.get(0).imgUrl }">
		</div>
		<hr>
		<div class="row col card text-center title-container">
			<h1>Reviews</h1>
		</div>
		<c:choose>
			<c:when test="${empty company.reviews }">
				<div class="row">
					<div class="col card white-containers">
						<p>
							<a href="review.do?companyId=${company.id }">Be the first to
								contribute</a>
						</p>
					</div>
				</div>

			</c:when>
			<c:otherwise>


				<c:forEach var="review" items="${company.reviews }">
					<c:if test="${company.enabled }">
						<div class="row">
							<div class="col card white-containers">

								<p>
									<a href="userBio?userId=${review.user.id }">
										${review.user.username }</a> rated this company ${review.rating }
									out of 10 <br> this is what they had to say about
									${company.name}: <br> ${review.content }
								</p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:otherwise>

		</c:choose>

		<hr>

		<div class="row col card white-containers text-center">
			<a href="allReviews?companyId=${company.id }"> See all reviews of
				${company.name }</a>
		</div>

		<hr>
		<div class="row col card text-center title-container">
			<h1>Jobs</h1>
		</div>

		<div class="row col card text-center white-containers">
			<c:choose>
				<c:when test="${!empty company.jobs}">
					<c:forEach var="i" begin="0" end="5" step="3">
						<div class="row">
							<c:forEach var="job" items="${company.jobs }" begin="${i }"
								end="${i + 3 }">
								<c:if test="${job.enabled }">
									<div class="col ">
										<p>
											<a href="jobBio?jobId=${job.id}"> ${job.title }</a>
										</p>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col ">
							<p>No interviews have been published for this company at this
								time.</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<hr>
		<div class="row col card white-containers text-center">
			<a href="pageForInterviewJobType.do?companyId=${company.id}">
				Tell us about your interview experience with ${company.name }</a>
		</div>
		<hr>
		<div class="row col card text-center title-container">
			<h1>Interviews</h1>
		</div>

		<c:forEach var="job" items="${company.jobs }">
			<div class="white-containers text-center">
				<c:set var="jobTitle" value="${fn:toUpperCase(job.title)}" />
				<a href="jobBio?jobId=${job.id}">${jobTitle}</a>
				<hr class="company-bio-hr">

				<c:forEach var="interview" items="${job.interviews }">
						<div class="col">
							<a id="interview-job-link"
								href="interviewBio?interviewId=${interview.id}">${interview.title }</a>
								<c:if test="${interview.user.id == sessionScope.user.id }">
									<form
										action="updateInterview?interviewId=${interview.id}&companyId=${company.id}">
										<input type="hidden" name="interviewId"
											value="${interview.id }"> <input type="hidden"
											name="companyId" value="${company.id }"> <input
											type="submit" value="update">
									</form>

								</c:if>
							</div>
				</c:forEach>
			</div>
		</c:forEach>

	</div>
	</c:when>
	<c:otherwise>
	<div class="containers">
		<div class="row col card text-center title-container">
		<h1>This Company has been Deactivated</h1>
		</div>
		</div>
	</c:otherwise>
	</c:choose>
	

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>