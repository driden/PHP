<?php

require_once 'config.php';
require_once 'datos.php';

if (isset($_POST["checkMail"])) {
    $email = $_POST["checkMail"];
    $sql = "SELECT * FROM usuarios WHERE email=:mail";
    $con = getConexion();
    
    $con->consulta($sql,[["mail",$email,"string"]]);
    $res =$con->restantesRegistros();
    
    echo (count($res) > 0) ? "true" : "false";
    
} else if (isset($_POST['password'])) {
    $email = $_POST["email"];
    $password = $_POST["password"];
    
    $sql = "SELECT * FROM usuarios WHERE email=:mail";
    $con = getConexion();
    
    $con->consulta($sql,[["mail",$email,"string"]]);
    $res =$con->restantesRegistros();
    $res = $res[0];
    
    if($res["password"] ===$password){
        setSessionUser($res);
        header("location:index.php");
    }else{
        header("location:index.php?loginError=badpassword");
    }
    die();
} else {
    $smarty = getSmarty();
    $smarty->display("login.tpl");
}