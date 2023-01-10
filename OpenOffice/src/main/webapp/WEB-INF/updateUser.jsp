<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserBio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col card card-body matcha">
			<form action="updatingUser">
			<input type="hidden" name="id" value="${sessionScope.user.id }"/>
			Description: <br>
			<input type="text" name="description" placeholder="${sessionScope.user.description }"/>
			<br>
			First Name: <br>
			<input type="text" name="firstName" placeholder="${sessionScope.user.firstName }"/>
			<br>
			Last Name: <br>
			<input type="text" name="lastName" placeholder="${sessionScope.user.lastName }"/>
			<br>
			UserName: <br>
			<input type="text" name="username" placeholder="${sessionScope.user.username }"/>
			<br>
			Email: <br>
			<input type="text" name="email" placeholder="${sessionScope.user.email }"/>
			<br>
			Profile Picture:(image url) <br>
			<input type="text" name="imgUrl" value="${sessionScope.user.imgUrl }"/>
			<br>
			<input type="submit" value="Update"/>
			</form>
			</div>
		</div>
		<div>
			<div class="col card-body text-center cream" style="margin-top: 75px;">
				<form action="deleteUser">
				<input type="submit" value="Delete Profile"/>
				<input type="hidden" name="id" value="${sessionScope.user.id }"/>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>