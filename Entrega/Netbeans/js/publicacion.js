$(function () {

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


function responder() {
    const pregId = $('#controlRespuesta').closest("div[preguntaid]").attr("preguntaid");
    const respuesta = encodeURIComponent($('input#textoRespuesta').val());
    const accion = `responder=${pregId}&texto=${respuesta}`;
    $.ajax({
        url: "publicacion.php",
        dataType: "json",
        data: accion,
        type: "POST",

    }).done(function () {
        // agregar respuesta y borrar los controles
        $('div.respuesta.vacia')
                .find("p")
                .removeClass("vacia")
                .text(respuesta);
        $('div#controlRespuesta').remove();
    }).fail(function(d){console.log(d);});
}