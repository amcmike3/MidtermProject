<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview Question</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="containers">
		<div class="row">
			<div class="text-center yellow-containers">
				<div class="card-title title-container zoom">
					<h3>Interview:</h3>
					<h5>Step 3/3</h5>
				</div>
				<div class="card-body yellow-containers zoom">
					<form action="createInterviewQuestion" method="post">
						<input type="hidden" name="interviewId" value="${interviewId }" />
						<br /> Title: <br /> <input type="text" name="title"
							value="${question.title }" /> <br /> Question: <br /> <input
							type="text" name="name" value="${question.name }" /> <br />
						Description: <br /> <input type="text" name="description"
							value="${question.description }" /> <br /> <input type="submit"
							value="Finish" /> <br /> <input type="submit"
							formaction="addAnotherInterviewQuestion?interviewId=${interviewId }"
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