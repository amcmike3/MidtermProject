<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div>
		<form action="updateComp.do" method="POST">
			<div>
				<label>Title</label> <input type="text" name="title"
					placeholder="${review.title}" />
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
			<label>Review</label> <input type="text" name="review"
				placeholder="${review.content}" /> <br>
	</div>

			<div>
				<label>Content</label> <input type="text" name="content"
					placeholder="${review.content}" />
			</div>
			<br>
			<label for="recommendation">Recommended:</label> <select
				id="recommendation" name="recommendation">
				<option value="true">Yes</option>
				<option value="false">No</option>
			</select>
			<br>



			<div>
				<label>PROs</label> <input type="text" name="pros"
					placeholder="${review.pros}" />
			</div>
			<br>
			<div>
				<label>CONs</label> <input type="text" name="cons"
					placeholder="${review.cons}" />
			</div>
			<br>
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
</html>




