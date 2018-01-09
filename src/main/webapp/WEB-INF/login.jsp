<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
    <link rel="stylesheet" href="/design/loginPage.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container-form">
        <div class="grad"></div>

        <div class="header"><h1>Please Log In</h1></div>
            <form action="/login" method="POST">
                <div class="form-group loginform">
                    <label for="username">Username</label>
                    <input id="username" name="username" class="form-control" type="text" placeholder="User name">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" name="password" class="form-control" type="password">
                </div>
                <input type="submit" class="btn btn-primary btn-block" value="Log In">
            </form>
    </div>
    <div class="shadow"></div>

    <script src="/javascript/validation.js"></script>

</body>
</html>
