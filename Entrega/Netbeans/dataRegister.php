<?php

require_once 'datos.php';

$email = $_POST ["email"];

$userExists = "select * from usuarios where email = :mail";
$cnValidate = getConexion();

$cnValidate->consulta($userExists, [["mail", $email, 'string']]);
$result = $cnValidate->restantesRegistros();
echo $cnValidate->ultimoError();
$cnValidate->desconectar();

if (count($result) == 0) {


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
    

    if ($cn->ultimoIdInsert() > 0) {
        header('location: index.php');
    } else {
        echo $cn->ultimoError();
    }
} else {
    echo 'Usuario ya registrado!';
}

//To-do: guardar sesion
//getSessionUser();


