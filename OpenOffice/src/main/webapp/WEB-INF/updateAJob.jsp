<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update A Job</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
<div class="container">
<div class="text-center matcha card" style="align-items: center; padding-top: 15px; padding-bottom: 35px;">
<div class="title-container zoom" style="padding-left: 100px; padding-right: 100px;">
				<h2>Update a Job</h2>
			</div>
			<div class="col-8 yellow-containers card zoom" style="padding-bottom: 35px;" >
		<form action="updatingAJob">
			<input id="id" name="id"
				type="hidden" value="${job.id}" placeholder="${job.id }"><br>
			
			<label for="Title">Title:</label><br>
			<input class="zoom" type="text" id="title" name="title" value="${job.title}"><br> <br>
			
			<label for="salary">Salary:</label><br> $<input
				class="zoom" type="number" id="salary" name="salary" value="${job.salary}"><br>
			<br>
			<label for="yearsExperience">Years of Experience Required:</label><br> <input type="number"
				class="zoom" id="location" name="yearsExperience" value="${job.yearsExperience}"><br>
			
			<br>
			<label for="skills">Skills:</label><br> <input
				class="zoom" type="text" id="skills" name="skills"
				value="${job.skills}"><br> 
			<br>
			<label for="education">Education:</label><br>
			<input class="zoom" type="text" id="education" name="education" value="${job.education}"><br>
			<br>
			<label for="certifications">Certifications:</label><br> <input type="text"
				class="zoom" id="benefits" name="certifications" value="${job.certifications}"><br> 
			<br>
			<label for="description">Description:</label><br>
			<input class="zoom" type="text" id="description" name="description" value="${job.description}"><br> <br>
			
			<label for="industry">Industry:</label>
			<br>
				<select class="zoom" name="industryId">
  			<c:forEach var="industry" items="${industryList }">
    			<option value="${industry.id}" <c:if test="${industry.id == job.industry.id }">selected</c:if>
    			>"${industry.name }"</option>
			
  			</c:forEach>
			</select> <br>
				
				<br> <br>
						
			<label for="enabled">Enable?</label> <select class="zoom" id="enabled"
				name="enabled" value="${job.enabled}">
				<option value="true" <c:if test="${job.enabled}">selected</c:if>>Yes</option>
				<option value="false" <c:if test="${!job.enabled}">selected</c:if>>No</option>
			</select> <br> <input class="zoom btn" style="margin-top: 30px;" type="submit">

		</form>
		</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>