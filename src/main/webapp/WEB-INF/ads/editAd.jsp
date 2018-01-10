<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad"/>
    </jsp:include>
</head>

<body>
    <div class="container">
        <h1>Edit Your Ad</h1>
        <form action="/ads/edit" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value=${ad.title}>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control">${ad.description}</textarea>
            </div>

            <div class="form-group">
                <label>Category</label>
                <br>
                <%--<label name="category" class="checkbox-inline"><input type="checkbox" value="${categories}">${categories.category}</label>--%>
                <%--<label name="category" class="checkbox-inline"><input type="checkbox" value="${categories.id}">${categories.category}</label>--%>
                <%--If you do not the see the proper classification for your listing, feel free to add a new one:--%>
                <form action="/index.jsp" method="POST" name="category" class="form-group"><label>new category</label></form>
            </div>

            <div class="form-group">
                <label for="price">Price: $</label>
                <input id="price" name="price" class="form-control" type="text" value=${ad.price}>
            </div>
</body>

</html>