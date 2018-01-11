/**
 * Search Form Submit Event Handler
 */

var search = document.getElementById("search");

search.addEventListener("click", function (e) {
    e.preventDefault();

    var term = document.getElementById("search-term");

     if (term.value.includes("<") || term.value.includes(">")) {
        searchError = document.getElementById("search-error");
        searchError.innerHTML = ("HTML tags are not valid");

    } if (term.value.includes("$")) {
        searchError = document.getElementById("search-error");
       searchError.innerHTML = ("$ is not valid");

    } else  {
        var searchForm = document.getElementById("search-form");
        console.log('Submitting searchForm...');
        searchForm.submit();
    }
});

/**
 * Login Form Submit Event Listenter 1
 */
var user = document.getElementById("user-btn");

user.addEventListener("click",function(e) {
e.preventDefault();

    var username = document.getElementById("userinput");


    if (username.value.trim("")) {
        var userError = document.getElementById("user-error");
        userError.innerHTML = ("please fill out Input");

    } if (username.value === "<"|| username.value === ">") {
        userError = document.getElementById("user-error");
        userError.innerHTML = ("< and > are not valid");

    } if (username.value.includes ("$")
        || username.value.includes ("@")
        || username.value.includes ("*")
        || username.value.includes ("&")
        || username.value.includes ("%")
        || username.value.includes ("#")) {
        userError = document.getElementById("user-error");
        userError.innerHTML = ("special characters are not valid");

     } else {
         var userForm = document.getElementById("user-form");
         console.log('Submittign userForm...');
         userForm.submit();
    }
});

/**
 * Login Form Submit Event Handler 2
 */

var pass = document.getElementById("user-btn");

pass.addEventListener("click",function(e) {
    e.preventDefault();
    console.log('form submit button clicked! checking if inputs are valid...');

    var password = document.getElementById("passinput");


    if (password.value.trim("")) {

        var userError = document.getElementById("pass-error");
        userError.innerHTML = ("Please fill out input");

    } if (pass.value === "<"||">") {
        userError = document.getElementById("pass-error");
        userError.innerHTML = ("< and > are not valid");

    }  if (pass.value.includes("$")
        || pass.value.includes("@")
        || pass.value.includes("*")
        || pass.value.includes("&")
        || pass.value.includes("%")
        || pass.value.includes("#")) {

        userError = document.getElementById("pass-error");
        userError.innerHTML = ("special characters are not valid");

    } else {
        var userForm = document.getElementById("user-form");
        console.log('Everything is valid, submitting form...')
        // userForm.submit();
    }
});
