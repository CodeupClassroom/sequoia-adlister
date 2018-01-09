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
    <section class="welcome">
        <div class="row">
            <div class="col-xs-12">
                <h1 style="text-align: center">Welcome, ${sessionScope.user.username}!</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-xa-12 center-block">
                <button type="button" class="btn btn-default center-block">
                    <a href="/editUser?id=${sessionScope.user.id}">Edit Profile <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                </button>
            </div>
        </div>

    </section>
    <section>
        <div class="row">
            <div class="col-xs-12">
                <h1 style="text-align: center">Items You Have For Sale:</h1>
            </div>
        </div>
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-xs-6">
                    <h2><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h2>
                    <p><c:out value="${ad.description}"/></p>
                    <button type="button" class="btn btn-default">
                        <a href="/editAd?id=${ad.id}">Edit Ad <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                    </button>
                </div>
            </c:forEach>
        </div>
    </section>
</div>
</body>
</html>
