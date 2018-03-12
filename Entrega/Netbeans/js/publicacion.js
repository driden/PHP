$(function () {

    $('#questions').off().on('click','.controlRespuesta button', responder);
    $('input#cerrarPublicacion').click(() => {
        $('div#cerrarPubPopUp').css('display', 'block')
    });
    const ocultar = () => $('div#cerrarPubPopUp').css('display', 'none')
    $('input#btnCerrar').click(
            () => {
        alert("ir a avisar a la bd que se cerro")
        ocultar()
    })


    $('input#btnNoCerrar').click(ocultar)
});

function crearPregunta(e, respuesta){
    let borrar = e.parent();
        let respuestaDiv = borrar.prevAll('.vacia');
        // agregar respuesta y borrar los controles
        respuestaDiv
                .removeClass("vacia")
                .find("p")
                .text(respuesta);

        borrar.remove();
}


function responder(e) {
    const elemento = $(this);
    $(this).prop('disabled',true);
    const pregId = $(this).closest("[preguntaid]").attr("preguntaid");
    const respuesta = encodeURIComponent($(this).prevAll("input").first().val());
    const accion = `responder=${pregId}&texto=${respuesta}`;
    $.ajax({
        url: "publicacion.php",
        data: accion,
        type: "POST"

    }).done(function () {
        crearPregunta(elemento,decodeURIComponent(respuesta));
        
    }).fail(function (d) {
        console.log(d);
    });
}
