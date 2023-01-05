<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateInterview</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
	<form action="updateInterviewQuestion.do" method="POST">
	<input type="hidden" name="interviewQuestionId" value="${interviewQuestionId}">
	<div>
	<label>Title</label>
	<input type="text" name="title" value="${interviewQuestion.title}">
	</div>
	<div>
	<label>Name</label>
	<input type="text" name="name" value="${interviewQuestion.name}">
	</div>
	<div>
	<label>Description</label>
	<input type="text" name="description" value="${interviewQuestion.description}">
	</div>
	
	
	
	<button type="submit" class="btn btn-success">Submit</button>
	</form>
</div>
</body>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</html>
