<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Edit Account Details</h1>
        <br>
        <h3>User Information</h3>
        <hr>
        <form action="/edit-account?edit=info" method="post">
            <c:choose>
                <c:when test="${inputErrorInfo == true}">
                    <div>
                        <p>Some of the Following Fields Contain Erroneous Information</p>
                    </div>
                </c:when>
            </c:choose>
            <div class="form-group">
                <label for="bio">Bio</label>
                <textarea class="form-control" rows="5" id="bio" name="bio">${bio}</textarea>
                <p>Limited 255 Characters</p>
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input id="location" name="location" class="form-control" type="text" value="${location}">
            </div>
            <div class="form-group">
                <label for="phone">Contact Number</label>
                <input id="phone" name="phone" class="form-control" type="text" value="${phone}">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
        <br>
        <h3>Change Email</h3>
        <hr>
        <form action="/edit-account?edit=email" method="post">
            <div>
                <h5>Current Email: </h5>
            </div>
            <c:choose>
                <c:when test="${inputErrorEmail == true}">
                    <div>
                        <p>Please Input Valid Email Addresses</p>
                    </div>
                </c:when>
            </c:choose>
            <div class="form-group">
                <label for="email1">New Email</label>
                <input id="email1" name="email1" class="form-control" type="email" value="${email}">
            </div>
            <div class="form-group">
                <label for="email2">Re-enter New Email</label>
                <input id="email2" name="email2" class="form-control" type="text" value="${email}">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
        <br>
        <h3>Change Password</h3>
        <hr>
        <form action="/edit-account?edit=password" method="post">
            <c:choose>
                <c:when test="${inputErrorPassword == true}">
                    <div>
                        <p>Please Input Valid Passwords/Your Old Password Input is Incorrect</p>
                    </div>
                </c:when>
            </c:choose>
            <div class="form-group">
                <label for="oldPassword">Old Password</label>
                <input id="oldPassword" name="oldPassword" class="form-control" type="password" value="${oldPassword}">
            </div>
            <div class="form-group">
                <label for="newPassword1">New Password</label>
                <input id="newPassword1" name="newPassword1" class="form-control" type="password" value="${newPassword}">
            </div>
            <div class="form-group">
                <label for="newPassword2">Confirm New Password</label>
                <input id="newPassword2" name="newPassword2" class="form-control" type="password" value="${newPassword}">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
        <br>
    </div>

    <jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
