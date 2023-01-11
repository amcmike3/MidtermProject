<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Page For Admin</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container text-center">
		<div class="row">
			<div class="col card card-body matcha">
				<div class="title-container">
					<h2>Update User Page</h2>
				</div>
				<div class="yellow-containers">

					<form action="updatingAUser" method="post">

						<input type="hidden" name="id" value="${user.id }" /> <br>
						Username: <br> <input type="text" name="username"
							placeholder="${user.username }" /> <br> Password: <br>
						<input type="text" name="password" placeholder="${user.password }" />
						<br> First Name: <br> <input type="text"
							name="firstName" placeholder="${user.firstName }" /> <br>
						Last Name: <br> <input type="text" name="lastName"
							placeholder="${user.lastName }" /> <br> Email: <br> <input
							type="text" name="email" placeholder="${user.email }" /> <br>

						Profile Picture:(image url) <br> <input type="text"
							name="imgUrl" placeholder="${user.imgUrl }" /> <br>
						Description: <br>
						<textarea rows="4" cols="40" name="description">${user.description }</textarea>
						<br> <label for="enabled">Enabled?</label> <select
							id="enabled" name="enabled">
							<option value="true" <c:if test="${user.enabled}">selected</c:if>>Yes</option>
							<option value="false"
								<c:if test="${!user.enabled}">selected</c:if>>No</option>
						</select> |      | <label for="enabled">Admin?</label> <select
							id="enabled" name="enabled">
							<option value="true" <c:if test="${user.role}">selected</c:if>>Yes</option>
							<option value="false" <c:if test="${!user.role}">selected</c:if>>No</option>
						</select> <br> <input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>