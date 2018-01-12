<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <link rel="stylesheet" href="/design/loginPage.css">
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />

    <div class="header"><h1>Please Register</h1></div>
    <div class="container-form">

        <div class="container">

            <form action="/register" class="form-group loginform" id="user-form" method="POST">

                    <label for="usrname">Username</label>
                    <input type="text" id="usrname" name="usrname" required>
                <br>


                    <label for="email">Email</label>
                    <input id="email" name="email" type="text">
                <br>


                    <label for="psw">Password</label>
                    <input type="password" id="psw" name="psw"
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                           title="Must contain at least one number
                               and one uppercase and lowercase letter,
                               and at least 8 or more characters" required>
                <br>


                    <label for="ConfirmPassword">Confirm Password</label>
                    <input id="ConfirmPassword" name="confirm_password" class="form-control" type="password">
                    <div id="reg-passerror"></div>


                <input type="submit" class="btn btn-primary btn-block">
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

    <div id="cmessage">
        <p id="confirm" class="invalid"> <b>Passwords Do Not Match</b></p>
    </div>

    <script src="/javascript/registerValidation.js"></script>
</body>
</html>
