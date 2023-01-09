<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Create Article</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="containers text-center">
		<div class="row">
			<div class="col title-container text-center">
				<div class="card-title">
					<h3>Articles</h3>
				</div>
							</div>
							<hr>
				<div class="yellow-containers" style="width: 500px; margin: 0 auto;">
					<form action="createArticle">
						<input type="hidden" name="jobId" value="${jobId }" /> <br />
						Title: <br> <input type="text" name="title" /> <br /> What
						was their interview process like? <br> <input type="text"
							name="process" /> <br /> 
						 <br /> <input type="submit" value="Add Article" />
					</form>
				</div>

		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>