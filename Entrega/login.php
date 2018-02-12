<!DOCTYPE html>

<html>
    <head>
        <title>Inicio de Sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form method="POST" action="doLogin.php">
            <p>Usuario <input type="text" name="usuario"/></p>
            <p>Clave <input type="password" name="clave"/></p>
            <?php 
                $err = FALSE;
                
                if(isset($_GET['err'])) {
                    $err = TRUE;
                }
                
                if($err) {
                    echo('<p><b>Usuario/Clave Incorrectos</b></p>');
                }
            ?>
            
            <input type="submit" value="Iniciar Sesión"/>
        </form>
    </body>
</html>
