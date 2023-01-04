<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Results</title>
<%@ include file="bootstrapHead.jsp"%>

</head>
<body>
	<div>
		<c:choose>
			<c:when test="${userList != null}">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>User ID</th>
							<th>Username</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr>
								<td>${user.id}</td>
								<td><a href="allUser.do?userId=${user.id}">${user.username}</a></td>
								<td>${user.firstName}</td>
								<td>${user.lastName}</td>
								<td>${user.description}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:when test="${jobList != null}">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Job ID</th>
							<th>Job Title</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="job" items="${jobList}">
							<tr>
								<td>${job.id}</td>
								<td><a href="allJobs.do?jobId=${job.id}">${job.title}</a></td>
								<td>${job.salary}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:when test="${companyList != null}">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Company ID</th>
							<th>Company Name</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="company" items="${companyList}">
							<tr>
								<td>${company.id}</td>
								<td><a href="allCompanies.do?companyId=${company.id}">${company.name}</a></td>
								<td>${company.location}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h2>No results found</h2>
			</c:otherwise>
		</c:choose>
	</div>
	
	<%@include file="footer.jsp"%>
	<%@include file="bootstrapFoot.jsp"%>
</body>
</html>