var user = document.getElementById("formsubmit");

user.addEventListener("click",function() {


    var username = document.getElementById("reg-username");


    if (username.value.trim() === ""){
        var userError = document.getElementById("reg-usererror");
        userError.innerHTML = ("please fill out Input");

    } if (username.value.includes("<") || username.value.includes(">")){
        userError = document.getElementById("reg-usererror");
        userError.innerHTML = ("< and > are not valid");

    } if (username.value.includes("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#")){
        userError = document.getElementById("reg-usererror");
        userError.innerHTML = ("special characters are not valid");

    }

    var emailinput = document.getElementById("reg-email");


    if (emailinput.value.trim() === "") {

        var emailerror = document.getElementById("reg-emailerror");
        emailerror.innerHTML = ("Please fill out input");

    } if (emailinput.value.includes("<") || emailinput.value.includes(">")) {
        emailerror = document.getElementById("reg-emailerror");
        emailerror.innerHTML = ("< and > are not valid");

    } if (emailinput.value.includes("$")
        ||emailinput.value.includes("*")
        ||emailinput.value.includes("&")
        ||emailinput.value.includes("%")
        ||emailinput.value.includes("#")) {
        emailerror = document.getElementById("reg-emailerror");
        emailerror.innerHTML = ("special characters are not valid");

    }


    var password = document.getElementById("txtPassword");


    if (password.value.trim() === ""){
        var passError = document.getElementById("reg-passerror");
        passError.innerHTML = ("please fill out Input");

    }else if (password.value.includes("<") || password.value.includes(">")){
        passError = document.getElementById("reg-passerror");
        passError.innerHTML = ("< and > are not valid");

    } else if (password.value.includes("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#")){
        passError = document.getElementById("reg-passerror");
        passError.innerHTML = ("special characters are not valid");

    }


    var cpassword = document.getElementById("txtConfirmPassword");


    if (cpassword.value.trim() === ""){
        var cpassError = document.getElementById("reg-conpasserror");
        cpassError.innerHTML = ("please fill out Input");

    }if (password.value.includes("<") || password.value.includes(">")){
        cpassError = document.getElementById("reg-conpasserror");
        cpassError.innerHTML = ("< and > are not valid");

    }if (username.value.includes("$")
        || username.value.includes("@")
        || username.value.includes("*")
        || username.value.includes("&")
        || username.value.includes("%")
        || username.value.includes("#")){

        passError = document.getElementById("reg-conpasserror");
        passError.innerHTML = ("special characters are not valid");

    }
    console.log(password.value);
    console.log(cpassword.value);


        function Validation() {


            if (cpassword.value !== password.value) {
                document.getElementById("reg-conpasserror").innerHTML = "Passwords do not match";
            }
        }

    window.setTimeout(Validation, 5000);

});