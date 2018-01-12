<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp"/>


    <%--// obtaining inputs for text area--%>
    <% String username = request.getParameter("username");
        if (username == null) username = "";

        String email = request.getParameter("email");
        if (email == null) email = "";
    %>

    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="<%=username%>">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="<%=email%>">
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
                <p>Unable to register user!</p>
                <ul>
                    <c:forEach var="message" items="${listOfErrors}">
                        <li><c:out value="${message}"></c:out></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"/>

<script src="/js/hideErrorsInProfile.js"></script>
</html>