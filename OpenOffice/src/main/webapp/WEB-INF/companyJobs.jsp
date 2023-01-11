<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${company.name } Jobs</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
	<div class="yellow-containers">
		<div class="row col card zoom text-center title-container">
			<h1>${company.name } Jobs</h1>
		</div>

		<c:forEach var="job" items="${ companyJobs}">
			<c:if test="${job.enabled }">
				<div class="row col card zoom yellow-containers">
					<h3>
						<a href="jobBio?jobId=${job.id }">${job.title }</a>
					</h3>
					<p>${ job.description }</p>
				</div>
			</c:if>
		</c:forEach>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>