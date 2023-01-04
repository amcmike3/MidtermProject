<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Results</title>
</head>
<body>
<div>
<c:choose>
	<c:when test="${empty users}">
	<h2>No users found</h2>
	</c:when>
	<c:otherwise>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.id}</td>
				<td><a href="allUsers.do?userId=${user.id}">${user.username}</a></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>