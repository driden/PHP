<?php

function obtenerCategorias() {
    $categorias = array(
        array("id" => 1, "nombre" => "Procesadores"),
        array("id" => 2, "nombre" => "Memorias"),
        array("id" => 3, "nombre" => "Discos")
    );
    $categorias[] = array("id" => 4, "nombre" => "Gabinetes");
    return $categorias;
}

function obtenerProductos($idCategoria) {
    $productos = array();
    if ($idCategoria == 1) {
        $productos = array(
            array("id" => 1,
                "nombre" => "Pentium III",
                "descripcion" => "Lento y viejo",
                "precio" => 10,
                "imagen" => "producto_1.png"),
            array("id" => 1,
                "nombre" => "Pentium IV",
                "descripcion" => "Lento y un poco viejo",
                "precio" => 30,
                "imagen" => "producto_2.jpg")
        );
    } else if($idCategoria==2) {
          $productos = array(
            array("id" => 3,
                "nombre" => "8 GB",
                "descripcion" => "Poca memoria",
                "precio" => 40,
                "imagen" => ""),
            array("id" => 4,
                "nombre" => "64 GB",
                "descripcion" => "Mucha memoria",
                "precio" => 60,
                "imagen" => "")
        );
    }
    return $productos;
}

function login($usuario, $clave){
    if($usuario == "demo" && $clave=="demo") {
        $usuario =  array( "nombre" => "Usuario de Prueba");
        
        // Inicia la sesion y guarda el usuario en ella
        session_start();        
        $_SESSION['usuario'] = $usuario;
        
        return $usuario;
    } else {
        return null;
    }
}

function usuarioLogueado() {
    session_start();
    if(isset($_SESSION['usuario'])) {
        return $_SESSION['usuario'];
    }
    
    return null;
}