<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>

    <link rel="stylesheet" href="/css/profile.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-8 info-panel">
                        <img src="stock-user-img.svg" alt="Stock User Image">
                        <h6 class="info-panel-title">Location</h6>
                        <hr class="info-panel-bars">
                        <br>
                        <h6 class="info-panel-title">Date Joined</h6>
                        <hr class="info-panel-bars">
                        <br>
                        <h6 class="info-panel-title">Contact Phone Number</h6>
                        <hr class="info-panel-bars">
                        <br>
                        <button type="button" class="btn btn-primary btn-xs">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit Info Details
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-10">
                        <h1>@${sessionScope.user.username}</h1>
                        <br>
                        <h4 class="info-panel-title">Bio</h4>
                        <hr class="info-panel-bars">
                        <br>
                        <c:forEach var="ad" items="${userAds}">
                            <div class="col-md-6">
                                <h2>
                                    <a href="/ad?adID=${ad.id}">${ad.title}</a>
                                </h2>
                                <p>${ad.description}<a href="/ad?adID=${ad.id}"> more</a></p>
                                <p>${ad.adLocation}<small> (Posted: ${ad.dateCreated})</small></p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
