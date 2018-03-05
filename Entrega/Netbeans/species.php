<?php

require_once 'datos.php';

$specieId = 0;

if (isset($_GET['specie'])) {
    $specieId = $_GET['specie'];
    
   echo json_encode(getRazaByEspecie($specieId));
}