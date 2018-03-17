<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
    <link href="./css/cards.css" rel="stylesheet" type="text/css">
    <link href="./css/header.css" rel="stylesheet" type="text/css">
    <link href="./css/publicacion.css" rel="stylesheet" type="text/css">
    <link href="./css/common.css" rel="stylesheet" type="text/css">
    <link href="./css/publicaciones.css" rel="stylesheet" type="text/css">
    <script src="./js/cards.js"></script>
    <script src="./js/misPublicaciones.js"></script>
    <title>Mis publicaciones abiertas</title>
</head>

<body>
    {include file="Header.tpl" usuario=$usuario}
    <div class="publicacion border">
        <div class="banner large azul">Mis publicaciones abiertas</div>
        <div>
            <div id="cards"></div>
        </div>
    </div>
    <script src="./js/description.js"></script>
</body>

</html>