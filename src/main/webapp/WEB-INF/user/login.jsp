<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
    <%--<link rel="stylesheet" href="/design/loginPage.css">--%>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container-form">
        <div class="grad"></div>

        <div class="header"><h1>Please Log In</h1></div>
            <form action="/login" id="user-form" method="POST">
                <div class="form-group loginform">
                    <label for="userinput">Username</label>
                    <input id="userinput" name="username" class="form-control" type="text" placeholder="User name">
                    <div id="user-error"></div>
                </div>
                <div class="form-group">
                    <label for="passinput">Password</label>
                    <input id="passinput" name="password" class="form-control" type="password" placeholder="Password">
                    <div id="pass-error" ></div>
                </div>
                <input type="submit" id="user-btn" class="btn btn-primary btn-block" value="Log In">
            </form>
    </div>

    <script src="/javascript/validation.js"></script>

</body>
</html>
