<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: abbyperez28
  Date: 1/11/18
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Show Ad"/>
    </jsp:include>
</head>

<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <%------ For Each loop to return many from servlet-------%>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h3>${ad.title}</h3>
            <h5>Price: $${ad.price} </h5>
            <h5>Description: ${ad.description} </h5>
            <p>User: ${user.username}</p>
            <a href="/ads/edit?id=${ad.id}"><input type="button" value="Edit"/></a>
        </div>
    </c:forEach>
</div>

</body>

</html>
