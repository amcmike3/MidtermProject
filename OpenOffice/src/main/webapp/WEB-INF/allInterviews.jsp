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
	<div class="containers text-center">
		<div class="row">
			<div class="col card matcha zoom">

				<div class="card-title">
					<h3>
						<a href="userBio?userId=${ interview.user.id}">${interview.user.username }</a>
						wrote: <br> <a
							href="interviewBio?interviewId=${interview.id }">${interview.title }</a>
					</h3>
			<div class="col text-center ">
				<div class="card-title title-container zoom">
					<h3>All Interview Experiences for ${job.title }</h3>
				</div>
			</div>
		</div>
		<c:forEach var="interview" items="${interviews }">
			<div class="row">
				<div class="col card matcha zoom">
					<div class="card card-body yellow-containers ">

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
		</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>