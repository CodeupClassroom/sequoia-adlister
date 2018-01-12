<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Showing ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-lg-12 ads_header">
            <h1 style="text-align: center">Viewing ad:</h1>
        </div>
    </div>
    <br>
    <div class="col-md-6">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">${ad.title}</h3>
                    </div>
                    <div class="panel-body">
                        <h5>Description: ${ad.description}</h5>
                        <h5>Username: ${user.username}</h5>
                        <h5>Email: ${user.email}</h5>
                    </div>
                    <div class="panel-footer text-right">
                        <small>Categories: </small>
                        <c:forEach var="category" items="${ad.categories}">
                            <small><c:out value="${category.category}"/> / </small>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <%--<h2>${ad.title}</h2>--%>
        <%--<p>${ad.description}</p>--%>
        <%--<p>${user.username}</p>--%>
        <%--<p>${user.email}</p>--%>
    </div>
</div>
<%--<jsp:include page="/WEB-INF/partials/footer.jsp"/>--%>
</body>
</html>
