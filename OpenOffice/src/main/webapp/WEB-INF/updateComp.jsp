<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<%@ include file="bootstrapHead.jsp"%>
<body>
	<form action="updateComment.do" method="POST"
		modelAttribute="CompanyReview"></form>
	<div class="row">
<<<<<<< HEAD
		<div>
			<form:label path="rating">Rating</form:label>
			<form:input type="text" class="form-control" path="CompanyReview"
				placeholder="${review.rating }" />
		</div>
		<form:label path="content">Review</form:label>
		<form:input type="text" class="form-control" path="CompanyReview"
			placeholder="${review.content}" />
		<br> <br>
		<button type="submit" class="btn btn-success">Submit</button>

	<div>
	<form:label path="content">Content</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.content}" />
	</div>
	<br>
	<div>
	<form:label path="recommendation">Recommendation</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.recommendation }" />
	</div>
	<br>
	<div>
	<form:label path="rating">Rating</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.rating }" />
	</div>
	<br>
	<div>
	<form:label path="pros">PROs</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.pros}" />
	</div>
	<br>
	<div>
	<form:label path="cons">CONs</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.cons}" />
	</div>
	<br>
	<div>
	<form:label path="title">Title</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.title}" />
	</div>
	<br>
	<div>
	<form:label path="content">Review</form:label>
							<form:input type="text" class="form-control" path="CompanyReview"
								placeholder="${review.content}" />
								<br>
								<br>
								<button type="submit" class="btn btn-success">Submit</button>

	</div>

	<button type="submit" class="btn btn-success">Submit</button>



		<%@include file="footer.jsp"%>
		<%@ include file="bootstrapFoot.jsp"%>
	</form>
</body>
</html>




