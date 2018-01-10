<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <section class="welcome">
            <div class="row">
                <div row="col-xs-12">
                    <h1 style="text-align: center">Welcome to the Adlister!</h1>
                </div>
            </div>
        </section>
    </div>

    <%--<div class="container ad_picture">--%>
            <%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="col-xs-12 ad_picture">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<img src="/images/classified.jpg" alt="">&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--</div>--%>

    <%--<div class="container">--%>
        <%--<section class="features">--%>
            <%--<div class="row">--%>
                <%--<div class="col-xs-4">--%>
                    <%--<h1>Categories</h1>--%>
                <%--</div>--%>
                <%--<div class="col-xs-4">--%>
                    <%--<h1>Most recent additions</h1>--%>
                <%--</div>--%>
                <%--<div class="col-xs-4">--%>
                    <%--<h1>xxxxxxxxx</h1>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</section>--%>
    <%--</div>--%>

</body>
</html>
