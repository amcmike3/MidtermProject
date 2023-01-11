<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create User Review</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col card text-center title-container">
				<h3>Review A Company</h3>
			</div>
			<div class="title-container matcha card text-center">
				<form action="createUserReview.do" method="POST">
					<div>
						<label for="title"><strong>Title:</strong></label> <br /> <input
							type="text" name="title" required>
					</div>



					<div>
						<label for="pros"><strong>Pros:</strong></label> <br /> <input
							type="text" name="pros" required>
					</div>

					<div>
						<label for="cons"><strong>Cons:</strong></label> <br /> <input
							type="text" name="cons" required>
					</div>

					<label for="rating">Rating:</label> <select id="rating"
						name="rating">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10" selected>10</option>
					</select>
					<br/>
					 <label for="recommendation">Recommended:</label> <select
						id="recommendation" name="recommendation">
						<option value="true">Yes</option>
						<option value="false">No</option>
					</select>

					<div>
						<label for="content"><strong>What would you like
								to say about this company:</strong></label> <br />
						<textarea name="content" rows="4" cols="40" required></textarea>
					</div>

					<div>
						<label for="advice"><strong>Advice to upper
								management:</strong></label> <br />
						<textarea name="advice" rows="4" cols="40" required></textarea>
					</div>

					<div>
						<button type="submit" class="btn btn-outline-warning">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>