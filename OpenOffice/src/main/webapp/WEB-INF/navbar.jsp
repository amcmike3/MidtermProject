<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-sm sticky-top navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="home">Open Office</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar1">
            <ul class="navbar-nav">
            <c:choose>
            	<c:when test="${sessionScope.user != null }">
            	 <li class="nav-item active">
                    <a class="nav-link" href="loggingOut.do">Logout</a>
                </li>
                 <li class="nav-item active">
                    <a class="nav-link" href="user?userId=${sessionScope.user.id }"><img src="${user.imgUrl }"></a>
                </li>
            	</c:when>
            	<c:otherwise>
                <li class="nav-item active">
                    <a class="nav-link" href="login">Login</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="register">Sign Up</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="search">Search</a>
                </li>
            	</c:otherwise>
            </c:choose>
            </ul>
        </div>
    </div>
</nav>


