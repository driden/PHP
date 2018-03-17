<?php

require_once 'config.php';
require_once 'datos.php';

if (isset($_POST["responder"])) {
    $pregId = $_POST["responder"];
    $respuesta = $_POST["texto"];

    guardarRespuesta($pregId, $respuesta);
} elseif (isset($_POST["preguntar"])) {
    $pregunta = $_POST["preguntar"];
    $pubId = $_POST["pubId"];

    guardarPregunta($pubId, $pregunta);
    
}elseif (isset($_POST["cerrar"])) {
    //cerrar la publicacion
    $pubId = $_POST["pubId"];
    $exitoso = $_POST["exitoso"];
    
    $sqlCerrar = "UPDATE publicaciones SET abierto=0, exitoso= :exitoso WHERE id = :id";
    $paramCerrar = [
        ["exitoso", $exitoso,"int"],
        ["id", $pubId, "int"]
    ];
    
    $c = getConexion();
    $c->consulta($sqlCerrar,$paramCerrar);
   
    header("location:index.php");
} 
elseif (isset($_GET["pubId"])) {
    $smarty = getSmarty();
    $pubId = $_GET["pubId"];

    $pub = getDatosPublicacion($pubId);
    $smarty->assign('pub', $pub);

    $preguntas = getPreguntasYRespuestas($pubId);
    $smarty->assign('qa', $preguntas);

    $fotos = getFotos($pubId);
    $smarty->assign("fotos",$fotos);
    $smarty->display("publicacion.tpl");
} else {
    header("location:index.php");
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

function guardarPregunta($pubId, $pregunta) {

    $userId = getSessionUser()["id"];
    $sql = "INSERT INTO preguntas(`id_publicacion`,`texto`,`usuario_id`) VALUES (:pubId, :pregunta, :userId)";

    $params = [
        ["pubId", $pubId, "int"],
        ["pregunta", $pregunta, "string"],
        ["userId", $userId, "int"]
    ];

    $con = getConexion();
    $con->consulta($sql, $params);
    $con->desconectar();
}

function getPreguntasYRespuestas($pubId) {
    $sql = 'SELECT
id,
p.texto as pregunta,
respuesta,
usuario_id as idUsuario
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

function getFotos($pubId) {
    $fotos = [];
    $dir = "imgs/{$pubId}/";
    
    if(!is_dir($dir)) return $fotos;
    
    if ($handle = opendir($dir)) {
        while (false !== ($entry = readdir($handle))) {
            if ($entry != "." && $entry != "..") {
                $fotos[] = $dir . $entry;
            }
        }
        closedir($handle);
    }
    
    return $fotos;
}
