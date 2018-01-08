<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->

    <%-------Search Bar--------%>
    <div class="topNav">
        <div class="search-container">
            <form action="/search">
                <input type="text" placeholder="Search" name="search">
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>

</nav>
