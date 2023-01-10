<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Baseline</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div>
		<form>
			<label for="id">Company ID:</label> <input id="id" name="id"
				type="text" value="${company.id}" placeholder="${company.id }">
			
			<label for="name">Name of Company:</label><br> <input
				type="text" id="name" name="name" value="${company.name}"><br>

			<label for="location">Location:</label><br> <input type="text"
				id="location" name="location" value="${company.location}"><br>
			
			
			<label for="description">Description:</label><br> <input
				type="text" id="description" name="description"
				value="${company.description}"><br> 
				
			<label for="users">Users:</label><br>
			<input type="text" id="users" name="users" value="${company.users}"><br>
			
			<label for="benefits">Benefits:</label><br> <input type="text"
				id="benefits" name="benefits" value="${company.benefit}"><br> 
				
			<label for="images">Images:</label><br>
			<input type="text" id="images" name="images" value="${company.images}"><br> <br>
			
			<label for="jobs">Jobs:</label><br> <input type="text" id="jobs"
				name="jobs" value="${company.jobs}"><br> <br>
				
			 <label for="reviews">Reviews:</label><br>
			<input type="text" id="reviews" name="reviews" value="${company.reviews}"><br> <br>
			<br> 
			
			<label for="enabled">Enable?</label> <select id="enabled"
				name="enabled" value="${company.enabled}">
				<option value="true">Yes</option>
				<option value="false">No</option>
			</select> <br> <input type="submit">
		</form>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>