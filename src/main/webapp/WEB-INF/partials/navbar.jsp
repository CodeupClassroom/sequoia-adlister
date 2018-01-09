<link rel="stylesheet" href="/webapp/design/loginPage.css">
<nav class="navbar navbar-default">
    <div id="box" class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Trash to Treasure</a>
        </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->

    <%-------Search Bar--------%>
    <form class="navbar-form navbar-center" id="search-form" action="/search">
        <div class="form-group">
                <input type="text" id="search-term" class="form-control" placeholder="Search" name="search">
            <div id="search-error"></div>
                <button type="submit" id="search" class="btn btn-default">Submit</button>
        </div>
    </form>

</nav>

