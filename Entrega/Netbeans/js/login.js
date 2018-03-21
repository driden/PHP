// Referencia: https://stackoverflow.com/questions/18746234/jquery-validate-plugin-password-check-minimum-requirements-regex

$(document).ready(function () {
   

    $.validator.addMethod("mailCheck", function (value) {
        return /^[a-z][a-zA-Z0-9_]*(\.[a-zA-Z][a-zA-Z0-9_]*)?@[a-z][a-zA-Z-0-9]*\.[a-z]+(\.[a-z]+)?$/.test(value);
    });

    $('#user-form').validate({
        rules: {
            email: {
                required: true,
                mailCheck: true,
                remote: {
                    data: {
                        checkMail: function(){
                            return $("#email").val();
                    }},
                    type: "POST",
                    url: "login.php"
                }
            },
            password: {
                required: true
                
            }
        },
        messages: {
            email: {
                required: "El campo de email es requerido",
                mailCheck: "Proporciona un email válido",
                remote: "El usuario no existe en la BD"
            },
            password: {
                required: "El password es un campo requerido"
            }
        },

        highlight: function (element, errorClass, validClass) {
            $(element).nextAll('.form-control-feedback').show().removeClass('glyphicon-ok').addClass('glyphicon-remove');
            $(element).addClass(errorClass).removeClass(validClass);
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            $(element).nextAll('.form-control-feedback').show().removeClass('glyphicon-remove').addClass('glyphicon-ok');
            element.closest('.form-group').removeClass('has-error').addClass('has-success');
            $(element).remove();
        }
    });
    
    if( $('#user-form').valid())
        $('#user-form').submit();
});