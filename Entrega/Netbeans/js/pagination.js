$(function () {
    updatePages();
});

function updatePages(){
    // get la cantidad maxima de paginas
     $.ajax({
        url: "pagination.php",
        dataType: "json",
        type: "GET",
        data: '',
        timeout: 3000        
    }).done(function (data) {
        
        const pagination = $('div#paging');
        const currentPage = parseInt($('div#cards').attr("page"));
        const pages = $('<span>');
        const firstPage = $('<a href=/Mascotas/index.php?page=1>1</a>');
        const prevPage = currentPage > 1 ? 
                            `<a href=${currentPage-1}>  <<  </a>` : '';
                            
        const nextPage = currentPage < data["total"] ?
                            `<a href=/Mascotas/index.php?page=${currentPage+1}>  >>  </a>`: '';
        const currPage = `<span> ... ${currentPage} ... </span>`;
        const lastPage = $(`<a href=/Mascotas/index.php?page=${data["total"]}>${data["total"]}</a>`);
        
        pages
            .append(firstPage)
            .append(prevPage)
            .append(currPage)
            .append(nextPage)
            .append(lastPage);
        
        pagination.append(pages);
        
    }).fail(function () {
        $("#paging").html('<h1>Oh no</h1>');
    });
}