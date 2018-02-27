$(document).ready(function () {

    let component = {
        inputEmail: $('input#email'),
        inputPassword: $('input#password'),
        inputFullName: $('input#fullName'),
        message: {
            fields: $('.msg'),
            successMail: $('.success.mail'),
            successPassword: $('.success.password'),
            errorMail: $('.error.mail'),
            errorPassword: $('.error.password'),
            successFullName: $('.success.fullName'),
            errorFullName: $('.error.fullName')
        }
    }

    const regexEmail = /^[a-z][a-zA-Z0-9_]*(\.[a-zA-Z][a-zA-Z0-9_]*)?@[a-z][a-zA-Z-0-9]*\.[a-z]+(\.[a-z]+)?$/;
    const regexPassword = /(?=.*\d)(?=.*[aA-zZ]).{8,}/;

    component.inputEmail.keyup(function () {
        component.message.errorMail.hide();
        regexEmail.test(component.inputEmail.val()) ? component.message.successMail.show() : component.message.errorMail.show();
    });

    component.inputEmail.keydown(function () {
        component.message.successMail.hide();

    });

    component.inputPassword.keyup(function () {
        component.message.errorPassword.hide();
        regexPassword.test(component.inputPassword.val()) ? component.message.successPassword.show() : component.message.errorPassword.show();
    });

    component.inputPassword.keydown(function () {
        component.message.successPassword.hide();

    });

    component.inputFullName.blur(function () {
        component.message.errorFullName.hide();
        !component.inputFullName.val().length ? 
            component.message.errorFullName.show() :
            component.message.errorFullName.hide();
    });

    $( "#failure-btn").click(function() {
        $( "div.failure" ).fadeIn( 300 ).delay( 1500 ).fadeOut( 400 );
      });



})