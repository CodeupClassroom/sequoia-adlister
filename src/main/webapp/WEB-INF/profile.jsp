<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <ul>
    <c:forEach var="ad" items="${ads}">
        <li>
            <h4><c:out value="${ad.title}"/></h4>
            <h5><c:out value="${ad.description}"/></h5>

            <%--<c:if test="${param.id == null || sessionScope.user.id == param.id}">--%>
            <a href="ads/edit?id=${ad.id}">
                <input type="button" value="Edit Ad"/>
            </a>
            <%--</c:if>--%>
        </li>
    </c:forEach>
    </ul>

</body>
</html>
