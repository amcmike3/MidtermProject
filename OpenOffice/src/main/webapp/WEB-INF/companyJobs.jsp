<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${company.name } Jobs</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<div class="containers text-center">
		<div class="row">
			<div class="col text-center ">
				<div class="card-title title-container zoom">
					<h3>${company.name } jobs</h3>
				</div>

				<c:forEach var="job" items="${ companyJobs}">
					<c:if test="${job.enabled }">
						<div class="card card-body yellow-containers zoom">
							<h3>
								<a href="jobBio?jobId=${job.id }">${job.title }</a>
							</h3>
							<p>${ job.description }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>