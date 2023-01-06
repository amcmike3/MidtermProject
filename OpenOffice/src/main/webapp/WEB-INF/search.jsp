<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Search</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="containers ">
		
		<div class="yellow-containers text-center">

			<form action="getUser.do" method="GET">
				Find Users by Username: <input type="text" name="username" required />
				<div class="btn">
					<input id="btnDisplay" type="submit" value="Show User" />
				</div>
			</form>
		</div>
		<div class="yellow-containers text-center">

			<form action="getCompany.do" method="GET">
				Find Companies by Name: <input type="text" name="name" required />
				<div class="btn">
					<input id="btnDisplay"  type="submit"
						value="Show Company" />
				</div>
			</form>
		</div>
		<div class="yellow-containers text-center">

			<form action="getJob.do" method="GET">
				Find Jobs by Title: <input type="text" name="title" required />
				<div class="btn">
					<input id="btnDisplay" type="submit" value="Show Job" />
				</div>
			</form>
		</div>
		<div class="row card yellow-containers">
			<div class="containers btn text-center ">
				<form action="allUser.do" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Show All Users" />
				</form>
			</div>
			<div class="containers btn text-center ">

				<form action="allCompanies.do" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Show All Companies" />
				</form>
			</div>
			<div class="containers text-center btn show-all-btn">

				<form action="allJobs.do" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Show All Jobs" />
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@include file="bootstrapFoot.jsp"%>
</body>
</html>