<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
		<div class="title-container text-center" style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>SEARCH BY USER, COMPANY, OR JOB</h1>
		</div>
		<hr>
		<div class="yellow-containers" style="width: 600px; min-height: 100px; margin: 0 auto;">
		<div id="search-form" style="margin-left: 100px;">

			<form action="getUser.do" method="GET">
				<input type="text" placeholder="search by username" name="username"
					required />
				<div class="btn">
					<input id="btnDisplay" type="submit" value="Show User" />
				</div>
			</form>
		</div>
		<div style="margin-left: 100px;">
			<form action="getCompany.do" method="GET">
				<input type="text" placeholder="search by company" name="name"
					required />
				<div class="btn">
					<input id="btnDisplay" type="submit" value="Show Company" />
				</div>
			</form>
		</div>
		<div style="margin-left: 100px;">

			<form action="getJob.do" method="GET">
				<input type="text" placeholder="search by job title" name="title"
					required />
				<div class="btn">
					<input id="btnDisplay" type="submit" value="Show Job" />
				</div>
			</form>
		</div>
		</div>
		<hr>
		<div class="" id="show-all-btn-container" style="width: 700px; margin: 0 auto;">
			<div class="">
				<form action="allUser.do" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Show All Users" />
				</form>
			</div>
			<div class="">

				<form action="allCompanies.do" method="GET">
					<input id="btnDisplay" class="btn" type="submit"
						value="Show All Companies" />
				</form>
			</div>
			<div class="">

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