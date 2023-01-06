<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview Bio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	
	<div class="container">
		<div class="row col card text-center">
			<h1>${interview.title } for ${interview.job.title }</h1>
			<p>${interview.process }
				<br>
			</p>
		</div>
		
		<c:forEach var="question" items="${interview.interviewQuestions }">
			<div class="row">
				<div class="col card">
				
				<div class="card-title">
					<h3>${question.title }</h3>
				</div>
					<p>
					${question.name }
					<br>
					${question.description }
					
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>