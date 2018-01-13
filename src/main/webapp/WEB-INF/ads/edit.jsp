<%--
  Created by IntelliJ IDEA.
  User: damionbrown
  Date: 1/8/18
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="edit" value="Editing Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Edit Ad</h1>
<form action="/ads/edit" method="post">

    <input id="id" name="id" type="hidden" value="${ad.id}">

    <div class="form-group">
        <label for="title">Title</label>
        <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
    </div>

    <div class="form-group">
        <label for="description">Description</label>
        <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>
    </div>
    <input type="submit" class="btn btn-block btn-primary">
</form>
    <form action="/delete" method="post">
        <input type="hidden" name="id" value="${ad.id}">
        <button type="submit" class="btn btn-default">Delete</button>

    </form>

</div>
</body>
</html>
