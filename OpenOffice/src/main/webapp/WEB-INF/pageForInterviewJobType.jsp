<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview Job Type Selection</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="row col card text-center">
<h1>${company.name }</h1>

<h4>Please supply us with information about the job you interviewed for? </h4>

<form action="createJob.do" method="POST">

<input type="hidden" name="companyId" value="${company.id }">

  <label for="title">What is the title of the job you are applying for?</label><br>
  
  <input type="text"  name="title"><br>
  
  <label for="salary">What is the salary for this job?</label><br>
  
  <input type="text" name="salary"><br>
  
  <label for="yearsOfExperience">Years of experience required?</label><br>
  
  <input type="text"  name="yearsOfExperience"><br>
  
  <label for="skills">Skills required for position?</label><br>
  
  <input type="text"  name="skills"><br>
  
  <label for="education">Education required?</label><br>
  
  <input type="text" name="education"><br>
  
  <label for="certifications">Certifications required?</label><br>
  
  <input type="text" name="certifications"><br>
 
<!--   <label for="enabled">Is this company active?</label><br>
  
  <input type="text" name="enabled"><br> -->
  
  <label for="description">Please provide a brief description of job being offered.</label><br>
  
  <input type="text" name="description"><br>
  
  <select name="industryId">
  <c:forEach var="industry" items="${industryList }">
    <option value="${industry.id}">"${industry.name }"</option>
    <!-- <option value="industry.id">name</option>
    <option value="industry.id">name</option> -->
  </c:forEach>
</select> <br>
  
 <%--  <label for="name">Industry type?</label><br>
  
  <input type="text" name="${industry.name }"><br> --%>

  
  <button type="submit">Submit</button>

</form>
</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>