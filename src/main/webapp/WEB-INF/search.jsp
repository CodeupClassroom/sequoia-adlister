<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Search Results"/>
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>

<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 ads_result">
                <h1 style="text-align: center">Ad Results</h1>
            </div>
        </div>
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-md-6">
                    <h3><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h3>
                    <p><c:out value="${ad.description}"/></p>

                    <small>categories: </small>
                    <c:forEach var="category" items="${ad.categories}">
                        <small><c:out value="${category.category}"/>, </small>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>

    </div>

</div>
</body>
</html>
