<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update A Interview</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>


	<div class="containers text-center">
		<div class="row">
			<div class="col  text-center">
				<div class="card-title title-container zoom">
					<h3>Update a Interview</h3>
				</div>
				<div class="text-center yellow-containers zoom">
					<form action="updatingAInterview" method="post">
						<input type="hidden" name="id" value="${interview.id }"> <input
							type="hidden" name="companyId" value="${companyId }" /> <br />
						Title: <input class="zoom" type="text" name="title" value="${interview.title}" />
						<br /> <br> What was their interview process like? <br /> <br>
							<textarea class="zoom" name="process" rows="4" cols="40">${interview.process}</textarea>
							 <br /> <br>
						Did they get a job offer? <br /> <br> <select class="zoom" id="jobOffered"
							name="jobOffered">
							<option value="false"
								<c:if test="${interview.jobOffered }">selected</c:if>>No</option>
							<option value="true"
								<c:if test="${interview.jobOffered }">selected</c:if>>Yes</option>

						</select> <br><br /> <input class="zoom btn" type="submit" value="Update" />
						<br>
					</form>
				</div>
				<br/>


				<c:forEach var="question" items="${interview.interviewQuestions }">
					<div class="row">
						<div class="yellow-containers zoom text-center">

							<div class="card-title">
								<h3>${question.title }</h3>
							</div>
							<p>
								${question.name } <br> ${question.description }

							</p>
							<br>
							<form action="updateInterviewQuestion?questionId=${question.id }">
								<input type="hidden" name="companyId" value="${companyId }">
								<input type="hidden" name="interviewId" value="${interview.id }">
								<br>
								<input class="zoom btn" type="submit" value="Update"> <input
									name="questionId" type="hidden" value="${question.id }">
							</form>
							<br>
						</div>
					</div>
					<br/>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>