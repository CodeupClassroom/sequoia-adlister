<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <c:choose>
                <c:when test="${loginError == true}">
                    <div>
                        <p>Username or Password is Incorrect</p>
                    </div>
                </c:when>
            </c:choose>
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${username}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
            <a href="/register" class="btn btn-warning btn-block">Not a Member? Sign Up!</a>
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
