<?php

require_once 'config.php';
require_once ("datos.php");

if (is_null(getSessionUser())) {
    header("location:index.php");
    die();
}
$mensaje="";
if (isset($_POST["newPub"])) {
    $dir = "imgs/trash/";
    
    if(!is_dir($dir)){
        mkdir($dir, 0777);
    }
    
    $files = $_FILES["pic"];
    for ($i = 0; $i < count($files["name"]); $i++){
        $name = $files["name"][$i];
        $temp_name = $files["tmp_name"][$i];
        
        if (move_uploaded_file($temp_name, $dir . $name)) {
            $mensaje .= $name." | ";
        } else {
            $mensaje .= "Error: " . $files["error"][$i];
        }
    }
} else {
    $smarty = getSmarty();
    $smarty->assign("error",$mensaje);
    $smarty->assign("barrios", getBarrios());
    $smarty->assign("especies", getEspecies());
    $smarty->display("newPublication.tpl");
}

