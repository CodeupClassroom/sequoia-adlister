<%--
  Created by IntelliJ IDEA.
  User: paomac
  Date: 1/5/18
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Showing ad" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />

        <div class="container">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <p>${user.username}</p>
                <p>${user.email}</p>
            </div>
        </div>
    </body>
</html>
