<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>

<%--Ad show page--%>

<%--Create a page that shows the information about an individual ad. This page should show all the
information about that ad, as well as the information about the user that posted the ad.--%>

<%--Your ads index page should contain links to each individual ad page.--%>

<%--You should have one page that displays the information for any arbitrary ad.
Consider passing the id of the ad as a parameter in the GET request to this page.--%>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6" data-dbid="${ad.id}">
            <h2><a href="/showAd?id=${ad.id}" name="ad-id">${ad.title}</a></h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>

</div>

</body>
</html>
