var user = document.getElementById("formsubmit");

user.addEventListener("click",function(e) {
    e.preventDefault();

    var username = document.getElementById("reg-username");


    if (username.value.trim() === ""){
        var userError = document.getElementById("reg-usererror");
        userError.innerHTML = ("please fill out Input");

    }else if (username.value.includes("<") || username.value.includes(">")){
        userError = document.getElementById("reg-usererror");
        userError.innerHTML = ("< and > are not valid");

    } else if (username.value.includes("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#")){
        userError = document.getElementById("reg-usererror");
        userError.innerHTML = ("special characters are not valid");

    } else {
        var userForm = document.getElementById("formsubmit");
        userForm.submit();
    }
});



var email = document.getElementById("formsubmit");

email.addEventListener("click",function(e) {
    e.preventDefault();

    var emailinput = document.getElementById("reg-email");


    if (emailinput.value.trim() === "") {

        var emailerror = document.getElementById("reg-emailerror");
        emailerror.innerHTML = ("Please fill out input");

    }else if (emailinput.value.includes("<") || emailinput.value.includes(">")) {
        emailerror = document.getElementById("reg-emailerror");
        emailerror.innerHTML = ("< and > are not valid");

    } else if (emailinput.value.includes("$")
        ||emailinput.value.includes("*")
        ||emailinput.value.includes("&")
        ||emailinput.value.includes("%")
        ||emailinput.value.includes("#")) {
        emailerror = document.getElementById("reg-emailerror");
        emailerror.innerHTML = ("special characters are not valid");

    } else {
        var regForm = document.getElementById("formsubmit");
        regForm.submit();
    }
});

var pass = document.getElementById("formsubmit");

pass.addEventListener("click",function(e) {
    e.preventDefault();

    var password = document.getElementById("reg-password");


    if (password.value.trim() === ""){
        var passError = document.getElementById("reg-passerror");
        passError.innerHTML = ("please fill out Input");

    }else if (password.value.includes("<") || username.value.includes(">")){
        passError = document.getElementById("reg-passerror");
        passError.innerHTML = ("< and > are not valid");

    } else if (username.value.includes("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#")){
        passError = document.getElementById("reg-passerror");
        passError.innerHTML = ("special characters are not valid");

    } else {
        var userForm = document.getElementById("formsubmit");
        userForm.submit();
    }
});


var confpass = document.getElementById("formsubmit");

confpass.addEventListener("click",function(e) {
    e.preventDefault();

    var cpassword = document.getElementById("reg_confirm_password");


    if (cpassword.value.trim() === ""){
        var cpassError = document.getElementById("reg-conpasserror");
        cpassError.innerHTML = ("please fill out Input");

    }else if (password.value.includes("<") || password.value.includes(">")){
        cpassError = document.getElementById("reg-conpasserror");
        cpassError.innerHTML = ("< and > are not valid");

    } else if (username.value.includes("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#")){
        passError = document.getElementById("reg-conpasserror");
        passError.innerHTML = ("special characters are not valid");

    } else {
        var userForm = document.getElementById("formsubmit");
        userForm.submit();
    }
});