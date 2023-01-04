<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Office Search</title>
<%@ include file="bootstrapHead.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<form action="getUser.do" method="GET">
  		Find by Username: <input type="text" name="username" required/>
  		<input id="btnDisplay" class="btn" type="submit" value="Show User"/>
	</form>
	<form action="getCompany.do" method="GET">
  		Find by Company: <input type="text" name="name" required/>
  		<input id="btnDisplay" class="btn" type="submit" value="Show Company"/>
	</form>
	<form action="getJob.do" method="GET">
  		Find by Job: <input type="text" name="title" required/>
  		<input id="btnDisplay" class="btn" type="submit" value="Show Job"/>
	</form>


	<%@include file="footer.jsp"%>
	<%@include file="bootstrapFoot.jsp"%>
</body>
</html>