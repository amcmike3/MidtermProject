<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Baseline</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
<div>
		<form action="updatingCompanyReview.do" method="POST">
			<input type="hidden" name="companyId" value="${companyId }">
			
			<div>
				<label>Title</label> <input type="text" name="title"
					value="${review.title}" />
			</div>
			<div>
				<label>Content</label> <input type="text" name="content"
					value="${review.content}" />
			</div>

			<label for="cars">Rating:</label> <select id="rating" name="rating">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>

			<div>
				<label>PROs</label> <input type="text" name="pros"
					value="${review.pros}" />
			</div>
			<br>
			<div>
				<label>CONs</label> <input type="text" name="cons"
					value="${review.cons}" />
			</div>
			<br>
			<div>
				<br> <label for="recommendation">Recommended:</label> <select
					id="recommendation" name="recommendation">
					<option value="true">Yes</option>
					<option value="false">No</option>
				</select> <br> <label>Advice</label> <input type="text" name="advice"
					value="${review.advice}" /> <br>
			</div>
			<div>
				<br>
				<div>

					<br>
					
					<button type="submit" class="btn btn-success">Submit</button>

				</div>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>