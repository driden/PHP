$(document).ready(function() {
    $('#user-form').validate({
   rules: {
     email: {
       required: true,
       email: true
     },
   },
   
   highlight: function(element, errorClass, validClass) { 
     $(element).nextAll('.form-control-feedback').show().removeClass('glyphicon-ok').addClass('glyphicon-remove');
     $(element).addClass(errorClass).removeClass(validClass);
     $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
   },
   success: function(element) {
     $(element).nextAll('.form-control-feedback').show().removeClass('glyphicon-remove').addClass('glyphicon-ok');
  element.closest('.form-group').removeClass('has-error').addClass('has-success');
     $(element).remove();
   }
 });
});