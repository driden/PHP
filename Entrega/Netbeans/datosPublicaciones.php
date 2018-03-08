<?php

require_once 'datos.php';

function getCantidadPublicacionesAbiertas() {
    $con = getConexion();
    $sql = "SELECT COUNT(*) as total FROM publicaciones WHERE abierto = 1";
    $con->consulta($sql);
    $ret = $con->siguienteRegistro();
    $con->desconectar();
    return $ret;
}

function getPublicationsForPage($page) {
    $limit = 10;
    $total = getCantidadPublicacionesAbiertas()["total"];
    //print_r($total);
    $totalPages = ceil($total / $limit);
    $offset = ($page - 1) * $limit;
    $start = $offset + 1;
    $sql = 'SELECT * FROM publicaciones
        LIMIT :limit
        OFFSET :offset';

    $params = [["limit", $limit, "int"],["offset", $offset, "int"]];
    $con = getConexion();
    $con->consulta($sql, $params);

    return $con->restantesRegistros();
}
