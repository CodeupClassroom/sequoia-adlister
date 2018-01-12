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
        <div class="header"><h1>Please Log In</h1></div>
        <div class="container">
            <form action="/login" class="form-group loginform" id="user-form" method="POST">
                <label for="usrname">Username</label>
                <input type="text" id="usrname" name="usrname" required>

                <label for="psw">Password</label>
                <input type="password" id="psw" name="psw"
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                       title="Must contain at least one number
                       and one uppercase and lowercase letter,
                       and at least 8 or more characters" required>

                <input type="submit" class="btn-block" value="Login">
            </form>
        </div>
    </div>

    <div id="message">
        <h3>Password must contain the following:</h3>
        <p id="letter" class="invalid">A <b>lowercase</b>letter</p>
        <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
        <p id="number" class="invalid">A <b>number</b></p>
        <p id="length" class="invalid">Minimum <b>8 characters</b></p>
    </div>


    <script src="/javascript/validation.js"></script>

</body>
</html>
