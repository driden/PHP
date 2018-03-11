function searchParameters() {
    let pubTipo = $('select[name="pubType"]').val() || '';
    pubTipo = pubTipo && (pubTipo === "lost" ? 'P' : 'E');
    const pubEspecie = $('select[name="especie"]').val() || '';
    const pubRaza = $('select[name="race"]').val() || '';
    const pubBarrio = $('select[name="neighbourhood"]').val() || '';
    const parametros =
            {
                "estado": pubTipo,
                "especieId": pubEspecie,
                "razaId": pubRaza,
                "barrioId": pubBarrio
            };
    return parametros;
}

function queryString(parametros) {
    let queryString = '';
    for (let k in parametros) {
        const val = parametros[k]
        if (val)
            queryString += `${k}=${val}&`;

    }
    queryString = queryString.substring(0, queryString.length - 1);
    return queryString;
}

function cargarPagina(pagina) {
    // si no se pasa una pagina se carga la 1
    pagina = pagina || 1;
    let params = searchParameters();
    params.page = pagina;
    const filters = queryString(params);

    $.ajax({
        url: "results.php",
        dataType: "json",
        type: "GET",
        data: filters,
        //timeout: 2000,
        beforeSend: function () {
            let cards = $('div#cards');
            cards.html('');
            addLoader(cards);
        }
    }).done(function (data) {

        removeLoader();

        let results = $('div#cards');
        results.attr('page', pagina);

        data.forEach(function (datos) {
            const status = datos["tipo"];
            const title = datos["titulo"];
            let description = datos["descripcion"];
            const id = datos["id"];
            const newCard = createCard(id, status, title, description);

            newCard.appendTo(results);
        });

        updatePages();

    }).fail(function () {
        $("#cards").html('<h1>Oh no</h1>');
    });

}

function createCard(id, status, title, description) {
    if (description.length > 150)
        description = description.substr(0, 147) + "...";
    let bannerClass = status === 'P' ? 'lost' : 'found';
    let card = $('<div class="card"/>');
    let titulo =
            $('<div class="cardBlock"/>')
            .append('<span class="banner ' + bannerClass + ' ">' + title + '</span>');
    ;
    let imagen = $('<div class="cardBlock"/>')
            .append('<img class="photo" src="./img/dog.jpg">');

    let descriptionBlock = $('<div class="cardBlock"/>')
            .append('<p class="description">' + description + '</p>');

    let cardId = $(`<input type="hidden" name="pubId" value="${id}">`);

    titulo.appendTo(card);
    imagen.appendTo(card);
    descriptionBlock.appendTo(card);
    cardId.appendTo(card);
    card.click(function ( ) {
        window.location.replace("publicacion.php?pubId=" + id);
    });
    return card;
}

function addLoader(container) {
    let loader = $('<div class="loader"></div>');
    loader.appendTo(container);
}

function removeLoader() {
    $('div.loader').remove();
}