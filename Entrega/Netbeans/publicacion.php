<?php

require_once 'config.php';
require_once 'datos.php';

$smarty = getSmarty();
if (isset($_GET["pubId"])) {
    $pubId = $_GET["pubId"];
    $sql = 'SELECT
p.id,
p.titulo,
CASE p.exitoso
WHEN NULL THEN "No cerrado"
WHEN 0 THEN "Sin exito"
WHEN 1 THEN "Exitoso"
END as estado,
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
    $smarty->assign('pub', $pub);
    $smarty->display("publicacion.tpl");
} else {
    header("location:index.php");
}