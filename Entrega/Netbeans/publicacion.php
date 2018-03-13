<?php

require_once 'config.php';
require_once 'datos.php';

if (isset($_POST["responder"])) {
    $pregId = $_POST["responder"];
    $respuesta = $_POST["texto"];

    guardarRespuesta($pregId, $respuesta);
} else {
    if (isset($_GET["pubId"])) {
        $smarty = getSmarty();
        $pubId = $_GET["pubId"];

        $pub = getDatosPublicacion($pubId);
        $smarty->assign('pub', $pub);

        $preguntas = getPreguntasYRespuestas($pubId);
        $smarty->assign('qa', $preguntas);

        $smarty->display("publicacion.tpl");
    } else {
        header("location:index.php");
    }
}

function guardarRespuesta($id, $respuesta) {
    $sql = 'UPDATE preguntas '
            . 'SET respuesta = :respuesta'
            . ' WHERE id=:id';

    $params = [["respuesta", $respuesta, "string"],
        ["id", intval($id), "int"]];

    $con = getConexion();
    $con->consulta($sql, $params);
    $con->desconectar();
    return $filas;
}

function getPreguntasYRespuestas($pubId) {
    $sql = 'SELECT
id,
p.texto as pregunta,
respuesta
from preguntas p
WHERE id_publicacion = :pid';
    $param = [["pid", $pubId, "int"]];
    $con = getConexion();
    $con->consulta($sql, $param);
    $res = $con->restantesRegistros();
    $con->desconectar();
    return $res;
}

function getDatosPublicacion($pubId) {
    $sql = 'SELECT
p.id,
p.titulo,
(
    CASE p.exitoso
    WHEN 0 THEN  "Sin exito"
    WHEN 1 THEN  "Exitoso"
    ELSE "No cerrado"
    END
) as estado,
p.tipo,
e.nombre as especie,
r.nombre as raza,
b.nombre as barrio,
CASE p.abierto
WHEN 1 THEN "Abierto"
WHEN 0 THEN "Cerrado"
END as abierto,
u.nombre,
u.email,
u.id as idUsuario,
p.latitud,
p.longitud

FROM `publicaciones` p
INNER JOIN `razas` r
ON p.raza_id = r.id
INNER JOIN `barrios` b
ON b.id = barrio_id
INNER JOIN `especies` e
ON e.id = p.especie_id
INNER JOIN `usuarios` u
ON p.usuario_id = u.id
WHERE p.id=:pid';

    $param = [["pid", $pubId, "int"]];
    $con = getConexion();
    $con->consulta($sql, $param);
    $pub = $con->restantesRegistros();
    $pub = $pub[0];
    $con->desconectar();
    return $pub;
}
