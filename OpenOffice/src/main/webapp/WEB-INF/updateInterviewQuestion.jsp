<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Interview Questions</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container text-center">

		<div class="row">
			<div class="col card text-center">
				<div class="card-title title-container">
					<h2>Update Questions</h2>
				</div>
				<div class="col card card-body text-center matcha">
					<form action="updatingInterviewQuestion" method="POST">
						<input type="hidden" name="id" value="${question.id}"> <input
							type="hidden" name="interviewId" value="${interviewId }">
						<input type="hidden" name="companyId" value="${companyId }">
						<div>
							<label>Title: </label> <br/>  <input type="text" name="title"
								value="${question.title}">
						</div>
						<div>
							<label>Name: </label> <br/> <input type="text" name="name"
								value="${question.name}">
						</div>
						<div>
							Description: <br/>
							<textarea name="description" rows="4" cols="40">${question.description}</textarea>
						</div>

						<input type="submit" class="btn btn-success" value="Submit">
						<br/>
						<input type="submit"
							formaction="addAnotherInterviewQuestionFromUpdate"
							value="Add Another Question" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="footer.jsp"%>
<%@ include file="bootstrapFoot.jsp"%>
</html>
