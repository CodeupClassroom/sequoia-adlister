<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Adlister Home" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1 style="text-align: center">Welcome to Adlister!</h1>
        <h2 style="text-align: center">Sell your stuff, buy people's stuff, invite people to events, offer up services. Adlister is your one stop classifieds shop!</h2>
        <hr>
        <h3 style="text-align: center">
            <a href="/ads">See Our Full Ad Listing</a>
        </h3>
        <h3 style="text-align: center">
            <a href="/login">Member Log In</a>
        </h3>
        <h3 style="text-align: center">
            <a href="/register">Create an Account</a>
        </h3>

    </div>

    <jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
