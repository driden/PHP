<?php

require_once 'config.php';
require_once 'datos.php';

if (getSessionUser() == $null){
    header("location:index.php");
    die();
}

$smarty = getSmarty();

$con = getConexion();
$sql =
        '    SELECT 
e.nombre,
especie_id, 
    COUNT(*) as total, 
    SUM(
        CASE p.abierto 
        WHEN 1 THEN 1 
        WHEN 0 THEN 0
        END
        ) AS abiertos,
    SUM(
        CASE p.abierto 
        WHEN 1 THEN 0
        WHEN 0 THEN 1
        END
        ) AS cerrados,
    SUM(
        CASE p.exitoso
        WHEN 1 THEN CASE abierto WHEN 0 THEN 1 ELSE 0 END
        WHEN 0 THEN 0
        WHEN NULL THEN 0
        END
    ) AS positivos
    FROM publicaciones p
INNER JOIN especies e
ON e.id = p.especie_id
    WHERE especie_id IN (SELECT id FROM especies)
    GROUP BY especie_id';

$con->consulta($sql);
$retorno = $con->restantesRegistros();
$con->desconectar();

$smarty->assign('datos', $retorno);
$smarty->display("estadisticas.tpl");