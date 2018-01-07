<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${ sessionScope.user != null}">
                <li><a href="/logout">Logout</a></li>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <li><a href="/login">Login</a></li>
            </c:if>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
