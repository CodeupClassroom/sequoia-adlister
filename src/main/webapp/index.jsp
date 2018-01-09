<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="stylesheet" href="CSS/custom.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <section class="welcome">
            <div class="row">
                <div row="col-xs-12">
                    <h1 style="text-align: center">Welcome to the Adlister!</h1>
                </div>
            </div>
        </section>
    </div>

</body>
</html>
