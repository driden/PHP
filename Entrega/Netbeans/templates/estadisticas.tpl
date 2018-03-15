<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
        <title>Estadísticas</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="./js/estadisticas.js"></script>
        <link href="./css/cards.css" rel="stylesheet" type="text/css">
        <link href="./css/header.css" rel="stylesheet" type="text/css">
        <link href="./css/publicacion.css" rel="stylesheet" type="text/css">
        <link href="./css/common.css" rel="stylesheet" type="text/css">
        <link href="./css/publicaciones.css" rel="stylesheet" type="text/css">
        <link href="./css/charts.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        {include file="Header.tpl"}

        {foreach $datos as $dato}
            <div class="dato">
            <input data="nombre" type="text" disabled value="{$dato.nombre}" hidden>
            <input data="total" type="text" disabled value="{$dato.total}" hidden>
            <input data="abiertos" type="text" disabled value="{$dato.abiertos}" hidden>
            <input data="cerrados" type="text" disabled value="{$dato.cerrados}" hidden>
            <input data="positivos" type="text" disabled value="{$dato.positivos}" hidden>
            </div>
        {/foreach}
        <div class="publicacion border shadow">
            <div class="banner large azul">Estadísticas</div>
            <div>
                <div id="publicaciones">
                    <div id="chart_div"></div>
                </div>
            </div>
        </div>

    </body>

</html>