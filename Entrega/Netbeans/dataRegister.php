<?php

require_once 'datos.php';

function guardarUsuarios($email, $nombre, $password) {
    $cn = getConexion();
    $cn->consulta(
            "insert into usuarios"
            . "(email, nombre, password)"
            . " values (:email, :name, :password)", array(
        array("email", $email, 'string'),
        array("name", $nombre, 'string'),
        array("password", $password, 'string')
    ));

    $email =$_POST ["email"];
    $name = $_POST ["fullName"];
    $pass = $_POST ["password"];
    guardarUsuarios($email, $name, $pass);
    echo $email, $name,$pass; 
    
}
