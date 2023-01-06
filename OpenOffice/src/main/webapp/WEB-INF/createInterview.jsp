<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Create Interview</title>
=======
<title>Add Interview Experience</title>
>>>>>>> c203f197b55b914b53c610b48dcce3fa54566b96
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
<<<<<<< HEAD
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
=======
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

>>>>>>> c203f197b55b914b53c610b48dcce3fa54566b96
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>