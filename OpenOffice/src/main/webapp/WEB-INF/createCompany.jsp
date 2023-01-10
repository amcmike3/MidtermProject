<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Create Company</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="containers text-center">
		<div class="row">
			<div class="col title-container text-center">
				<div class="card-title">
					<h3>Create a Company</h3>
				</div>
				<div class="card-body">
					<form action="createCompany">

						<br /> Name: <br /> <input type="text" name="name" />
						<br />Description<br /> <input type="text" name="description" />
						<br />Location<br /> <input type="text" name="location" />
						<!-- Maybe implement google maps api if we have enough time -->
							<button type="submit">Add Company</button>
						</form>
				</div>
			</div>
		</div>

	</div>


	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>