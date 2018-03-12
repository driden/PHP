<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <link href="css/header.css" rel="stylesheet" type="text/css">
        <link href="css/cards.css" rel="stylesheet" type="text/css">
        <link href="css/publicacion.css" rel="stylesheet" type="text/css">
        <link href="css/common.css" rel="stylesheet" type="text/css">
        <link href="css/map.css" rel="stylesheet" type="text/css">
        <script src="js/publicacion.js" type="text/javascript"></script>
        <title>Ver publicación</title>
    </head>

    <body>
        {include file="Header.tpl"}
        <!-- PUBLICACION -->
        <div class="publicacion border shadow">
            <div class="banner {if $pub.tipo == 'E'}found{else}lost{/if} large">{$pub.titulo}</div>
            <div class="margin20">
                <div id="photos">
                    <div>
                        <img src="./img/publicacion/dog1.jpg" alt="dog1">
                    </div>
                    <div>
                        <img src="./img/publicacion/dog2.jpeg" alt="dog2">
                    </div>
                    <div>
                        <img src="./img/publicacion/dog3.jpeg" alt="dog3">
                    </div>
                    <div>
                        <img src="./img/publicacion/dog4.jpeg" alt="dog4">
                    </div>
                    <div>
                        <img src="./img/publicacion/dog5.jpg" alt="dog5">
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div id="data">
                <div>
                    <h2>Información:</h2>          
                    <p><span>Especie: </span> {$pub.especie}</p>
                    <p><span>Raza: </span>{$pub.raza}</p>
                    <p><span>Rerportado por: </span>{$pub.nombre} ({$pub.email})</p>
                    <p><span>Zona: </span>{$pub.barrio}</p>
                    <p><span>Estado de la publicación: </span>{$pub.estado}</p>
                </div>
            </div>
            <br>
            <br>
            <div id="map">
            </div>
            <br>
            <br>
            <div id="questions">
                <h2>Preguntas y Respuestas:</h2>
                {foreach $qa as $p}
                    {if isset($p) && count($p) > 0}
                        <div preguntaid = "{$p.id}">
                            <div class="pregunta"><p>{$p.pregunta}</p></div>
                                    {if isset($p.respuesta)}
                                <div class="respuesta"><p>{$p.respuesta}</p></div>
                                    {else}
                                <div class="respuesta vacia"><p></p></div>
                                        {if !isset($usuario)}
                                    <div class="iniciarsesion">
                                        <a href="./login.html">Inicia sesión para responder</a>
                                    </div>
                                {else}
                                    <div class="controlRespuesta">
                                        <input type='text' id="textoRespuesta">
                                        <br>
                                        <button>Responder</button>
                                    </div>
                                {/if}
                            {/if}
                        </div>
                    {else}
                        No hay preguntas hechas.
                    {/if}
                {foreachelse}
                    No hay preguntas hechas.
                {/foreach}
            </div>            

        </div>
        <br>
        <br>
        <div id="pdfExport">
            <input id="cerrarPublicacion" class="red" type="button" value="Cerrar Publicación">
            <input id="exportarPDF" class="red" type="button" value="Exportar a PDF">
        </div>
    </div>
    <div id="cerrarPubPopUp" class="popup card border">
        <div class="banner found">
            <span>Querés cerrar esta publicación?</span>
        </div>
        <div class="controls">
            <input id="btnCerrar" class="red" type="button" value="Si">
            <input id="btnNoCerrar" class="red" type="button" value="No">
        </div>
    </div>

    <script type="text/javascript" src="./js/slick/slick.min.js"></script>
    <script src="./js/carousel.js" type="text/javascript"></script>
    <link href="./js/slick/slick.css" rel="stylesheet" type="text/css">
    <link href="./js/slick/slick-theme.css" rel="stylesheet" type="text/css">
    <script src="./js/publicacion.js" type="text/javascript"></script>
    <script>
        function initMap() {
            const uluru = {
                lat: {$pub.latitud},
                lng: {$pub.longitud}
            };

            const map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: uluru,
                fullscreenControl: false
            });
            const marker = new google.maps.Marker({
                position: uluru,
                map: map
            });
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAO1UoJKW5sKBIh1J-3uD7-4LHNVxiLx8w&callback=initMap">
    </script>

</body>

</html>