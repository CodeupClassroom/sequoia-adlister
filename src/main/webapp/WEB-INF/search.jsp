<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Search Results"/>
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>

<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 ads_result">
                <h1 style="text-align: center">Search Results: </h1>
            </div>
        </div>
        <br>
        <section>
            <div class="row">
                <c:forEach var="ad" items="${ads}">
                    <div class="col-md-6">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h3>
                                        <%--<h3 class="panel-title">Choose size and Crust</h3>--%>
                                    </div>
                                    <div class="panel-body">
                                        <h5><c:out value="${ad.description}"/></h5>
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
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
</div>
</body>
</html>
