<%--
  Created by IntelliJ IDEA.
  User: paomac
  Date: 1/5/18
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>


<%--Ad show page--%>

<%--Create a page that shows the information about an individual ad. This page should show all the
information about that ad, as well as the information about the user that posted the ad.--%>

<%--Your ads index page should contain links to each individual ad page.--%>

<%--You should have one page that displays the information for any arbitrary ad.
Consider passing the id of the ad as a parameter in the GET request to this page.--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Showing ad" />
    </jsp:include>
</head>
<body>
<div class="container">
    <div class="col-md-6">
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>
        <p>${user.username}</p>
        <p>${user.email}</p>
    </div>
</div>
</body>
</html>