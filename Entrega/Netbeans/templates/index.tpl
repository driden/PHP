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
    <link href="css/cards.css" rel="stylesheet" type="text/css">
    <link href="css/landing.css" rel="stylesheet" type="text/css">
    <link href="css/header.css" rel="stylesheet" type="text/css">
    <link href="css/paging.css" rel="stylesheet" type="text/css">
    <link href="css/filtros.css" rel="stylesheet" type="text/css">
    <link href="css/common.css" rel="stylesheet" type="text/css">
    <script src="js/filters.js" type="text/javascript"></script>
    <script src="js/cards.js" type="text/javascript"></script>
    <title>Mascotas sin hogar</title>

</head>
<body>
    {include file="Header.tpl"}
    {include file="searchFilters.tpl" barrios=$barrios especies=$especies}
    {include file="results.tpl"}
    <script src="./js/scrollFilters.js"></script>
    <script src="./js/description.js"></script>
</body>

</html>