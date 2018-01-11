<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="../partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form id="formsubmit" action="/register" method="post">
            <div class="form-group">
                <label for="reg-username">Username</label>
                <input id="reg-username" name="username" class="form-control" type="text">
                <div id="reg-usererror"></div>
            </div>
            <div class="form-group">
                <label for="reg-email">Email</label>
                <input id="reg-email" name="email" class="form-control" type="text">
                <div id="reg-emailerror"></div>
            </div>
            <div class="form-group">
                <label for="reg-password">Password</label>
                <input id="reg-password" name="password" class="form-control" type="password">
                <div id="reg-passerror"></div>
            </div>
            <div class="form-group">
                <label for="reg_confirm_password">Confirm Password</label>
                <input id="reg_confirm_password" name="confirm_password" class="form-control" type="password">
                <div id="reg-conpasserror"></div>
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
        <script src="/javascript/registerValidation.js"></script>
    </div>

</body>
</html>
