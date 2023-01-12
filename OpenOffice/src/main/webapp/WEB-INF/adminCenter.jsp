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
	<div class="card containers text-center">
		<div class="row card title-container text-center zoom"
			style="max-width: 1000px; min-width: 300px; margin: 0 auto;">
			<h1>Administrator Privileges</h1>
		</div>
		<hr>
		<div class="container" id="admin-privileges-btn"
			style="width: 700px;">
			<div class="text-center card yellow-containers zoom" style="display: flex; flex-direction: row; flex-wrap: wrap; align-items: center; justify-content: center;">
				<form action="createCompany" method="GET">
					<input id="btnDisplay" class="zoom btn" type="submit"
						value="Create Company" />
				</form>
			</div>

			<div class="card yellow-containers zoom" style="text-align: left; margin-left: 10px; margin-top: 50px; padding-left: 100px;">


<!-- 				<form action="updateAUser" method="GET">
					<input type="text" placeholder="user id" name="userId"
						required />
					<div class="btn">
						<input id="btnDisplay" type="submit" value="Update User" />
					</div>
				</form>
			</div>
			
			<div class="">
 -->

					<form action="updateACompany" method="GET">
						<input class="zoom" type="text" placeholder="company id" name="companyId"
							required  size="20"/>
						<div class="btn">
							<input class="zoom btn" id="btnDisplay" type="submit" value="Update Company" />
						</div>
					</form>


					<form action="updatAUser" method="GET">
						<input class="zoom" type="text" placeholder="user id" name="userId" required size="20"/>
						<div class="btn">
							<input class="zoom btn" id="btnDisplay" type="submit" value="Update User" />
						</div>
					</form>


					<form action="updateAJob" method="GET">
						<input class="zoom" type="text" placeholder="job id" name="jobId" required size="20" />
						<div class="btn">
							<input class="zoom btn" id="btnDisplay" type="submit" value="Update Job" />
						</div>
					</form>


					<form action="updateAInterview" method="GET">
						<input class="zoom" type="text" placeholder="interview id" name="interviewId"
							required size="20"/>
						<div class="btn">
							<input class="zoom btn" id="btnDisplay" type="submit" value="Update Interview" />
						</div>
					</form>


					<form action="updateAArticle" method="GET">
						<input class="zoom" type="text" placeholder="article id" name="articleId"
							required size="20"/>
						<div class="btn">
							<input class="zoom btn" id="btnDisplay" type="submit" value="Update Article" />
						</div>
					</form>


					<form action="updateACompanyReview" method="GET">
						<input class="zoom" type="text" placeholder="company review id" name="reviewId"
							required size="20"/>
						<div class="btn">
							<input class="zoom btn" id="btnDisplay" type="submit"
								value="Update Review" />
						</div>
					</form>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>