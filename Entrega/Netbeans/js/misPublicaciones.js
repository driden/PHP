$(function () {
    $.ajax({
        url: "misPublicacionesData.php",
        dataType: "json",
        type: "GET",
        data: "",
        beforeSend: function () {
            let cards = $('div#cards');
            cards.html('');
            addLoader(cards);
        }
    }).done(function (data) {
        removeLoader();
        let results = $('div#cards');

        data.forEach(function (datos) {
            const status = datos["tipo"];
            const title = datos["titulo"];
            let description = datos["descripcion"];
            const id = datos["id"];
            const newCard = createCard(id, status, title, description);

            newCard.appendTo(results);
        });

    });
});