<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h1 style="text-align: center">Create a new Ad</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <form action="/ads/create" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text"
                           value="${sessionScope.oldInput.title == null ? "": sessionScope.oldInput.title}">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text">
                        ${sessionScope.oldInput.description == null ? "": sessionScope.oldInput.description}
                    </textarea>
                </div>

                <div class="form-group">
                    <c:forEach var="category" items="${categories}">
                        <input type="checkbox" name="category" value="${category.id}">${category.category}<br>
                    </c:forEach>
                </div>
                <input type="submit" class="btn btn-block btn-primary">
            </form>
        </div>
    </div>
</div>
</body>
</html>
