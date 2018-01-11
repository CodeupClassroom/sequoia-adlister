<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Adlister</a>
        </div>
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">List of ads</a>
        </div>
        <ul class="nav navbar-nav navbar-right">

            <form action="/search" class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" name="search" class="form-control" placeholder="Search AdLister">
                    <button type="submit" class="btn btn-default">Search</button>
                </div>

            </form>
        <%--Don't allow ad creation unless a user is logged in.--%>
        <c:if test="${sessionScope.user == null}">
            <li><a href="/login">Login</a></li>
            <li><a href="/logout">Logout</a></li>
            <li><a href="/register">Register</a></li>
            <li><a href="/search_categories">Search by Category</a></li>

        </c:if>

            <c:if test="${sessionScope.user != null}">
                <li><a href="/ads">List of Ads</a></li>
                <li><a href="/ads/create">Create an Ad</a></li>
                <li><a href="/profile">${user.username}'s Profile</a></li>
                <li><a href="/logout">Logout</a></li>

            </c:if>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
