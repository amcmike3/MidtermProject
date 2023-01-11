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
			<div class="col text-center">
				<div class="card-title title-container">
					<h3>Create a Company</h3>
				</div>
				<div class="card-body yellow-containers">
					<form action="creatingCompany" method="post">

						<br /> Name: <br /> <input type="text" name="name" />
						<br />Description<br /> <input type="text" name="description" />
						<br />Location<br /> <input type="text" name="location" /> <br />
						<!-- Maybe implement google maps api if we have enough time -->
							<br> <button id="add-company-btn" type="submit">Add Company</button> <br>
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