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
<div>
		<form>
			<label for="id">Job ID:</label> <input id="id" name="id"
				type="text" value="${job.id}" placeholder="${job.id }"><br>
			
			<label for="salary">Salary:</label><br> <input
				type="text" id="salary" name="name" value="${job.salary}"><br>

			<label for="yearsExperience">Years of Experience Required:</label><br> <input type="text"
				id="location" name="yearsExperience" value="${job.yearsExperience}"><br>
			
			
			<label for="skills">Skills:</label><br> <input
				type="text" id="skills" name="skills"
				value="${job.skills}"><br> 
				
			<label for="education">Education:</label><br>
			<input type="text" id="education" name="education" value="${job.education}"><br>
			
			<label for="certifications">Certifications:</label><br> <input type="text"
				id="benefits" name="certifications" value="${job.certifications}"><br> 
				
			<label for="description">Description:</label><br>
			<input type="text" id="description" name="description" value="${job.description}"><br> <br>
			
			<%-- <%-- abel for="industry">Industry:</label><br> <input type="text" id="jobs"
				name="industry" value="${job.industry}"> --%>
				<select name="industryId">
  			<c:forEach var="industry" items="${industryList }">
    			<option value="${industry.id}">"${industry.name }"</option>

  			</c:forEach>
			</select> <br>
				
				<br> <br>
				
			 <label for="company">Company:</label><br>
			<input type="text" id="company" name="company" value="${job.company}"><br> <br>
			<br> 
			
			 <label for="Title">title:</label><br>
			<input type="text" id="title" name="title" value="${job.title}"><br> <br>
			<br> 
			
			<label for="enabled">Enable?</label> <select id="enabled"
				name="enabled" value="${job.enabled}">
				<option value="true">Yes</option>
				<option value="false">No</option>
			</select> <br> <input type="submit">

		</form>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>