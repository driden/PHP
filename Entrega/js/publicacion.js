$('input#cerrarPublicacion').click(() => {
    $('div#cerrarPubPopUp').css('display','block')
});
const ocultar = () => $('div#cerrarPubPopUp').css('display','none')
$('input#btnCerrar').click(
    () => {
        alert("ir a avisar a la bd que se cerro")
        ocultar()
})


$('input#btnNoCerrar').click(ocultar)


