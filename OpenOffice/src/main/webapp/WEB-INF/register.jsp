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
		<div class="title-container text-center zoom"
			style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>REGISTER A NEW ACCOUNT</h1>
		</div>
		<hr>
		<div class="yellow-containers zoom"
			style="max-width: 500px; min-width: 250px; min-height: 100px; margin: 0 auto;">
			<c:choose>
				<c:when test="${notUniqueUsername}">
					<form action="registering" method="post">
						<input class="zoom" type="text" value="${user.email }"
							name="email"> <input
							style="border-color: red; color: red; background-color: red; !important" type="email"
							placeholder="${user.username } is not unique" name="username">
						
						
						<input type="password" placeholder="password" name="password">
						
						
						<input class="zoom" type="text" value="${user.firstName }"
							name="firstName"> 
							
							
							<input class="zoom" type="text"
							value="${user.lastName }" name="lastName">
							
							
							 <input
							type="hidden" value="${0 }" name="role"> 
							
							
							<input
							type="hidden" value="true" name="enabled"> 
							
							
							<input
							class="zoom" type="submit" value="Register"> 
							
							
							<input
							type="hidden" name="imgUrl"
							value="https://img1.picmix.com/output/stamp/normal/9/2/9/0/180929_2e51a.png">

					</form>

				</c:when>
				<c:when test="${notUniqueEmail}">
					<form action="registering" method="post">
						<input class="zoom"
							style="border-color: red; color: red; background-color: red !important;" type="email"
							placeholder="${user.email } is not unique" name="email">
						<br> <input class="zoom" type="text"
							value="${user.username }" name="username"> <br> <input
							class="zoom" type="password" placeholder="password"
							name="password"> <br> <input class="zoom"
							type="text" value="${user.firstName }" name="firstName">
						<br> <input class="zoom" type="text"
							value="${user.lastName }" name="lastName"> <br> <input
							type="hidden" value="${0 }" name="role"> <input
							type="hidden" value="true" name="enabled"> <input
							class="zoom" type="submit" value="Register"> <br> <input
							type="hidden" name="imgUrl"
							value="https://img1.picmix.com/output/stamp/normal/9/2/9/0/180929_2e51a.png">

					</form>
				</c:when>
				<c:otherwise>


					<form action="registering" method="post">
						<input class="zoom" type="email" placeholder="email" name="email">
						<br> <input class="zoom" type="text" placeholder="username"
							name="username"> <br> <input class="zoom"
							type="password" placeholder="password" name="password"> <br>
						<input class="zoom" type="text" placeholder="first name"
							name="firstName"> <br> <input class="zoom"
							type="text" placeholder="last name" name="lastName"> <br>
						<input type="hidden" value="${0 }" name="role"> <input
							type="hidden" value="true" name="enabled"> <input
							class="zoom" type="submit" value="Register"> <br> <input
							type="hidden" name="imgUrl"
							value="https://img1.picmix.com/output/stamp/normal/9/2/9/0/180929_2e51a.png">

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