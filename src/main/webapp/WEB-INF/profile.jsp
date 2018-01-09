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
    <div class="jumbotron">
    <h1 class="text-center title">Welcome, ${sessionScope.user.username}!</h1>
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
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="list-group-item d-flex justify-content-between align-items-center">
            <a href="/ads" class="list-group-item">Search for Treasure<span class="badge badge-primary badge-pill">${counter.counterservlet}</span></a>
        </div>

    </div>
</div>

</body>
</html>