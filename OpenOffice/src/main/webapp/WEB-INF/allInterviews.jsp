<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Interviews</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<h1>All Interview Experiences for ${job.title }</h1>
	<c:forEach var="interview" items="${interviews }">
		<div class="row">
			<div class="col card matcha zoom">

				<div class="card-title">
					<h3>
						<a href="userBio?userId=${ interview.user.id}">${interview.user.username }</a>
						wrote: <br> <a
							href="interviewBio?interviewId=${interview.id }">${interview.title }</a>
					</h3>
				</div>
				<div class="card-body"></div>
				<p>${interview.process }</p>
				<br />
				<c:if test="${sessionScope.user.role }">
					<a href="updateAInterview?interviewId=${interview.id }"><button>Update</button></a>
				</c:if>
			</div>
		</div>
	</c:forEach>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>