<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-xs-3 col-xs-offset-1">
                    <h1 style="text-align: center">Welcome, ${sessionScope.user.username}!</h1>
                    <img src="/images/user_pic.png" alt="">
                    <h5>Username: ${sessionScope.user.username}</h5>
                    <h5>email: ${sessionScope.user.email}</h5>
                    <button type="button" class="btn btn-default center-block">
                        <a href="/editUser?id=${sessionScope.user.id}"><span class="glyphicon glyphicon-edit"
                                                                             aria-hidden="true"></span> Edit Profile</a>
                    </button>
                </div>

                <div class="col-xs-7">
                    <h1 style="text-align: center">Items You Have For Sale:</h1>
                    <div class="row">
                        <c:forEach var="ad" items="${ads}">
                            <div class="col-xs-12">
                                <h2><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h2>
                                <p><c:out value="${ad.description}"/></p>
                                <button type="button" class="btn btn-default">
                                    <a href="/editAd?id=${ad.id}&title=${ad.title}&description=${ad.description}"><span
                                            class="glyphicon glyphicon-edit" aria-hidden="true"></span> Edit Ad</a>
                                </button>
                                <form id="myform" method="post" action="/deleteAd">
                                    <input type="hidden" name="id" value=${ad.id}>
                                    <button type="submit" class="btn btn-danger"><span
                                            class="glyphicon glyphicon-remove-sign"></span> Delete Ad
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%--<h3>Nested Columns</h3>--%>
<%--<div class="row">--%>

    <%--<div class="col-lg-8">1</div>--%>
    <%--<div class="col-lg-4">--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-6">1</div>--%>
            <%--<div class="col-lg-6">2</div>--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>