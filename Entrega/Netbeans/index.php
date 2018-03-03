<?php

require_once ("config.php");
$smarty = getSmarty();
$smarty->assign("nombre","perro");
$smarty->assign("barrio","barrio");
$smarty->display("index.tpl");
