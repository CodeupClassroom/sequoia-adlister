<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <%------Expression Language to access attributs from a request object------%>
        <h3>${ad.title}</h3>
        <img>
        <h5>Price: $${ad.price} </h5>
            <h5>Description: ${ad.description} </h5>
            <p>User: ${user.username}</p>
            <a href="/ads/edit?id=${ad.id}"><input type="button" value="Edit"/></a>

    </div>


</body>

</html>