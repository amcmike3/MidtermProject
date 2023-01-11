<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="title-container text-center zoom" style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>REGISTER A NEW ACCOUNT</h1>
		</div>
		<hr>
		<div class="yellow-containers zoom" style="max-width: 500px; min-width: 250px; min-height: 100px; margin: 0 auto;">
			<c:choose>
				<c:when test="${notUniqueUsername}">
					<form action="registering" method="post">
						<input type="text" value="${user.email }" name="email"> <input style="border-color: red; color: red; !important"
							type="text" placeholder="${user.username } is not unique"
							name="username"> <input type="password"
							placeholder="password" name="password"> <input
							type="text" value="${user.firstName }" name="firstName">
						<input type="text" value="${user.lastName }" name="lastName">
						<input type="hidden" value="${0 }" name="role"> <input
							type="hidden" value="true" name="enabled"> <input
							type="submit" value="Register">

					</form>

				</c:when>
				<c:when test="${notUniqueEmail}">
					<form action="registering" method="post">
						<input style="border-color: red; color: red; !important" type="text"
							placeholder="${user.email } is not unique" name="email">
						<br> <input type="text" value="${user.username }"
							name="username"> <br> <input type="password"
							placeholder="password" name="password"> <br> <input
							type="text" value="${user.firstName }" name="firstName">
						<br> <input type="text" value="${user.lastName }"
							name="lastName"> <br> <input type="hidden"
							value="${0 }" name="role"> <input type="hidden"
							value="true" name="enabled"> <input type="submit"
							value="Register"> <br>

					</form>
				</c:when>
				<c:otherwise>


					<form action="registering" method="post">
						<input type="text" placeholder="email" name="email"> <br>
						<input type="text" placeholder="username" name="username">
						<br> <input type="password" placeholder="password"
							name="password"> <br> <input type="text"
							placeholder="first name" name="firstName"> <br> <input
							type="text" placeholder="last name" name="lastName"> <br>
						<input type="hidden" value="${0 }" name="role"> <input
							type="hidden" value="true" name="enabled"> <input
							type="submit" value="Register"> <br>

					</form>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>
</html>