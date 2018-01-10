<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <c:if test="${title !=null}">
                <div class="alert alert-danger" role="alert">
                    <strong>Please add a title</strong>
                </div>
            </c:if>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <c:if test="${description !=null}">
                <div class="alert alert-danger" role="alert">
                    <strong>Please add a description</strong>
                </div>
            </c:if>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
