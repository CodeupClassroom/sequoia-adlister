<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <section class="ads_header">
        <div class="row">
            <div class="col-xs-12">
                <h1 style="text-align: center">Here Are all the ads!</h1>
            </div>
        </div>
    </section>
    <section class="ads_display">
        <div class="row">
            <c:forEach var="ad" items="${ads}">
            <div class="col-md-6 ads_display_by_col">
                <h3><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h3>
                <h5><c:out value="${ad.description}"/></h5>
                <small>Categories: </small>
                <c:forEach var="category" items="${ad.categories}">
                   <small><c:out value="${category.category}"/> / </small>
                </c:forEach>
            </div>
            </c:forEach>
        </div>
    </section

    <%--<section class="welcome">--%>
    <%--<div class="row">--%>
    <%--<div class="col-xs-12">--%>
    <%--<h1 style="text-align: center">Welcome to the Adlister!</h1>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</section>--%>
</div>
</body>
</html>
