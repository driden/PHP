<div id="header">
    <div id="logo">
        <a href="./index.php">
            <img src="./img/logo.png" alt="Logo" id="logo">
        </a>
    </div>
    <div id="title">
        <span>Mascotas sin hogar</span>
    </div>
    <p align="right" id="nav">
        <b>
            {if isset($usuario)}
                <span>Hola {$usuario.nombre}!</span>
                |                
                <a href="./newPublication.php">Nueva publicación</a>
                |
                <a href="./misPublicaciones.php">Mis publicaciones</a>
                |
                <a href="./estadisticas.php">Estadísticas</a>
                |
                <a href="./logout.php">Log out</a>            
            {else}
                <a href="./register.php">Registro</a>
                |
                <a href="./login.php">Iniciar sesión</a>
            {/if}
        </b>    
    </p>
</div>