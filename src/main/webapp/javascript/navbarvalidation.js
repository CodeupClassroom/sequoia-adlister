/**
 * Search Form Submit Event Handler
 */

var search = document.getElementById("search");
var searchError = document.getElementById("search-error");

search.addEventListener("click", function (e) {
    e.preventDefault();

    var term = document.getElementById("search-term");

    if (term.value.includes("<") || term.value.includes(">")) {

        searchError.innerHTML = ("HTML tags are not valid");

    } if (term.value.includes("$")) {
        searchError.innerHTML = ("$ is not valid");

    } else  {
        var searchForm = document.getElementById("search-form");
        console.log('Submitting searchForm...');
        searchForm.submit();
    }
});