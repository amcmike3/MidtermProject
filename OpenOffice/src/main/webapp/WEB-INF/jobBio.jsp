<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${job.title }</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row col card text-center">
			<h1>${job.title } at ${job.company.name }</h1>
			<p>${job.description }
				<br>
			</p>
		</div>
		<div class="row">
			<div class="col card text-center">
				<a href="allInterviews?jobId=${job.id }">${job.title}
					Interview experiences </a>
			</div>
			<div class="col card text-center">
				<a href="sendToCreateInterview?jobId=${job.id }">Leave an interview experience at
					${job.company.name } </a>
			</div>
		</div>
		<c:forEach var="interview" items="${job.interviews }">
			<div class="row">
				<div class="col card">
					<p>
						<a href="interviewBio?interviewId=${interview.id }">
							${interview.title }</a> 
					</p>
				</div>
			</div>
		</c:forEach>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>