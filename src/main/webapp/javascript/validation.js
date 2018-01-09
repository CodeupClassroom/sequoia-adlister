var search = document.getElementById("search");

search.addEventListener("click", function (e) {
    e.preventDefault();
    var term = document.getElementById("search-term");

    if (term.value === "") {
       var searchError = document.getElementById("search-error");
       searchError.innerHTML = ("Please Input something");
    } else {
        var searchForm = document.getElementById("search-form");
        searchForm.submit();
    }
});
