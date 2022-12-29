<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<h1>Register Test Make me pretty!!</h1>
	<c:choose>
		<c:when test="${notUniqueUsername}">
			<form action="registering" method="post">
				<input type="text" value="${user.email }" name="email"> <br>
				<input style="border-color: red; !important"  type="text" placeholder="${user.username } is not unique"  name="username"> <br>
				<input type="password" placeholder="password"  name="password"><br>
				<input type="text" value="${user.firstName }"  name="firstName">
				<br> <input type="text" value="${user.lastName }"  name="lastName">
				<br> <input type="hidden" value="user"  name="role">
				<input type="hidden" value="true" name="enabled">
				<input type="submit" value="Register"> <br>

			</form>

		</c:when>
		<c:when test="${notUniqueEmail}">
			<form action="registering" method="post">
				<input style="border-color: red; !important" type="text" placeholder="${user.email } is not unique" name="email"> <br>
				<input  type="text" value="${user.username }"  name="username"> <br>
				<input type="password" placeholder="password"  name="password"> <br>
				<input type="text" value="${user.firstName }"  name="firstName">
				<br> <input type="text" value="${user.lastName }"  name="lastName">
				<br> <input type="hidden" value="user"  name="role">
				<input type="hidden" value="true" name="enabled">
				<input type="submit" value="Register"> <br>

			</form>
		</c:when>
		<c:otherwise>



			<form action="registering" method="post">
				<input type="text" placeholder="email" name="email"> <br>
				<input type="text" placeholder="username" name="username"> <br>
				<input type="password" placeholder="password" name="password"> <br>
				<input type="text" placeholder="first name" name="firstName">
				<br> <input type="text" placeholder="last name" name="lastName">
				<br> <input type="hidden" value="user" name="role">
				<input type="hidden" value="true" name="enabled">
				<input type="submit" value="Register"> <br>

			</form>

		</c:otherwise>
	</c:choose>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>
</html>