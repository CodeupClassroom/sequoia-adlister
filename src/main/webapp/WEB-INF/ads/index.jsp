<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Trash to Treasure</h1>

    <c:forEach var="category" items="${categories}">
        <div>
            <a class="btn btn-primary" href="#" role="button">${category}</a>
            <%--# = /ads?categories=${category.id}”>${categories}"--%>
        </div>
    </c:forEach>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <a href="/ads/users-ads?id=${ad.id}">View More</a>
        </div>
    </c:forEach>
</div>

</body>
</html>
