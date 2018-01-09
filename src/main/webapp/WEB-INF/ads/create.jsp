<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp" />

</head>
<body>
    <div class="container">
        <h1>Create a New Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
                <c:if test = "${errors.containsKey('title')}">
                    <p class = "error"> ${errors.get('title')}</p>
                </c:if>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
                <c:if test = "${errors.containsKey('description')}">
                    <p class = "error">${errors.get('description')}</p>
                </c:if>
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <select class="form-control" id="category" name="category"></select>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">"${category.classification}"</option>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <input id="price" name="price" class="form-control" type="text">
                <c:if test="${errors.containsKey('price')}">
                    <option value="${ad.price}">"${ad.price}"</option>
                </c:if>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
