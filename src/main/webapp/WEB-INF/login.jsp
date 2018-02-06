<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<% String username = request.getParameter("username");
    if (username == null) username = ""; %>

<div class="container nonFooter">
    <div id="content">
        <div class="row">
            <div class="col-lg-12 login_header">
                <h1 style="text-align: center">Please Log In</h1>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-lg-12">
                <form action="/login" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text" value="<%=username%>">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" class="form-control" type="password">
                    </div>
                    <input type="submit" class="btn btn-primary btn-block" value="Log In">
                </form>

                <c:if test="${sessionScope.listOfLoginErrors.size() > 0}">
                    <div id="errors" class="alert alert-danger">
                        <p>Unable to login!</p>
                        <ul>
                            <c:forEach var="message" items="${listOfLoginErrors}">
                                <li><c:out value="${message}"></c:out></li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<%--<jsp:include page="/WEB-INF/partials/footer.jsp"/>--%>
<script src="/js/hideErrorsInProfile.js"></script>
</body>
</html>
