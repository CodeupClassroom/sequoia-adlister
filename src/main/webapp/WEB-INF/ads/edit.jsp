<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: stephencisler
  Date: 1/10/18
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
</head>
<body>

<h1>THIS IS TEST TITLE</h1>

<div class="container">
    <h1>Edit Ad ${adToEdit.id}</h1>
    <form action="/ad/edit" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${adToEdit.title}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text">${adToEdit.description}</textarea>
        </div>
        <div class="form-group">
            <label for="adLocation">Location</label>
            <textarea id="adLocation" name="adLocation" class="form-control" type="text" placeholder="optional">${adToEdit.adLocation}</textarea>
        </div>


        <div class="row">
            <c:forEach var="category" items="${categories}">
                <div class="col-xs-2">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="categories" value="${category}">${category}
                        </label>
                    </div>
                </div>
            </c:forEach>
        </div>


        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>


<jsp:include page="/WEB-INF/partials/js-footer.jsp" />
</body>
</html>
