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
	<h1>Login Page Test FIX MEE</h1>
	<form action="loggingIn" method="post">
	<input type="text" placeholder="username" name="username">
	<input type="password" placeholder="password" name="password">
	<input type="submit" value="Log In">
	
	</form>


	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>