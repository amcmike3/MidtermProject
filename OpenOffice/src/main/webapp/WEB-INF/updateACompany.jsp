<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Update Company Page</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="text-center matcha card"
			style="align-items: center; padding-top: 15px; padding-bottom: 35px;">
			<div class="title-container zoom">
				<h2>Update ${fn:toUpperCase(company.name) }</h2>
			</div>
			<div class="col-8 yellow-containers card"
				style="padding-bottom: 35px;">
				<form action="updatingACompany" method="post">

					<input id="id" name="id" type="hidden" value="${company.id}"><br>

					<label for="name">Name of Company:</label><br> <br><input
						class="zoom" type="text" id="name" name="name" placeholder="${company.name}"><br>
						<br>

					<label for="location">Location:</label><br> <br><input class="zoom" type="text"
						id="location" name="location" placeholder="${company.location}"><br>
						<br>
					<label for="description">Description:</label><br><br>
					<textarea class="zoom" id="description" name="description" rows="5" cols="40" placeholder="${company.description}"></textarea>
					<br> 
					<br>
					<label for="enabled">Enable?</label> <select class="zoom" id="enabled"
						name="enabled">
						<option value="true"
							<c:if test="${company.enabled}">selected</c:if>>Yes</option>
						<option value="false"
							<c:if test="${!company.enabled}">selected</c:if>>No</option>
					</select> 
					<br>
					<br> 
					<input class="zoom" type="submit">
					<br>
					<br>


				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>