<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit an ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<%--// obtaining inputs for text area--%>
<% String title = request.getParameter("title");
    if (title == null) title = "";

    String description = request.getParameter("description");
    if (description == null) description = "";
%>

<div class="container nonFooter">
    <div id="content">
        <div class="row">
            <div class="col-lg-12 ads_result">
                <h1 style="text-align: center"  >Editing Ads</h1>
            </div>
        </div>
        <br>
        <form action="/editAd" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="<%=title%>">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control"><%=description%></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
        <c:if test="${sessionScope.listOfEditUserErrors.size() > 0}">
            <div id="errors" class="alert alert-danger">
                <p>Unable to edit ad!</p>
                <ul>
                    <c:forEach var="message" items="${listOfErrors}">
                        <li><c:out value="${message}"></c:out></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</div>
</body>
<%--<jsp:include page="/WEB-INF/partials/footer.jsp"/>--%>
<script src="/js/hideErrorsInProfile.js"></script>
</html>




