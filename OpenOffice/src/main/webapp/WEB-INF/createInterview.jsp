<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Add Interview Experience</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col card text-center">
				<div class="card-title">
					<h3>Interview:</h3>
					<h5>Step 2/3</h5>
				</div>
				<div class="card-body">
					<form action="createInterview">
						<input type="hidden" name="jobId" value="${jobId }" /> <br />
						Title: <br> <input type="text" name="title" /> <br /> What
						was their interview process like? <br> <input type="text"
							name="process" /> <br /> Did you get a job offer? <br /> <select
							id="jobOffered" name="jobOffered">
							<option value="false">No</option>
							<option value="true">Yes</option>
						</select> <br /> <input type="submit" value="Next" />
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>