<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="title-container text-center zoom" style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>LOGIN TO AN EXISTING ACCOUNT</h1>
		</div>
		<hr>
		<div class="yellow-containers zoom" style="max-width: 500px; min-width: 250px; min-height: 100px; margin: 0 auto;">
			<form action="reviewJobLoggingIn" method="post">
			<input type="hidden" value="${jobId }" name="jobId">
				<input class="zoom" type="text" placeholder="username" name="username"> <br>
				<input class="zoom" type="password" placeholder="password" name="password">
				<br> <input class="zoom btn" type="submit" value="Log In">
				<input class="zoom btn" formaction="register" id="register-button" type="submit" name="register" value="Register" >
				<br>
			</form>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>