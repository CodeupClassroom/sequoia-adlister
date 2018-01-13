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
            <label for="For Sale" class="checkbox-inline">
                    <input id="For Sale" type="checkbox" name="categories_id" value="1">For Sale
            </label>

            <label for="Free Stuff" class="checkbox-inline">
                <input id="Free Stuff" type="checkbox" name="categories_id" value="2">Free Stuff
            </label>

            <label for="Services" class="checkbox-inline">
                    <input id="Services" type="checkbox" name="categories_id" value="3">Services
            </label>

            <label for="Jobs" class="checkbox-inline">
                   <input id="Jobs" type="checkbox" name="categories_id" value="4">Jobs
            </label>

            <label for="Personals" class="checkbox-inline">
                    <input id="Personals" type="checkbox" name="categories_id" value="5">Personals
            </label>

            <label for="Gigs" class="checkbox-inline">
                    <input id="Gigs" type="checkbox" name="categories_id" value="6">Gigs
            </label>

            <label for="Housing" class="checkbox-inline">
                <input id="Housing" type="checkbox" name="categories_id" value="7">Housing
            </label>

            <label for="Electronics" class="checkbox-inline">
                <input id="Electronics" type="checkbox" name="categories_id" value="8">Electronics
            </label>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
