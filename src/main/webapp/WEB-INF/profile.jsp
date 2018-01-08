<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Your Profile" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />

        <div class="container">
            <h1>Welcome, ${sessionScope.user.username}!</h1>

            <button type="button" class="btn btn-default">
                <a href="/edit?id=${sessionScope.user.id}">Edit Profile</a>
            </button>

            <h1>Items You Have For Sale:</h1>

            <c:forEach var="ad" items="${ads}">
                <div class="col-md-6">
                    <h2><a href="/showAd?id=${ad.id}"><c:out value="${ad.title}"/></a></h2>
                    <p><c:out value ="${ad.description}"/></p>
                    <form>
                        <label class="radio-inline">
                            <input id="edit_ad" type="radio" name="edit_ad" value="edit">Edit<br>
                        </label>
                        <label class="radio-inline">
                            <input id="delete_ad" type="radio" name="edit_ad" value="delete">Delete<br>
                        </label>
                        <label class="radio-inline">
                            <button type="button" class="btn btn-default">
                                <a href="/editAd?id=${ad.id}">Submit</a>
                            </button>
                        </label>
                    </form>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
