<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 welcome">
                    <h1 style="text-align: center">Welcome, ${sessionScope.user.username}!</h1>
                    <img id="profile_pic" src="/images/user_pic.png" alt="">
                    <h5>Username: ${sessionScope.user.username}</h5>
                    <h5>email: ${sessionScope.user.email}</h5>
                    <button type="button" class="btn btn-default center-block">
                        <a href="/editUser?id=${sessionScope.user.id}"><span class="glyphicon glyphicon-edit"
                                                                             aria-hidden="true"></span> Edit Profile</a>
                    </button>
                </div>

                <div class="col-lg-offset-1 col-lg-8">
                    <h1 style="text-align: center" class="ads_header">Items You Have For Sale:</h1>
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

                                            <%--<div class="panel-footer text-right">--%>
                                                <%--<small>Categories: </small>--%>
                                                <%--<c:forEach var="category" items="${ad.categories}">--%>
                                                    <%--<small><c:out value="${category.category}"/> / </small>--%>
                                                <%--</c:forEach>--%>
                                            <%--</div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="col-lg-6 ads_display_by_col">--%>
                                <%--<h3><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h3>--%>
                                <%--<h5><c:out value="${ad.description}"/></h5>--%>

                                <%--<small>Categories: </small>--%>
                                <%--<c:forEach var="category" items="${ad.categories}">--%>
                                    <%--<small><c:out value="${category.category}"/> / </small>--%>
                                <%--</c:forEach>--%>

                                <div class="row">
                                    <div class="col-lg-offset-1 col-lg-3">
                                        <button type="button" class="btn btn-default">
                                            <a href="/editAd?id=${ad.id}&title=${ad.title}&description=${ad.description}"><span
                                                    class="glyphicon glyphicon-edit" aria-hidden="true"></span> Edit Ad</a>
                                        </button>
                                    </div>
                                    <div class="col-lg-offset-2 col-lg-3">
                                        <form id="myform" method="post" action="/deleteAd">
                                            <input type="hidden" name="id" value=${ad.id}>
                                            <button type="submit" class="btn btn-danger"><span
                                                    class="glyphicon glyphicon-remove-sign"></span> Delete Ad
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp"/>
</body>
</html>
<%--<h3>Nested Columns</h3>--%>
<%--<div class="row">--%>

    <%--<div class="col-lg-8">1</div>--%>
    <%--<div class="col-lg-4">--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-6">1</div>--%>
            <%--<div class="col-lg-6">2</div>--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>