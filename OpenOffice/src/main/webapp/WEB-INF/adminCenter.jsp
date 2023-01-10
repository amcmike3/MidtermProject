<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Center</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="title-container text-center"
			style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>Admin Privileges</h1>
		</div>
		<hr>
		<div class="" id="admin-privileges-btn"
			style="width: 700px; margin: 0 auto;">
			<div class="">
				<form action="createCompany" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Create Company" />
				</form>
			</div>
			<div class="">

				<form action="updateCompany" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Update Company" />
				</form>
			</div>
			<div class="">

				<form action="updateUser" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Update User" />
				</form>
			</div>
			<div class="">

				<form action="updateJob" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Update Job" />
				</form>
			</div>
			<div class="">

				<form action="updateInterview" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Update Interview"/>
				</form>
			</div>
			<div class="">

				<form action="updateArticle" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Update Article" />
				</form>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>