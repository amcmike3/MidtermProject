<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview Question</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col card text-center">
				<div class="card-title">
					<h3>Interview:</h3>
					<h5>Step 3/3</h5>
				</div>
				<div class="card-body">
					<form action="createInterviewQuestion">
						<input type="hidden" name="interviewId" value="${interviewId }" />
						<br /> Title: <br /> <input type="text" name="title"
							value="${question.title }" /> <br /> Question: <br /> <input
							type="text" name="name" value="${question.name }" /> <br />
						Description: <br /> <input type="text" name="description"
							value="${question.description }" /> <br /> <input type="submit"
							value="Finish" /> <br /> <input type="submit"
							formaction="addAnotherInterviewQuestion"
							value="Add Another Question" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>