<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to the Adlister!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container nonFooter">
    <div id="content">
        <section class="welcome">
            <div class="row">
                <div class="col-xs-12">
                    <h1 style="text-align: center">Welcome to our Yard Sale Adlister!</h1>
                </div>
            </div>
        </section>
        <br>
        <br>
        <section class="carousel_section">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <img src="/images/cats.jpg" alt="Cats" width="460" height="600">
                        <div class="carousel-caption">
                            <h3>Cats, dogs, horses and more</h3>
                            <p>Even farm animals!</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="/images/toddler_clothes.jpg" alt="Clothes" width="460" height="600">
                        <div class="carousel-caption">
                            <h3>Toddlers clothes</h3>
                            <p>Clothing new or used in good condition</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="/images/books.jpg" alt="Xray" width="460" height="600">
                        <div class="carousel-caption">
                            <h3>Any kind of ads here!</h3>
                            <p>and more!</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="/images/rose.jpeg" alt="Flower" width="460" height="600">
                        <div class="carousel-caption">
                            <h3>Flowers</h3>
                            <p>Beautiful flowers.</p>
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>
    </div>
</div>

<jsp:include page="/WEB-INF/partials/footer.jsp"/>


</body>
</html>
