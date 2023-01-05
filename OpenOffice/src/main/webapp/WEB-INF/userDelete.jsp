<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Baseline</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<c:choose>
		<c:when test="${success }">
			<h1>User Successfully Deleted!</h1>

		</c:when>
		<c:otherwise>
			<h1>Ooops something went wrong User was not Deleted!</h1>

		</c:otherwise>

	</c:choose>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>


