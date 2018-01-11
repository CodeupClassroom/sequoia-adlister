var search = document.getElementById("search");

search.addEventListener("click", function (e) {
    e.preventDefault();

    var term = document.getElementById("search-term");

    if (term.value === "" || " ") {
        var searchError = document.getElementById("search-error");
        searchError.innerHTML = ("Please Input something");
    }else if (term.value === "<"||">") {
        searchError = document.getElementById("search-error");
        searchError.innerHTML = ("HTML tags are not valid");
    } else if (term.value === "$") {
        searchError = document.getElementById("search-error");
       searchError.innerHTML = ("$ is not valid");
    } else  {
        var searchForm = document.getElementById("search-form");
        searchForm.submit();
    }
});


var user = document.getElementById("user-btn");

user.addEventListener("click",function(e) {
e.preventDefault();

var username = document.getElementById("userinput");


    if (username.value === "") {
        var userError = document.getElementById("user-error");
        userError.innerHTML = ("please fill out Input");
    }else if (username.value === "<"|| username.value === ">") {
        userError = document.getElementById("user-error");
        userError.innerHTML = ("< and > are not valid");
    } else if (username.value === "$"|| username.value === "@" || username.value === "*" || username.value === "&" || username.value === "%" || username.value === "#") {
        userError = document.getElementById("user-error");
        userError.innerHTML = ("special characters are not valid");

     } else {
         var userForm = document.getElementById("user-form");
         userForm.submit();
    }
});

var pass = document.getElementById("user-btn");

pass.addEventListener("click",function(e) {
    e.preventDefault();

    var password = document.getElementById("passinput");


    if (password.value === "" || " ") {

        var userError = document.getElementById("pass-error");
        userError.innerHTML = ("Please fill out input");

    }else if (pass.value === "<"||">") {
        userError = document.getElementById("pass-error");
        userError.innerHTML = ("< and > are not valid");

    } else if (pass.value === "$"|| "@" || "*" || "&" || "%" || "#") {
        userError = document.getElementById("pass-error");
        userError.innerHTML = ("special characters are not valid");

    } else {
        var userForm = document.getElementById("user-form");
        userForm.submit();
    }
});
