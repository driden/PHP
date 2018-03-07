<?php

require_once 'datos.php';
$email = $_POST ["email"];
$name = $_POST ["fullName"];
$password = $_POST ["password"];
$cn = getConexion();
$cn->consulta(
        "insert into usuarios"
        . "(email, nombre, password)"
        . " values (:email, :name, :password)", array(
    array("email", $email, 'string'),
    array("name", $name, 'string'),
    array("password", $password, 'string')
));

//To-do: guardar sesion
if($cn->ultimoIdInsert() > 0) {
    header('location: index.php');
} else {
    echo $cn->ultimoError();
}
