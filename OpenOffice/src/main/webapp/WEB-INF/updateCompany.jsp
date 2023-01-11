<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Company Review</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="row">
			<div class="col text-center ">
				<div class="card-title title-container zoom">
					<h3>Update Review</h3>
				</div>
				<div class="card card-body yellow-containers zoom">
					<form action="updatingCompanyReview.do" method="POST">
						<input type="hidden" name="companyId" value="${companyId }">

						<div>
							<label>Title</label> <input type="text" name="title"
								value="${review.title}" />
						</div>
						
					

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
							<label>Content</label> <br>
								<textarea name="content" rows="4" cols="40">${review.content}</textarea>
						</div>
						<div>
						<br> <label>Advice</label> <br/> 
								<textarea name="advice" rows="4" cols="40">${review.advice}</textarea>
								<br>
						</div>
						<br/>
							<label for="cars">Rating:</label> <select id="rating"
							name="rating">
							<option value="1"
								<c:if test="${review.rating == 1}">selected</c:if>>1</option>
							<option value="2"
								<c:if test="${review.rating == 2}">selected</c:if>>2</option>
							<option value="3"
								<c:if test="${review.rating == 3}">selected</c:if>>3</option>
							<option value="4"
								<c:if test="${review.rating == 4}">selected</c:if>>4</option>
							<option value="5"
								<c:if test="${review.rating == 5}">selected</c:if>>5</option>
							<option value="6"
								<c:if test="${review.rating == 6}">selected</c:if>>6</option>
							<option value="7"
								<c:if test="${review.rating == 7}">selected</c:if>>7</option>
							<option value="8"
								<c:if test="${review.rating == 8}">selected</c:if>>8</option>
							<option value="9"
								<c:if test="${review.rating == 9}">selected</c:if>>9</option>
							<option value="10"
								<c:if test="${review.rating == 10}">selected</c:if>>10</option>
						</select>
						<div>
							<br> <label for="recommendation">Recommended:</label> <select
								id="recommendation" name="recommendation">
								<option value="true"
									<c:if test="${review.recommendation}">selected</c:if>>Yes</option>
								<option value="false"
									<c:if test="${!review.recommendation}">selected</c:if>>No</option>
							</select> 
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
			</div>
		</div>
	</div>
</body>
<%@include file="footer.jsp"%>
<%@ include file="bootstrapFoot.jsp"%>
</html>




