<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview Bio</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="row">
			<div class="col text-center">
				<div class="yellow-containers text-center">
					<div class="title-container zoom text-center">

						<h1>${interview.job.title }</h1>
					</div>
					<div class="card-title yellow-containers text-center zoom">
						<br />
						<h3>${interview.title }</h3>
					</div>
					<div class="card-title yellow-containers text-center zoom">
						<h1>Description</h1>
						<p>${interview.process }
							<br>
						</p>
						<c:if test="${sessionScope.user.role }">
							<a href="updateAInterview?interviewId=${interview.id }"><button>Update</button></a>
						</c:if>
					</div>
				</div>

				<c:forEach var="question" items="${interview.interviewQuestions }">
					<div class="row">
						<div class="col card yellow-containers text-center zoom">

							<div class="card-title">
								<h3>${question.title }</h3>
							</div>
							<p>
								${question.name } <br> ${question.description }

							</p>

						</div>
					</div>
					<br />
				</c:forEach>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>