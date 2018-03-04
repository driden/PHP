<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E="
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <link href="css/cards.css" rel="stylesheet" type="text/css">
    <link href="css/landing.css" rel="stylesheet" type="text/css">
    <link href="css/header.css" rel="stylesheet" type="text/css">
    <link href="css/paging.css" rel="stylesheet" type="text/css">
    <link href="css/filtros.css" rel="stylesheet" type="text/css">
    <link href="css/common.css" rel="stylesheet" type="text/css">

    <title>Mascotas sin hogar</title>

</head>
<body>
    {include file="Header.tpl"}
    <div id="filters">
        <div id="mainFilterTitle">
            <span class="banner large azul">Filtros de Búsqueda</span>
        </div>
        <div id="innerFiltersDiv">
            <form action="/action_page.php">
                <div>
                    <select name="pubType" form="filters">
                        <option value="" disabled selected>Tipo de publicación</option>
                        <option value="found">Encontrada</option>
                        <option value="lost">Perdida</option>
                    </select>
                </div>
                <br></br>
                <div>
                    <select name="pubType" form="filters">
                        <option value="" disabled selected>Especie</option>
                        <option value="dog">Perro</option>
                        <option value="cat">Gato</option>
                        <option value="parrot">Loro</option>
                        <option value="cow">Vaca</option>
                    </select>
                </div>
                <br></br>
                <div>
                    <select name="race" form="filters">
                        <option value="" disabled selected>Raza</option>
                        <option value="race1">Ovejero</option>
                        <option value="race2">Gato siames</option>
                        <option value="race3">Beagle</option>
                        <option value="race4">Coco</option>

                    </select>
                </div>
                <br></br>
                <div>
                    <select name="neighbourhood" form="filters">
                        <option value="" disabled selected>Barrio</option>
                        <option value="1">Carrasco Norte</option>
                        <option value="2">Malvin</option>
                        <option value="3">Pocitos</option>
                        <option value="4">Centro</option>

                    </select>
                </div>
            </form>
        </div>
    </div>
    <div id="results">
        <div id="cards">
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>
            <div class="card">
                <div class="cardBlock">
                    <span class="banner lost">Se perdió {$nombre} en {$barrio}</span>
                </div>
                <div class="cardBlock">
                    <img class="photo" src="./img/dog.jpg">
                </div>
                <div class="cardBlock">
                    <p class="description">Esto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres por
                        avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo de 150 caracteres
                        por avisoEsto es una prueba. Tenemos que l imitar el tamaño de la descripción a un máximo de 150
                        caracteres por avisoEsto es una prueba. Tenemos que limitar el tamaño de la descripción a un máximo
                        de 150 caracteres por aviso</p>
                </div>
            </div>


            <div id="paging">
                <span>5 | 10 | 15 | 20</span>
            </div>
        </div>

        <script src="./js/scrollFilters.js"></script>
        <script src="./js/description.js"></script>
</body>

</html>