<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
        <link href="./css/header.css" rel="stylesheet" type="text/css">
        <script src="./js/register.js" type="text/javascript"></script>
        <script src="./js/filters.js" type="text/javascript"></script>
        <link href="./css/register.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/login.css">
        <link href="./css/header.css" rel="stylesheet" type="text/css">
        <link href="./css/filtros.css" rel="stylesheet" type="text/css">
        <link href="./css/register.css" rel="stylesheet" type="text/css">
        <link href="./css/map.css" rel="stylesheet" type="text/css">
        <link href="./css/common.css" rel="stylesheet" type="text/css">
        <link href="./css/newPublication.css" rel="stylesheet" type="text/css">
        
        <script type="text/javascript">
            console.log({$error});
            </script>
    </head>

    <body>
        {include file="Header.tpl" usuario=$usuario}
        <div id="formContainer">
            <form action="newPublication.php" method="post" enctype="multipart/form-data" id="publicar">
                <span class="banner azul large">Registro de publicación</span>
                {if !isset($usuario)}
                    <div>
                        <label id="myData">
                            <h3>Mis datos</h3>
                            <label>E-mail</label>
                            <span id="spanEMail">*</span>
                            <input type="text" name="username">
                            <br>

                            <label>Nombre completo</label>
                            <span id="spanFullName">*</span>
                            <input type="text" name="username">
                            <br>

                            <label>Contraseña</label>
                            <span id="spanPassword">*</span>
                            <input type="password" name="password">
                            <br>
                        </label>
                    </div>
                {/if}

                <div>
                    <label id="myData">
                        <h3>Datos de la mascota</h3>
                    </label>
                </div>
                 <div>
                    <label for="title" id="titulo">Titulo:</label>
                    <input type="text" name="title">
                </div>
                <div>
                    <label for="description" id="description">Descripcion:</label>
                    <input type="text" name="description">
                </div>
                <div>
                    <label>Añadir fotos</label>
                    <span id="spanPhoto">*</span>
                    <input type="file" name="pic[]" multiple accept="image/*">
                </div>
                <br>
                <div>
                    <select name="pubType" form="publicar">
                        <option value="found">Encontrada</option>
                        <option value="lost">Perdida</option>
                    </select>
                </div>

                <div>
                    <select name="especie" fron="publicar">
                        <option value="" selected>Especie</option>
                        {foreach from=$especies item=especie}
                            <option value="{$especie.id}">{$especie.nombre}</option>  
                        {/foreach}
                    </select>
                </div>

                <div>
                    <select name="race" form="publicar">
                        <option value="" selected>Raza</option>
                    </select>
                </div>
                <div>
                    <select name="neighbourhood" form="publicar">
                        <option value="" selected>Barrio</option>
                        {foreach from=$barrios item=barrio}
                            <option value="{$barrio.id}">{$barrio.nombre}</option>  
                        {/foreach}
                    </select>
                </div>
                <div id="map"></div>
                <input type="hidden" name="lat" value="" id="lat">
                <input type="hidden" name="long" value="" id="long">
                <input id="submit" class="azul" type="submit" name="newPub" value="Añadir publicación">
            </form>
        </div>
        <script>
            function initMap() {
                let marker = new google.maps.Marker({
                    position: location

                });
                const uluru = {
                    lat: -34.890357,
                    lng: -56.106040099999994
                };

                let map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 15,
                    center: uluru,
                    fullscreenControl: false
                });

                function placeMarker(location) {
                    marker.setMap(null);
                    marker = new google.maps.Marker({
                        position: location,
                        map: map
                    });

                    document.getElementById("lat").setAttribute("value", location.lat().toString())
                    document.getElementById("long").setAttribute("value", location.lng().toString())

                    google.maps.event.addListener(map, 'click', function (event) {
                        placeMarker(event.latLng);
                    });
                }

                map.addListener('click', function (evt) {
                    console.log(evt);
                    const coords = evt.latLng
                    placeMarker(coords)
                });
            }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAO1UoJKW5sKBIh1J-3uD7-4LHNVxiLx8w&callback=initMap">
        </script>
    </body>

</html>