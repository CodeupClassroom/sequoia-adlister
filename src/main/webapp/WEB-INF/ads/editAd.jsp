<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit an ad" />
    </jsp:include></head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--// obtaining inputs for text area--%>
<% String title = request.getParameter("title");
    if (title == null) title = "";

    String description = request.getParameter("description");
    if (description == null) description = "";
%>

<div class="container">
    <h1>Editing Ads</h1>

    <form action="/editAd" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="<%=title%>">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"><%=description%></textarea>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>




