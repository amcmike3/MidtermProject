<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a Job</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="row">
			<div class="col title-container text-center title-container zoom">
				<div class="card-title">
					<h3>${company.name }</h3>
				</div>
				<div class="card-body yellow-containers">
					<h4>Tell us about the job you interviewed for?</h4>
					<form action="createJob.do" method="POST">

			<input type="hidden" name="companyId" value="${company.id }">

			<label for="title">What is the title of the job you are
				applying for?</label><br> <input type="text" name="title"><br>

			<label for="salary">What is the salary for this job?</label><br>

			<input type="number" name="salary"><br> <label
				for="yearsOfExperience">Years of experience required?</label><br>

			<input type="number" name="yearsOfExperience"><br> <label
				for="skills">Skills required for position?</label><br> <input
				type="text" name="skills"><br> <label for="education">Education
				required?</label><br> <input type="text" name="education"><br>

			<label for="certifications">Certifications required?</label><br>

			<input type="text" name="certifications"><br>

			<label for="description">Please provide a brief description
				of job being offered.</label><br>

			<textarea name="description" rows="4" cols="40"></textarea>
			<br> <select name="industryId">
				<c:forEach var="industry" items="${industryList }">
					<option value="${industry.id}">"${industry.name }"</option>
				
				</c:forEach>
			</select> <br> <br>

			<button type="submit">Submit</button>

		</form></div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>