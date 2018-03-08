<?php

require_once 'datosPublicaciones.php';


$page = strlen($_GET["page"]) > 0 ? $_GET["page"] : 1;
echo json_encode(getPublicationsForPage($page));


