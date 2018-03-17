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
                    {foreach  $fotos as $foto }
                        <div>
                            <img src="{$foto}" alt="{$foto}">
                        </div>
                    {foreachelse}
                        <h2>No hay fotos </h2>
                    {/foreach}
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
                {*Por cada pregunta hecha $p*}
                {foreach $qa as $p}
                    {*  {if isset($p) && count($p) > 0} *}
                    <div preguntaid = "{$p.id}">
                        <div class="pregunta"><p>{$p.pregunta}</p></div>
                                {if isset($p.respuesta)}
                            <div class="respuesta"><p>{$p.respuesta}</p></div>
                                {else}                            
                                    {*si la pregunta no tiene respuesta todavia, 
                                    se crea un contenedor para la respuesta*}
                            <div class="respuesta vacia"><p></p></div>
                                    {if not isset($usuario)}
                                <div class="iniciarsesion">
                                    <a href="./login.php">Inicia sesión para responder</a>
                                </div>
                            {elseif $usuario.id eq $pub.idUsuario}
                                {*si hay una respuesta vacia y el usuario que creo la publicacion
                                es el que esta loguead, entonces puede responder*}
                                <div class="controlRespuesta">
                                    <input type='text' id="textoRespuesta">
                                    <br>
                                    <button>Responder</button>
                                </div>

                            {/if}
                        {/if}
                    </div>
                    {*NO HAY PREGUNTAS HECHAS EN ESTE PUNTO, pero se pueden hacer nuevas :)*}
                {foreachelse}
                    <span class="no-preguntas">No hay preguntas hechas.</span>

                {/foreach}
                {if isset($usuario) and ($usuario.id neq $pub.idUsuario)}
                    <div class="controlPregunta">
                        <input type='text' id="textoPregunta">
                        <br>
                        <button>Nueva Pregunta</button>
                    </div>
                {/if}
            </div>
        </div>
        <br>
        <br>
        <div id="pdfExport">
            {if isset($usuario) and ($usuario.id eq $pub.idUsuario)}
                <input id="cerrarPublicacion" class="red" type="button" value="Cerrar Publicación">
            {/if}
            <input id="exportarPDF" class="red" type="button" value="Exportar a PDF">
        </div>
    </div>
    <div id="cerrarPubPopUp" class="popup card border">
        <div class="banner {if $pub.tipo == 'E'}found{else}lost{/if}">
            <span>Querés cerrar esta publicación?</span>
        </div>
        <div class="controls">
            <form action="publicacion.php" method="post" id="cerrarPub">
                <select name="exitoso" form="cerrarPub">
                    <option value="1">Exitoso</option>
                    <option value="0">Sin Éxito </option>
                </select>
                <br>
                <input id="btnCerrar" class="red" type="submit" value="Si" name="cerrar">
                <input id="btnNoCerrar" class="red" type="button" value="No">
                <input type="hidden" value="{$pub.id}" name="pubId">
            </form>
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