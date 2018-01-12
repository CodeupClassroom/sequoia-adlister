<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        /*h1 {*/
            /*text-align: center;*/
        /*}*/
        h1 {
            text-align: center;
            font-size: 65px;
            text-shadow: 3px 3px 0 #cdcdcd;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2><a href="/showAd?id=${ad.id}">${ad.title}</a></h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
