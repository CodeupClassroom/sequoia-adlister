<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: stephencisler
  Date: 1/8/18
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad-Id" />
    </jsp:include>
    <title>Ad Title</title>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Ad Details</h1>

        <%--<c:forEach var="ad" items="${ads}">--%>
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <h6>Ad ID: ${ad.id}</h6>
                <p>${ad.description}</p>
                <p>${ad.dateCreated}</p>
                <p>${ad.adLocation}</p>
            </div>
        <%--</c:forEach>--%>
    </div>
    <jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
