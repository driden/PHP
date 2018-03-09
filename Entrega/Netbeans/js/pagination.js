$(function () {
    // get la cantidad maxima de paginas
     $.ajax({
        url: "pagination.php",
        dataType: "json",
        type: "GET",
        data: '',
        timeout: 3000        
    }).done(function (data) {
        console.log(data);
    }).fail(function () {
        $("#paging").html('<h1>Oh no</h1>');
    });
});