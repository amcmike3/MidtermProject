<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CompanyBio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div>
	<h1>${company.name }</h1>
	<br>
	<!-- <c:forEach var="user" items="${userList}"> -->
	<c:forEach var="review" items="${company.reviews}">
		<p>${review.id}</p>
		
		
	</c:forEach>
	
	
	</p>
	
	
	
	
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>