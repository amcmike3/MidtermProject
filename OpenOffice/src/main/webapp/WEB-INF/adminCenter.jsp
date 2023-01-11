<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Center</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="containers text-center">
		<div class="title-container text-center"
			style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>Administrator Privileges</h1>
		</div>
		<hr>
		<div class="" id="admin-privileges-btn"
			style="width: 700px; margin: 0 auto;">
			<div class="" style="text-align: left;">
			<div class="">
				<form action="createCompany" method="GET">
				<input type="text"  disabled placeholder="→→→→→→→→→→→→→→→→→→→→→→→→"/>
					<input id="btnDisplay" class="btn" type="submit"
						value="Create Company" />
				</form>
			</div>

				<div class="">


				<form action="updateAUser" method="GET">
					<input type="text" placeholder="user id" name="userId"
						required />
					<div class="btn">
						<input id="btnDisplay" type="submit" value="Update User" />
					</div>
				</form>
			</div>
			
			<div class="">


					<form action="updateACompany" method="GET">
						<input type="text" placeholder="company id" name="companyId"
							required />
						<div class="btn">
							<input id="btnDisplay" type="submit" value="Update Company" />
						</div>
					</form>
				</div>

				<div class="">

					<form action="updatAUser" method="GET">
						<input type="text" placeholder="user id" name="userId" required />
						<div class="btn">
							<input id="btnDisplay" type="submit" value="Update User" />
						</div>
					</form>
				</div>

				<div class="">

					<form action="updateAJob" method="GET">
						<input type="text" placeholder="job id" name="jobId" required />
						<div class="btn">
							<input id="btnDisplay" type="submit" value="Update Job" />
						</div>
					</form>
				</div>

				<div class="">

					<form action="updateAInterview" method="GET">
						<input type="text" placeholder="interview id" name="interviewId"
							required />
						<div class="btn">
							<input id="btnDisplay" type="submit" value="Update Interview" />
						</div>
					</form>
				</div>

				<div class="">

					<form action="updateAArticle" method="GET">
						<input type="text" placeholder="article id" name="articleId"
							required />
						<div class="btn">
							<input id="btnDisplay" type="submit" value="Update Article" />
						</div>
					</form>
				</div>

				<div class="">

					<form action="updateACompanyReview" method="GET">
						<input type="text" placeholder="company review id" name="reviewId"
							required />
						<div class="btn">
							<input id="btnDisplay" type="submit"
								value="Update Company Review" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>