$(function () {
    updatePages();
    const $cards = $('div.card');
    if (!$cards.length)
        cargarPagina(1);
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
        pagination.html('');
        
        const currentPage = parseInt($('div#cards').attr("page"));
        const pages = $('<span>');
        
        //estos links deberian disparar eventos ajax (cargarPagina)
        const firstPage = $('<a onclick=cargarPagina(1) href="#">1</a>');
        const prevPage = currentPage > 1 ? 
                        `<a onclick=cargarPagina(${currentPage-1}) href="#">  <<  </a>` : '';
                            
        const nextPage = currentPage < data["total"] ?
                        `<a onclick=cargarPagina(${currentPage+1}) href="#">  >>  </a>`: '';
        const currPage = `<span> ... ${currentPage} ... </span>`;
        const lastPage = $(`<a onclick=cargarPagina(${data["total"]}) href="#">${data["total"]}</a>`);
        
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