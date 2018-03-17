<?php

require_once 'config.php';
require_once 'datos.php';

$user = getSessionUser();
$userId = $user["id"];
$sql = "SELECT id, tipo, titulo, descripcion FROM publicaciones WHERE usuario_id = :user";
$param = [["user", $userId, "int"]];

$con = getConexion();
$con->consulta($sql,$param);
echo json_encode($con->restantesRegistros());

