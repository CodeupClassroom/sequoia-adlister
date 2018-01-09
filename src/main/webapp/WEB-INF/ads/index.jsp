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
    <h1 style="text-align: center">Current Active Ads</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>
                <a href="/ad?adID=${ad.id}">${ad.title}</a>
            </h2>
            <p>${ad.description}<a href="/ad?adID=${ad.id}"> more</a></p>
            <p>${ad.adLocation}<small> (Posted: ${ad.dateCreated})</small></p>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
