<?php

require_once 'datos.php';

$usuario = $_POST['usuario'];
$clave = $_POST['clave'];

$logueado = login($usuario, $clave);

if($logueado != null) {
    header('location:index.php');
} else {
    header('location:login.php?err=1');
}

