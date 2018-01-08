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
    <jsp:include page="/WEB-INF/partials/ads/create.jsp" />

    <div class="container">
        <h1>Product Title</h1>
        <h3>Price: </h3>
        <div class="form-group">
            <label for="comment">Description: </label>
            <textarea class="form-control" rows="5" id="comment"></textarea>
        </div>

        <%--#<a href="url/${categories}">${category}</a>--%>


    </div>
</body>

</html>