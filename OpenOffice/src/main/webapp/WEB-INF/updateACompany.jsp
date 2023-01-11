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
			<div class="title-container">
				<h2>Update ${fn:toUpperCase(company.name) }</h2>
			</div>
			<div class="col-8 yellow-containers card"
				style="padding-bottom: 35px;">
				<form action="updatingACompany" method="post">

					<input id="id" name="id" type="hidden" value="${company.id}"><br>

					<label for="name">Name of Company:</label><br> <input
						type="text" id="name" name="name" value="${company.name}"><br>

					<label for="location">Location:</label><br> <input type="text"
						id="location" name="location" value="${company.location}"><br>
					<label for="description">Description:</label><br>
					<textarea id="description" name="description" rows="5" cols="40">${company.description}</textarea>
					<br> <label for="enabled">Enable?</label> <select id="enabled"
						name="enabled">
						<option value="true"
							<c:if test="${company.enabled}">selected</c:if>>Yes</option>
						<option value="false"
							<c:if test="${!company.enabled}">selected</c:if>>No</option>
					</select> <br> <input type="submit">


				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>