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


    <title>Ver publicación</title>
</head>

<body>
    {include file="Header.tpl"}
    <!-- PUBLICACION -->
    <div class="publicacion border">
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
            <h2>Información:</h2>          
            <p><span>Especie: {$pub.especie}</span></p>
            <p><span>Raza: {$pub.raza}</span></p>
            <p>
                <span>Rerportado por: {$pub.nombre} </span>
                <span>E-mail: {$pub.email} </span>
            </p>
            <p>
                <span>Zona: {$pub.barrio}</span>
            </p>
            <p><span>Estado de la publicación: {$pub.estado}</span></p>
        </div>
        <br>
        <br>
        <div id="map">
        </div>
        <br>
        <br>
        <div id="questions">
            <h2>Preguntas y Respuestas:</h2>
            <div class="pregunta">
                <p>Esta es mi preguntaEsta es mi preguntaEsta es mi pregunta Esta es mi preguntaEsta es mi preguntaEsta es mi
                    pregunta Esta es mi preguntaEsta es mi pregunta?
                </p>

            </div>
            <div class="respuesta">
                <p>Esta es una repsuesta Esta es una repsuestaEsta es una repsuesta Esta es una repsuesta Esta es una repsuesta
                    Esta es una repsuesta Esta es una repsuestaEsta es una repsuesta Esta es una repsuesta
                </p>
            </div>
            <div class="pregunta">
                <p>Esta es mi preguntaEsta es mi preguntaEsta es mi pregunta Esta es mi preguntaEsta es mi preguntaEsta es mi
                    pregunta Esta es mi preguntaEsta es mi pregunta?
                </p>

            </div>
            <div class="iniciarsesion">
                <a href="./login.html">Inicia sesión para responder</a>
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