<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${company.name } jobs</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row col card">
			<h1>${company.name } jobs</h1>
		</div>
	
	<c:forEach var="job" items="${ companyJobs}">
		<div class="row col card">
			<h3>${job.title }</h3>
			<p>${ job.description }</p>
		</div>
	</c:forEach>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>