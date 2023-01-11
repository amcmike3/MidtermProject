<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				<div class="card-title zoom">
					<h3>Articles</h3>
				</div>
				<div class="card-body yellow-container zoom">
					<form action="createArticle" method="post">

						<br /> Title: <br /> <input type="text" name="title" />
						<br /> Description: <br /> <input type="text" name="description" />
						<br />Date: <br /> <input type="text" name="description" />
						<br /> URL: <br /> <input type="text" name="articleUrl" />
						<br /> Industry: <br /> <select name="industryId">
							<c:forEach var="industry" items="${industryList }">
								<option value="${industry.id}">"${industry.name }"</option>
								<!-- <option value="industry.id">name</option>
    <option value="industry.id">name</option> -->
							</c:forEach>
						</select> <br> <br />
						
							<button type="submit">Add Article</button>
						</form>
				</div>
			</div>
		</div>

	</div>


	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>