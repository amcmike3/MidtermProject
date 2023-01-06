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
			<div class="col card card-body text-center">
			<form action="createInterview">
			<input type="hidden" name="jobId" value="${jobId }"/>
			<br/>
			Title:
			<input type="text" name="title""/>
			<br/>
			What was their interview process like?
			<input type="text" name="process"/>
			<br/>
			Did you get a job offer?
			<select
					id="jobOffered" name="jobOffered">
					<option value="false">No</option>
					<option value="true">Yes</option>
				</select>
			
			<br/>
			<input type="submit" value="Next"/>
			</form>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>