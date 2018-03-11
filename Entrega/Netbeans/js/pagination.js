$(function () {

    $('div.card').click(function () {
        const pubId = $(this).find('input[hidden]').val();
        window.location.replace("publicacion.php?pubId=" + pubId);
    });

    updatePages();
    const $cards = $('div.card');
    if (!$cards.length)
        cargarPagina(1);
});

function updatePages() {

    const parametros = searchParameters();

    $.ajax({
        url: "pagination.php",
        dataType: "json",
        type: "GET",
        data: queryString(parametros),
        //timeout: 3000
    }).done(function (data) {

        const pagination = $('div#paging');
        const pagesCount = Math.ceil(data["total"] / 10);
        const currentPage = parseInt($('div#cards').attr("page"));
        const pages = $('<span>');
        //estos links deberian disparar eventos ajax (cargarPagina)
        const firstPage = $('<a onclick=cargarPagina(1) href="#">1</a>');
        const prevPage = currentPage > 1 ?
                `<a onclick=cargarPagina(${currentPage - 1}) href="#">  <<  </a>` : '';
        const nextPage = currentPage < pagesCount ?
                `<a onclick=cargarPagina(${currentPage + 1}) href="#">  >>  </a>` : '';
        const currPage = `<span> ... ${currentPage} ... </span>`;
        const lastPage = $(`<a onclick=cargarPagina(${pagesCount}) href="#">${pagesCount}</a>`);

        pagination.html('');
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

