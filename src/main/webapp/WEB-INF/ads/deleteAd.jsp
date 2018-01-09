<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit an ad" />
    </jsp:include></head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--// obtaining inputs for text area--%>
<%--<% String title = request.getParameter("title");--%>
    <%--if (title == null) title = "";--%>

    <%--String description = request.getParameter("description");--%>
    <%--if (description == null) description = "";--%>
<%--%>--%>

<div class="container">
    <h1>Deleting Ad</h1>
    <div class="col-md-6">
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>
        <p>${user.username}</p>
        <p>${user.email}</p>
    </div>

</div>
</body>
</html>
