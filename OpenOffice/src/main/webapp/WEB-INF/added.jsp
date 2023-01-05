<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Added Company Review</title>
<%@ include file="bootstrapHead.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>

<div>
<h2><strong>Company Review Added</strong></h2>
</div>
<div>
 <c:choose>
    <c:when test="${! empty companyReview}">
      <ul style="list-style-type: square;">
      
      	<li>Title: ${companyReview.title } </li>
        <li>Content: ${companyReview.content}</li>
        <li>Rating: ${companyReview.rating}</li>
        <li>Pros: ${companyReview.pros}</li>
        <li>Cons: ${companyReview.cons}</li>
        <li>Recommended: ${companyReview.recommendation}</li>
        <li><blockquote>${companyReview.advice}</blockquote></li>
        
      </ul>
    </c:when>
    <c:otherwise>
      <p>No review found</p>
    </c:otherwise>
  </c:choose>
</div>

	<%@include file="footer.jsp"%>
	<%@ include file="bootstrapFoot.jsp"%>

</body>
</html>
</body>
</html>