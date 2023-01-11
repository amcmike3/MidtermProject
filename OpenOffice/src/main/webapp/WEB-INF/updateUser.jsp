<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Bio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">

		<div class="row">
			<div class="col card card-body matcha " style="align-items: center;">
				<div class="title-container text-center zoom"
					style="padding-left: 50px; padding-right: 50px;">
					<h1>Update User</h1>
				</div>
				<div class="yellow-containers text-center col-8 zoom">
					<form action="updatingUser">
						<input type="hidden" name="id" value="${sessionScope.user.id }" />
						<br> Description: <br> <input type="text"
							name="description"
							placeholder="${sessionScope.user.description }" /> <br>
						First Name: <br> <input type="text" name="firstName"
							placeholder="${sessionScope.user.firstName }" /> <br> Last
						Name: <br> <input type="text" name="lastName"
							placeholder="${sessionScope.user.lastName }" /> <br>
						UserName: <br> <input type="text" name="username"
							placeholder="${sessionScope.user.username }" /> <br> Email:
						<br> <input type="text" name="email"
							placeholder="${sessionScope.user.email }" /> <br> Profile
						Picture:(image url) <br> <input type="text" name="imgUrl"
							value="${sessionScope.user.imgUrl }" /> <br> <br /> <input
							type="submit" value="Update" /> <br /> <br />
					</form>
				</div>
				<div class="yellow-containers text-center col-8">
					<form action="deleteUser">
						<input type="submit" value="Delete Profile" /> <input
							type="hidden" name="id" value="${sessionScope.user.id }" />
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>