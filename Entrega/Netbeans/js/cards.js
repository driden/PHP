function cargarPagina(pagina) {
    // si no se pasa una pagina se carga la 1
    const action = pagina ? `page=${pagina}` : 'page=1';
    
    $.ajax({
        url: "results.php",
        dataType: "json",
        type: "GET",
        data: action,
        timeout: 2000,
        beforeSend: function () {
            addLoader($('div#cards'));
        }
    }).done(function (data) {
        
        removeLoader();
        
        const results = $('div#cards');
        
        data.forEach(function(datos){
            const status = datos["tipo"];
            const title = datos["titulo"];
            let description = datos["descripcion"];
            const id = datos["id"];
            const newCard = createCard(id,status,title,description);
            
            newCard.appendTo(results);
        });
        
    }).fail(function () {
        $("#cards").html('<h1>Oh no</h1>');
    });

}

function createCard(id, status, title, description) {
    if (description.length > 150) 
        description = description.substr(0,147) + "...";
    let bannerClass = status === 'P' ? 'lost' : 'found';
    let card = $('<div class="card"/>');
    let titulo =
            $('<div class="cardBlock"/>')
            .append('<span class="banner '+bannerClass+' ">' + title + '</span>');;
    let imagen = $('<div class="cardBlock"/>')
            .append('<img class="photo" src="./img/dog.jpg">');

    let descriptionBlock = $('<div class="cardBlock"/>')
            .append('<p class="description">' + description + '</p>');
    
    let cardId = $(`<input type="hidden" name="pubId" value="${id}">`);

    titulo.appendTo(card);
    imagen.appendTo(card);
    descriptionBlock.appendTo(card);
    cardId.appendTo(card);
    return card;
}

function addLoader(container){
    let loader = $('<div class="loader"></div>');
    loader.appendTo(container);
}

function removeLoader(){
    $('div.loader').remove();
}

$(function () {
    cargarPagina();    
});
