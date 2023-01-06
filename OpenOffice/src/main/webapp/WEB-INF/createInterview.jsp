<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Interview</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col card card-body text-center">
				<form action="updatingInterviewQuestion">
					<input type="hidden" name="interviewId" value="${interviewId }" />
					<div>
					 Title: <input type="text" name="title"
						value="${interview.title }" /> 
						</div>
						<div> 
						Process: <input type="text"
						name="Process" value="${interview.process }" />
						 </div> 
						 <div>
						 Job Offered: <input type="text" name="jobOffered"
						value="${interview.jobOffered }" />
						 </div>
						 <div>
						  Questions: <input type="text" name="questions" value="${interview.questions }" />
						   </div>
			<button type="submit" value="Finish">Finish</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>