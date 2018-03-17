$(function () {

    $('#questions').off().on('click', '.controlRespuesta button', responder);
    $('#questions').off().on('click', '.controlPregunta button', preguntar);
    $('input#cerrarPublicacion').click(() => {
        $('div#cerrarPubPopUp').css('display', 'block')
    });
    const ocultar = () => $('div#cerrarPubPopUp').css('display', 'none')
    $('input#btnCerrar').click(
            () => {
        ocultar()
    })


    $('input#btnNoCerrar').click(ocultar)
});

function crearPregunta(e, respuesta) {
    let borrar = e.parent();
    let respuestaDiv = borrar.prevAll('.vacia');
    // agregar respuesta y borrar los controles
    respuestaDiv
            .removeClass("vacia")
            .find("p")
            .text(respuesta);

    borrar.remove();
}

// https://www.c-sharpcorner.com/UploadFile/cd7c2e/get-values-from-query-string-using-jquery/
function GetParameterValues(param) {
    var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (let i = 0; i < url.length; i++) {
        const urlparam = url[i].split('=');
        if (urlparam[0] == param) {
            return urlparam[1];
        }
    }
}

function preguntar() {
    const textoPregunta = $(this).prevAll("input").first().val();
    $('span.no-preguntas').remove();
    if (textoPregunta.length == 0)
        return;

    const questions = $('div#questions');
    let div = $('<div>').attr("preguntaid", "");
    const pregunta =
            $("<div>")
            .addClass("pregunta")
            .append("<p>").text(textoPregunta);
    const respuesta =
            $("<div>")
            .addClass("respuesta")
            .append("<p>");
    questions.append(div);
    div.append(pregunta, respuesta);

    // Persistirlo en la base
    const pubId = parseInt(GetParameterValues("pubId"));
    const accion = `preguntar=${textoPregunta}&pubId=${pubId}`;
    $.ajax({
        async: false,
        url: "publicacion.php",
        data: accion,
        type: "POST"
    });
}


function responder(e) {
    const elemento = $(this);
    $(this).prop('disabled', true);
    const pregId = $(this).closest("[preguntaid]").attr("preguntaid");
    const respuesta = encodeURIComponent($(this).prevAll("input").first().val());
    const accion = `responder=${pregId}&texto=${respuesta}`;
    $.ajax({
        url: "publicacion.php",
        data: accion,
        type: "POST"

    }).done(function () {
        crearPregunta(elemento, decodeURIComponent(respuesta));

    }).fail(function (d) {
        console.log(d);
    });
}
