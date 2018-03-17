<?php

require_once("libs/Smarty.class.php");

function getSessionUser() {
    session_start();
    if (isset($_SESSION['usuario'])) {
        return $_SESSION['usuario'];
    }

    return null;
}

function setSessionUser($user) {
    session_start();
    $_SESSION['usuario'] = $user;

    return $user;
}

function getSmarty() {

//    //logueo a ana
//    if (is_null(getSessionUser())) {
//        $email = "agonzalez@otro.com";
//        $sql = "SELECT * FROM usuarios WHERE email=:mail";
//        $con = getConexion();
//
//        $con->consulta($sql, [["mail", $email, "string"]]);
//        $res = $con->restantesRegistros();
//        $res = $res[0];
//
//        setSessionUser($res);
//    }

    $miSmarty = new Smarty();
    $miSmarty->template_dir = "templates";
    $miSmarty->compile_dir = "templates_c";
    $miSmarty->cache_dir = "cache";
    $miSmarty->config_dir = "config";
    $miSmarty->assign("usuario", getSessionUser());
    return $miSmarty;
}
