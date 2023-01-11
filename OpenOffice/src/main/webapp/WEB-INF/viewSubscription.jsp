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
	<div class="containers text-center">
		<div class="row">
			<div class="col  text-center">
				<div class="card-title title-container">
					<h3>Companies <a href="userBio?userId=${user.id }">${fn:toUpperCase(user.username) }</a> Is Subscribed To:</h3>
				</div>
					<c:forEach var="company" items="${user.companies}">
				<div class="col card card-body text-center matcha">
							<p>
								<a href="companyBio?companyId=${company.id}">${company.name }</a>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>


