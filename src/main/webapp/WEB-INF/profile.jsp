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
    <h1 class="text-center title">Welcome, ${sessionScope.user.username}!</h1>

    <div class="row">

        <div class="list-group col-xs-12 col-sm-6">
            <a href="#" class="list-group-item active">
                Manage your ads
            </a>
            <a href="/ads" class="list-group-item">View all ads</a>
            <a href="/ads/users-ads?id=${sessionScope.user.id}" class="list-group-item">View your ads</a>
            <a href="/ads/create" class="list-group-item">Create ad</a>
        </div>

        <div class="list-group col-xs-12 col-sm-6">
            <a href="#" class="list-group-item active">
                Manage your profile
            </a>
            <a href="/update-profile" class="list-group-item">Update profile info</a>
        </div>

    </div>
</div>


<%--<jsp:include page="/WEB-INF/partials/scripts.jsp" />--%>

</body>
</html>