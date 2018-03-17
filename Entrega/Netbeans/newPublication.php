<?php

require_once 'config.php';
require_once ("datos.php");

if (is_null(getSessionUser())) {
    header("location:index.php");
    die();
}
$mensaje = "";
if (isset($_POST["newPub"])) {

    $titulo = $_POST["title"];
    $descripcion = $_POST["description"];
    $tipo = $_POST["pubType"];
    if ($tipo === "found"){
        $tipo = 'E';
    }else{
        $tipo = 'P';
    }
    $especie = $_POST["especie"];
    $raza = $_POST["race"];
    $barrio = $_POST["neighbourhood"];
    $lat = $_POST["lat"];
    $long = $_POST["long"];
    $userId = getSessionUser()["id"];

    $sqlInsert = "INSERT INTO `publicaciones`"
            . "(`titulo`, `descripcion`, `tipo`, `especie_id`, `raza_id`, `barrio_id`, `abierto`, `usuario_id`, `latitud`, `longitud`) "
            . "VALUES (:titulo,:desc,:tipo,:especie,:raza,:barrio,0,:user_id,:lat,:long)";

    $params = [
        ["titulo", $titulo, "string"],
        ["desc", $descripcion, "string"],
        ["tipo", $tipo, "string"],
        ["especie", $especie, "int"],
        ["raza", $raza, "int"],
        ["barrio", $barrio, "int"],
        ["user_id", $userId, "int"],
        ["lat", $lat, "int"],
        ["long", $long, "int"]
    ];

    $con = getConexion();
    $con->consulta($sqlInsert, $params);
    $pubId = $con->ultimoIdInsert();

    // ya tengo el Id, puedo guardar las fotos
    guardarFotos($pubId);
    
    header('location:publicacion.php?pubId='.$pubId);
}

$smarty = getSmarty();
$smarty->assign("error", $mensaje);
$smarty->assign("barrios", getBarrios());
$smarty->assign("especies", getEspecies());
$smarty->display("newPublication.tpl");

function guardarFotos($pubId) {
    $dir = "imgs/{$pubId}/";

    if (!is_dir($dir)) {
        mkdir($dir, 0777);
    }

    $files = $_FILES["pic"];
    for ($i = 0; $i < count($files["name"]); $i++) {
        $name = $files["name"][$i];
        $temp_name = $files["tmp_name"][$i];

        if (move_uploaded_file($temp_name, $dir . $name)) {
            $mensaje .= $name . " | ";
        } else {
            $mensaje .= "Error: " . $files["error"][$i];
        }
    }
}
