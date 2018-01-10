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
        <h1>${ad.title}</h1>
        <img>
        <h3>Price: $${ad.price} </h3>
            <h3>Description: ${ad.description} </h3>
            <p>User: ${user.username}</p>
    </div>
</body>

</html>