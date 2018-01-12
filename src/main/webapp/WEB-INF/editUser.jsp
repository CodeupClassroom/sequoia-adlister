<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container nonFooter">
    <div id="content">
        <form action="/editUser" method="POST">
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
        <c:if test="${sessionScope.listOfErrors.size() > 0}">
            <div id="errors" class="alert alert-danger">
                <p>Unable to edit user!</p>
                <ul>
                    <c:forEach var="message" items="${listOfErrors}">
                        <li><c:out value="${message}"></c:out></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</div>
<%--<jsp:include page="/WEB-INF/partials/footer.jsp"/>--%>
<script src="/js/hideErrorsInProfile.js"></script>
</body>
</html>
