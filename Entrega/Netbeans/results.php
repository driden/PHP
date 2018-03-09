<?php

require_once 'datosPublicaciones.php';

$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$estado = isset($_GET["estado"]) ? $_GET["estado"] : '';
$especieId = isset($_GET["especieId"]) ? $_GET["especieId"] : '';
$razaId = isset($_GET["razaId"]) ? $_GET["razaId"] : '';
$barrioId = isset($_GET["barrioId"]) ? $_GET["barrioId"] : '';

echo json_encode(
        getPublicationsForPage($page, $estado, $especieId, $razaId, $barrioId)
    );
