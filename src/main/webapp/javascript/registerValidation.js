
// /**
//  * Search Form Submit Event Handler
//  */
//
// var search = document.getElementById("search");
//
// search.addEventListener("click", function (e) {
//     e.preventDefault();
//
//     var term = document.getElementById("search-term");
//
//      if (term.value.includes("<") || term.value.includes(">")) {
//         searchError = document.getElementById("search-error");
//         searchError.innerHTML = ("HTML tags are not valid");
//
//     } if (term.value.includes("$")) {
//         searchError = document.getElementById("search-error");
//        searchError.innerHTML = ("$ is not valid");
//
//     } else  {
//         var searchForm = document.getElementById("search-form");
//         console.log('Submitting searchForm...');
//         searchForm.submit();
//     }
// });
//
// /**
//  * Login Form Submit Event Listenter 1
//  */
// var user = document.getElementById("user-btn");
//
// user.addEventListener("click",function(e) {
// e.preventDefault();
//
//     var username = document.getElementById("userinput");
//
//
//     if (username.value.trim("")) {
//         var userError = document.getElementById("user-error");
//         userError.innerHTML = ("please fill out Input");
//
//     } if (username.value === "<"|| username.value === ">") {
//         userError = document.getElementById("user-error");
//         userError.innerHTML = ("< and > are not valid");
//
//     } if (username.value.includes ("$")
//         || username.value.includes ("@")
//         || username.value.includes ("*")
//         || username.value.includes ("&")
//         || username.value.includes ("%")
//         || username.value.includes ("#")) {
//         userError = document.getElementById("user-error");
//         userError.innerHTML = ("special characters are not valid");
//
//      } else {
//          var userForm = document.getElementById("user-form");
//          console.log('Submittign userForm...');
//          userForm.submit();
//     }
// });
//
// /**
//  * Login Form Submit Event Handler 2
//  */
//
// var pass = document.getElementById("user-btn");
//
// pass.addEventListener("click",function(e) {
//     e.preventDefault();
//     console.log('form submit button clicked! checking if inputs are valid...');
//
//     var password = document.getElementById("passinput");
//
//
//     if (password.value.trim("")) {
//
//         var userError = document.getElementById("pass-error");
//         userError.innerHTML = ("Please fill out input");
//
//     } if (pass.value === "<"||">") {
//         userError = document.getElementById("pass-error");
//         userError.innerHTML = ("< and > are not valid");
//
//     }  if (pass.value.includes("$")
//         || pass.value.includes("@")
//         || pass.value.includes("*")
//         || pass.value.includes("&")
//         || pass.value.includes("%")
//         || pass.value.includes("#")) {
//
//         userError = document.getElementById("pass-error");
//         userError.innerHTML = ("special characters are not valid");
//
//     } else {
//         var userForm = document.getElementById("user-form");
//         console.log('Everything is valid, submitting form...')
//         // userForm.submit();
//     }
// });



var myInput = document.getElementById("psw");
var eInput = document.getElementById("email");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");
var username = document.getElementById("usrname");
var userError = document.getElementById("confirm");





// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
    document.getElementById("message").style.display = "block";
};

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
    document.getElementById("message").style.display = "none";

};

// When the user starts to type something inside the password field
myInput.onkeyup = function() {

    // Validate lowercase letters
    var lowerCaseLetters = /[a-z]/g;
    if (myInput.value.match(lowerCaseLetters)) {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
    } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
    }

    // Validate capital letters
    var upperCaseLetters = /[A-Z]/g;
    if (myInput.value.match(upperCaseLetters)) {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
    } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
    }

    // Validate numbers
    var numbers = /[0-9]/g;
    if (myInput.value.match(numbers)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
    } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
    }

    // Validate length
    if (myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
    } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
    }

    // Validate email
    var email = /[@]/g;
    if (eInput.value.match(email)) {
        email.classList.remove("invalid");
        email.classList.add("valid");
    } else {
        email.classList.remove("valid");
        email.classList.add("invalid")
    }

    };




    if (username.value.match("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#includes")) {

        userError.classList.remove("invalid");
        userError.classList.remove("valid");

    }else {
        userError.classList.remove("valid");
        userError.classList.remove("invalid");



}





