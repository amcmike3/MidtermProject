<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Interviews</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<h1>All Interview Experiences for ${job.title }</h1>
	<c:forEach var="interview" items="${interviews }">
		<div class="row">
			<div class="col card">

				<div class="card-title">
					<h3>
						<a href="">${question.title }</a>
					</h3>
				</div>
				<p>
					${question.name } <br> ${question.description }

				</p>
			</div>
		</div>
	</c:forEach>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>