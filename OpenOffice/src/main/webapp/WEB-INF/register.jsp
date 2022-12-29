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
	
	<form action="registering" method="post">
		<input type="text" placeholder="email" name="email"> <br>
		<input type="text" placeholder="username" name="username"> <br>
		<input type="password" placeholder="password" name="password">
		<input type="text" placeholder="first name" name="firstName"> <br>
		<input type="text" placeholder="last name" name="lastName"> <br>
		<input type="hidden" value="user" name="role">
		<input type="hidden" value="true" name="enabled">
		<br> <input type="submit" value="Register"> <br> 

	</form>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>
</html>