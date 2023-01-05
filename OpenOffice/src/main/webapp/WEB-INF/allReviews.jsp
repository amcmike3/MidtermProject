<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${company.name }reviews</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row col card">
			<h1>${company.name } reviews</h1>
		</div>

		<c:forEach var="review" items="${company.reviews }">
			<div class="row col card">
				<p>
					<a href="userBio?userId=${review.user.id }">
						${review.user.username }</a> rated this company ${review.rating } out
					of 10 <br> this is what they had to say about ${company.name}:
					<br> ${review.content }
<!-- 					if review.user.id == user.id then a delete button 
 -->	
<c:choose>
 	<c:when test="${sessionScope.user != null}">
 <form action="deleteReview.do" method="post">
	<button type="submit" name="reviewId" value="${review.id}">Delete</button>
 	</form>
 	</c:when>	
 	</c:choose>	
 	<c:choose>
 	<c:when test="${sessionScope.user != null}">
 <form action="updateComp.do" method="post">
	<button type="submit" name="reviewId" value="${review.id}">Update</button>
 	</form>
 	</c:when>	
 	</c:choose>	

			</div>
		</c:forEach>
	</div>


	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>