<?php

require_once 'datos.php';

function getCantidadPublicacionesAbiertas($foundOrLost, $specie, $race, $neighborhood) {
    $sqlFoundOurLost = strlen($foundOrLost) > 0 ? 'AND tipo = ' . $foundOrLost : '';
    $sqlSpecie = strlen($specie) > 0 ? 'AND especie_id = ' . $specie : '';
    $sqlRace = strlen($race) > 0 ? 'AND raza_id = ' . $race : '';
    $sqlNeighborhood = strlen($neighborhood) > 0 ? 'AND barrio_id = ' . $neighborhood : '';

    $con = getConexion();
    $sql = "SELECT COUNT(*) as total FROM publicaciones WHERE abierto = 1"
            . $sqlFoundOurLost
            . $sqlSpecie
            . $sqlRace
            . $sqlNeighborhood
    ;
    
    $con->consulta($sql);
    $ret = $con->siguienteRegistro();
    $con->desconectar();
    return $ret;
}

function getPublicationsForPage($page, $foundOrLost, $specie, $race, $neighborhood) {
    $sqlFoundOurLost = strlen($foundOrLost) > 0 ? 'AND tipo = ' . $foundOrLost : '';
    $sqlSpecie = strlen($specie) > 0 ? 'AND especie_id = ' . $specie : '';
    $sqlRace = strlen($race) > 0 ? 'AND raza_id = ' . $race : '';
    $sqlNeighborhood = strlen($neighborhood) > 0 ? 'AND barrio_id = ' . $neighborhood : '';

    $limit = 10;    

    $offset = ($page - 1) * $limit;
    
    $sql = 'SELECT * FROM publicaciones
        WHERE abierto = 1 '
            . $sqlFoundOurLost
            . $sqlSpecie
            . $sqlRace
            . $sqlNeighborhood
            . 'LIMIT :limit OFFSET :offset';
    
    $params = [["limit", $limit, "int"], ["offset", $offset, "int"]];
    $con = getConexion();
    $con->consulta($sql, $params);

    return $con->restantesRegistros();
}
