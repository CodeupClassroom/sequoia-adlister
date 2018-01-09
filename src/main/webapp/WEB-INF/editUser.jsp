<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Edit Your Profile" />
        </jsp:include></head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <div class="container">
            <form action="/editUser" method="POST">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" name="email" class="form-control" type="text">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" name="password" class="form-control" type="password">
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                </div>
                <input type="submit" class="btn btn-primary btn-block">
            </form>
        </div>
    </body>
</html>
