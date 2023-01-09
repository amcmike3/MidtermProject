<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Interview Experience</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container">
		<div class="row">
			<div class="col card card-body text-center">
				<form action="updatingInterview">
					<input type="hidden" name="id" value="${interview.id }">
					<input type="hidden" name="companyId" value="${companyId }" /> <br />
					Title: <input type="text" name="title" value="${interview.title}" />
					<br /> What was their interview process like? <input type="text"
						name="process" value="${interview.process}" /> <br /> Did you get
					a job offer? <select id="jobOffered" name="jobOffered">
						<option value="false"
							${interview.jobOffered == 'false' ? 'select="selected"' : '' }>No</option>
						<option value="true"
							${interview.jobOffered == 'true' ? 'select="selected"' : '' }>Yes</option>
					</select> <br /> <input type="submit" value="Next" />
				</form>
			</div>
		</div>

		<c:forEach var="question" items="${interview.interviewQuestions }">
			<div class="row">
				<div class="col card">

					<div class="card-title">
						<h3>${question.title }</h3>
					</div>
					<p>
						${question.name } <br> ${question.description }

					</p>
					<form action="updateInterviewQuestion?questionId=${question.id }">
						<input type="hidden" name="companyId" value="${companyId }">
						<input type="hidden" name="interviewId" value="${interview.id }">
						<input type="submit" value="update">
						<input name="questionId" type="hidden" value="${question.id }">
					</form>
				</div>
			</div>
		</c:forEach>
	</div>


	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>