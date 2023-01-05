<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers">
	<h1>Login Page Test Make Me Pretty!!</h1>
	<form action="loggingIn" method="post">
		<input type="text" placeholder="username" name="username"> <br>
		<input type="password" placeholder="password" name="password">
		<br> <input type="submit" value="Log In"> <br> 

	</form>
	<a href="register">
		<h5>register</h5>
	</a>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>