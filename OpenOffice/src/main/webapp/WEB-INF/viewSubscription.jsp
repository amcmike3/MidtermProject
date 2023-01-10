<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Subscription</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row col card">
			<h1>Companies You're Subscribed To:</h1>
			<c:forEach var="company" items="${user.companies}">
				<div class="card white-containers">
					<p>
						<a href="companyBio?companyId=${company.id}">${company.name }</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>


