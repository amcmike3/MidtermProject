<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${job.title }</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="yellow-containers">
		<div class="row col card text-center title-container">
			<h1>${job.title }at${job.company.name }</h1>
			<p>${job.description }
				<br>
			</p>
		</div>
		<div class="row">
			<div class="col text-center white-containers">
				<a href="allInterviews?jobId=${job.id }">${job.title} Interview
					experiences </a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.user != null }">
					<div class="col card text-center white-containers">
						<div class="col text-center white-containers">
							<a href="sendToCreateInterview?jobId=${job.id }">Leave an
								interview experience at ${job.company.name } </a>
						</div>

					</div>
				</c:when>
				<c:otherwise>
					<div class="col card text-center white-containers">
						<a href="reviewJobLogin?jobId=${job.id }">Leave an interview
							experience at ${job.company.name }</a>
					</div>

				</c:otherwise>
			</c:choose>

		</div>
		<hr>
		<div class="title-container text-center">
			<h1>Interviews</h1>
		</div>
		<c:forEach var="interview" items="${job.interviews }">
			<div class="row white-containers">
				<div class="col text-center" style="margin: 10px;">
					<c:if test="${sessionScope.user.id == interview.user.id }">
						<h4 class="bg-danger">Your Contribution:</h4>
						<form action="updateInterview">
							<input type="hidden" name="companyId" value="${job.company.id}" />
							<input type="hidden" name="interviewId" value="${interview.id }" />
							<input type="submit" value="update" />
						</form>
					</c:if>
					<p>
						<a href="interviewBio?interviewId=${interview.id }">
							${interview.title }</a>
					</p>
				</div>
			</div>
		</c:forEach>
		<form action="createArticle.do" method="get">
  					<button type="submit" style="center">Add Article</button>
 					 </form>
		<hr>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>