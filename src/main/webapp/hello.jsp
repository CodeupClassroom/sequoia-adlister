<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="partials/head.jsp" />
<body>

<form class="col-md-8 col-md-offset-2">

    <h1 class="text-center">${greeting.message}</h1>

    <div class="form-group">
        <label for="name">Enter your name:</label>
        <input type="text" class="form-control" id="name" name="name" />
    </div>

    <input type="submit" class="btn btn-block btn-primary">

</form>

</body>
</html>
