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
        <img src="" alt="${sessionScope.user.username}" style="width:100%">
        <div class="media">

        </div>

    </div>
    <div class="row">
        <div class="list-group col-xs-12 col-sm-6">
            <a href="/ads/create" class="list-group-item">Create a New Adlisting</a>
            <a href="/update-profile" class="list-group-item active">Update Your Profile</a>
        </div>

        <div class="list-group col-xs-12 col-sm-6">
            <a href="/ads/users-ads?id=${sessionScope.user.id}" class="list-group-item">View Your listings</a>
            <a href="" class="list-group-item">View sold items</a>
        </div>
    </div>
    <div class="list-group-item d-flex justify-content-between align-items-center">
        <a href="/ads" class="list-group-item">Search for Treasure</a>
    </div>
</div>

</body>
</html>