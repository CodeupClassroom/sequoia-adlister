<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Lobster|News+Cycle" rel="stylesheet">
    <link rel="stylesheet" href="/css/index.css">
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <style>
        h1 {
            text-align: center;
        }
    </style>
</head>
<%--<body>--%>
    <%--<jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
    <%--<div class="container">--%>
        <%--<h1>Welcome to the Adlister!</h1>--%>
    <%--</div>--%>
<%--</body>--%>

<body>
<jsp:include page="WEB-INF/partials/navbar.jsp"/>
<div class="jumbotron">
    <div class="container banner">
        <div class="header">
            <h1>AdLister</h1>
            <p class="subtitle"><em>Find the <strong>perfect</strong> ad for all your needs. </em></p>
            <p>
                <a class="btn btn-danger btn-lg display-font" href="/ads" role="button">View All Ads
                </a>
            </p>
        </div>
    </div>
</div>
</html>
