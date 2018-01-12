<%--
  Created by IntelliJ IDEA.
  User: damionbrown
  Date: 1/11/18
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <link rel="stylesheet" href="/css/category.css">
    <style>
        h1 {
            text-align: center;
            font-size: 65px;
            text-shadow: 3px 3px 0 #cdcdcd;
        }

        form {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Search by Category</h1>
    <form method="post">
        <label for="For Sale" class="checkbox-inline">
            <input id="For Sale" type="checkbox" name="categories_id" value="1">For Sale
        </label>

        <label for="Free Stuff" class="checkbox-inline">
            <input id="Free Stuff" type="checkbox" name="categories_id" value="2">Free Stuff
        </label>

        <label for="Services" class="checkbox-inline">
            <input id="Services" type="checkbox" name="categories_id" value="3">Services
        </label>

        <label for="Jobs" class="checkbox-inline">
            <input id="Jobs" type="checkbox" name="categories_id" value="4">Jobs
        </label>

        <label for="Personals" class="checkbox-inline">
            <input id="Personals" type="checkbox" name="categories_id" value="5">Personals
        </label>

        <label for="Gigs" class="checkbox-inline">
            <input id="Gigs" type="checkbox" name="categories_id" value="6">Gigs
        </label>

        <label for="Housing" class="checkbox-inline">
            <input id="Housing" type="checkbox" name="categories_id" value="7">Housing
        </label>

        <label for="Electronics" class="checkbox-inline">
            <input id="Electronics" type="checkbox" name="categories_id" value="8">Electronics
        </label>
        <input type="submit" class="btn btn-block btn-danger">
    </form>

    <img src="../imgs/waldo-wave2.jpg" alt="waldo_waving">

</div>
</div>
</body>
</html>
