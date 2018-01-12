<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <section class="ads_header">
        <div class="row">
            <div class="col-xs-12">
                <h1 style="text-align: center">Here Are all the ads!</h1>
            </div>
        </div>
    </section>
    <section class="ads_display">
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-md-6">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h3>
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
</body>
</html>
