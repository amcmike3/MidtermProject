<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Page For Admin</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
<div class="container">
		<div class="row">
			<div class="col card card-body matcha">
			<form action="updatingUser">
			<label>User ID:</label>
			<input type="text" name="id" value="${user.id }"/>
			Description: <br>
			<input type="text" name="description" placeholder="${user.description }"/>
			<br>
			Username: <br>
			<input type="text" name="username" placeholder="${user.username }"/>
			<br>
			Password: <br>
			<input type="text" name="password" placeholder="${user.password }"/>
			<br>
			Role: <br>
			<input type="text" name="role" placeholder="${user.role }"/>
			<br>
			First Name: <br>
			<input type="text" name="firstName" placeholder="${user.firstName }"/>
			<br>
			Last Name: <br>
			<input type="text" name="lastName" placeholder="${user.lastName }"/>
			<br>
			
			Email: <br>
			<input type="text" name="email" placeholder="${user.email }"/>
			<br>
			Profile Picture:(image url) <br>
			<input type="text" name="imgUrl" value="${user.imgUrl }"/>
			<br>
			Articles: <br>
			<input type="text" name="articles" placeholder="${user.articles }"/>
			<br>
			Reviews: <br>
			<input type="text" name="reviews" placeholder="${user.reviews }"/>
			<br>
			Interviews: <br>
			<input type="text" name="interviews" placeholder="${user.interviews }"/>
			<br>
			Subscriptions: <br>
			<input type="text" name="companies" placeholder="${user.companies }"/>
			<br>
			 <label for="">Enable?</label> <select
				id="enabled" name="enabled">
				<option value="true">Yes</option>
				<option value="false">No</option>
				</select> <br> 
			<input type="submit" value="Update"/>
			</div>
			</form>
			</div>
		</div>
		<div>
			<div class="col card-body text-center cream" style="margin-top: 75px;">
				<form action="deleteUser">
				<input type="submit" value="Delete My Profile"/>
				<input type="hidden" name="id" value="${user.id }"/>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>