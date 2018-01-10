<%--<form action="/ads" method="GET">--%>
<%--<div class="row">--%>
<%--<div class="col-md-6">--%>
<%--<div class="input-group">--%>
<%--<span class="input-group-btn">--%>
<%--<button class="btn btn-default" type="Submit">Search</button>--%>
<%--</span>--%>
<%--<input type="text" name="search" class="form-control" placeholder="Search for...">--%>
<%--</div><!-- /input-group -->--%>
<%--</div><!-- /.col-md-12 -->--%>
<%--</div>--%>
<%--</form>--%>

<form action="/ads" method="GET" class="navbar-form navbar-left">
    <div class="input-group">
        <input type="text" name="search" class="form-control" placeholder="Search for an ad">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Go</button>
        </span>
    </div>
</form>