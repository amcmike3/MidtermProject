<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reactivate Account</title>
<%@ include file="bootstrapHead.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<div class="containers text-center">
		<div class="row">
			<div class="col  text-center">
				<div class="card-title title-container">
					<h3>Account has been deactivated</h3>
				</div>
				<div class="col card card-body text-center matcha">
					<br>
					<form action="reactivatingAccount">
						<input id="reactivate" type="submit" value="Reactivate Account"/> <input
							type="hidden" name="id" value="${user.id }" />
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>