<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${sessionScope.user.username}'s Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="jumbotron">
    <h1 class="text-center title">${sessionScope.user.username}!</h1>
    </div>
    <div class="card">
        <%--<img src="" alt="${sessionScope.user.username}">--%>

        <div class="media">
            <%--<p>Location: ${sessionScope.user.location}</p>--%>
            <%--<p>Bio: ${sessionScope.user.bio}</p>--%>
            <%--<p>Member Since: ${sessionScope.user.register_date}</p>--%>
        </div>

    </div>
    <div class="row">
        <div class="list-group col-xs-12 col-sm-6">
            <a href="/ads/create" class="list-group-item">Create a New Adlisting</a>
            <a href="/update-profile" class="list-group-item">Update Your Profile</a>
        </div>

        <div class="list-group col-xs-12 col-sm-6">
            <a href="/showAd?id=${sessionScope.user.id}" class="list-group-item">View ${sessionScope.user.username}'s listings</a>
            <a href="" class="list-group-item">View Saved Items</a>
        </div>
    </div>
    <div class="list-group-item d-flex justify-content-between align-items-center">
        <a href="/ads" class="list-group-item">Search for Treasure</a>
    </div>
</div>
<script src="/javascript/validation.js"></script>
</body>
</html>