<?php

require_once ("config.php");
require_once ("datos.php");

$smarty = getSmarty();
$smarty->assign("nombre","perro");
$smarty->assign("barrio","barrio");
//Filtros
$smarty->assign("barrios", getBarrios());
$smarty->assign("especies", getEspecies());
$smarty->display("index.tpl");


