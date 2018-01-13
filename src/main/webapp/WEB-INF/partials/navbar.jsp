<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Adlister</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/ads">See All Ads</a></li>
            </ul>
            <jsp:include page="/WEB-INF/partials/searchbar.jsp" />
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${loggedIn.equals(\"true\")}">
                        <li style="padding: 15px 0;">Welcome, ${sessionScope.user.username}</a></li>
                        <li><a href="/ads/create">Create Ad</a></li>
                        <li><a href="/logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <%--<li><a href="/ads/create">Create Ad</a></li>--%>
                        <li><a href="/login">Login</a></li>
                        <li><a href="/register">Become a Member</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
