<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div class="col card card-body text-center">
			<form action="updatingUser">
			Description:
			<input type="text" placeholder="${sessionScope.user.description }"/>
			<br/>
			First Name:
			<input type="text" placeholder="${sessionScope.user.firstName }"/>
			<br/>
			Last Name:
			<input type="text" placeholder="${sessionScope.user.lastName }"/>
			<br/>
			UserName:
			<input type="text" placeholder="${sessionScope.user.username }"/>
			<br/>
			Email:
			<input type="text" placeholder="${sessionScope.user.email }"/>
			<br/>
			Profile Picture:(image url)
			<input type="text" placeholder="${sessionScope.user.imgUrl }"/>
			<input type="submit" value="Update"/>
			</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>