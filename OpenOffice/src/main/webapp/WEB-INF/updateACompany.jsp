<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update A Company</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<div class="containers text-center">
		<div class="row">
			<div class="col title-container text-center">
				<div class="card-title">
					<h3>Update a Company</h3>
				</div>
				<div class="card-body">
					<form action="updateACompany">
						<input type="hidden" name="companyId" value="${company.id }">
						<br /> Name: <br /> 
						<input type="text" name="name" placeholder="${company.name }"/> 
						<br />Description<br />
						<input type="text" name="description" placeholder="${company.description }"/> 
						<br />Location<br /> 
						<input type="text" name="location" placeholder="${company.location }"/>
						<br />
						<br />
						<button type="submit">Update Company</button>
						<br />
						<br />
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>