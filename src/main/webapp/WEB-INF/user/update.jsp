<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<h1 class="text-center title">Update your profile</h1>

<div class="row">

    <form action="/user/profile/update" method="POST">

        <div class="col-xs-12 col-md-6">

            <h2>Update your Username and Email</h2>


            <div class="form-row">

                <div class="form-group col-md-6">
                    <label class="col-form-label">Username</label>
                    <input type="text" class="form-control" placeholder="Username" readonly
                           class="form-control-plaintext" value="${user.username}">

                </div>

                <div class="form-group col-md-6">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Email"
                           value="${user.email}">

                    <c:if test="${errors.containsKey('email')}">
                        <p class="error"> ${errors.get('email')}</p>
                    </c:if>

                </div>



            </div>

        </div>

        <div class="col-xs-12 col-md-6">

            <h2>Update your Password</h2>


            <div class="form-row">

                <div class="form-group col-md-12">

                    <label>Current password</label>
                    <input type="password" class="form-control" name="currentPassword"
                           placeholder="Current password">

                    <c:if test="${errors.containsKey('password')}">
                        <p class="error"> ${errors.get('password')}</p>
                    </c:if>

                    <c:if test="${errors.containsKey('currentPassword')}">
                        <p class="error"> ${errors.get('currentPassword')}</p>
                    </c:if>

                </div>

            </div>

            <div class="form-row">

                <div class="form-group col-md-6">

                    <label>New password</label>
                    <input type="password" class="form-control" name="newPassword"
                           placeholder="New password">

                    <c:if test="${errors.containsKey('password')}">
                        <p class="error"> ${errors.get('password')}</p>
                    </c:if>

                </div>

                <div class="form-group col-md-6">
                    <label>Confirm password</label>
                    <input type="password" class="form-control" name="confirmPassword"
                           placeholder="Confirm password">

                    <c:if test="${errors.containsKey('confirmPassword')}">
                        <p class="error"> ${errors.get('confirmPassword')}</p>
                    </c:if>

                </div>


                <div class="form-row">

                    <h2>Update your Bio and Location</h2>

                    <div class="form-group col-md-6">
                        <label>Bio: </label>
                        <input type="text" class="form-control" name="bio" placeholder="What do you have? What are you looking for? Tell us about yourself!"
                               value="${user.bio}">

                        <c:if test="${errors.containsKey('bio')}">
                            <p class="error"> ${errors.get('bio')}</p>
                        </c:if>

                    </div>

                    <div class="form-group col-md-6">
                        <label>Location</label>
                        <input type="text" class="form-control" name="location" placeholder="Where are you?"
                               value="${user.location}">

                        <c:if test="${errors.containsKey('location')}">
                            <p class="error"> ${errors.get('location')}</p>
                        </c:if>

                    </div>

                </div>

            </div>
        </div>

        <div>
         <%--class="col-xs-4 col-xs-offset-4 col-md-2 col-md-offset-5">--%>
            <button type="submit" class="btn btn-primary">Update profile</button>
        </div>
    </form>

</div>


</body>
</html>