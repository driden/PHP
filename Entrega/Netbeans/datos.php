<?php

require_once 'libs/Smarty.class.php';
require_once 'class.Conexion.BD.php';

function getConexion() {
    $cn = new ConexionBD(
            "mysql", "localhost", "mascotas", "root", "root");

    $cn->conectar();
    return $cn;
}

function getEspecies(){
    $cn = getConexion();
    $sql = "select * from especies";
    $cn->consulta($sql); //id y nombre;
    return $cn->restantesRegistros();
}

function getRazaByEspecie($idEspecie){
   $cn = getConexion();
   $sql = "select * from razas where especie_id=:id";
   $params = [["id",$idEspecie,"int"]];
   $cn->consulta($sql,$params);
   return $cn->restantesRegistros();
}

function getBarrios(){
    $cn = getConexion();
    $sql = "select * from barrios";
    $cn->consulta($sql); //id y nombre;
    return $cn->restantesRegistros();
}