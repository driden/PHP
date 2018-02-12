<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            <?php
            require_once 'datos.php';
            echo("Ventas en php");
            ?>
        </title>
        <link rel="stylesheet" type="text/css" href="css/ventas.css">
    </head>
    <body>

        <div id="encabezado">
            <img src="img/logo.png"/>
            <h1>Tu tienda on line</h1>
            <h2>El mejor sitio de compras en la web</h2>
        </div>

        <div id="menu">
            <ul>
                <li><a href="">Pagina Principal</a></li>
                
                <?php 
                    $usuario = usuarioLogueado();
                    if($usuario == null) {
                        echo('<li><a href="login.php">Iniciar Sesión</a></li>');
                    } else {
                        echo('<li>Hola ' . $usuario['nombre'] . 
                                '<a href="doLogout.php">Salir</a></li>');
                    }
                ?>
                <li><a href="">Contacto</a></li>
            </ul>
        </div>

        <div id="buscador">
            <label>Ingresa tu busqueda: </label> <input type="text" />
            <input type="button" value="Buscar"/>
        </div>

        <div id="categorias">
            <h2>Categorias</h2>
            <ul>
                <?php
                
                foreach (obtenerCategorias() as $cat) {
                    echo('<li><a href="index.php?cat=' . $cat['id'] . '">' . $cat["nombre"] . '</a></li>');
                }
                ?>
            </ul>
        </div>

        <div id="productos">
            <?php
            
            $catId = 1;
            
            if(isset($_GET['cat'])) {
                $catId = $_GET['cat'];
            }
            
            $productos = obtenerProductos($catId);
            
            foreach ($productos as $prod) {
                echo('<div class="producto">');
                echo('<img src="img/' . $prod["imagen"] . '" />');
                echo('<span class="nombre-producto">' . $prod['nombre'] . '</span>');
                echo('<p>' . $prod['descripcion'] . '</p>');
                echo('<span class="precio-producto">U$S ' . $prod['precio'] . ' </span>');
                echo('</div>');
            }
            ?>

        </div>
    </body>
</html>
