<?php

require_once 'config.php';

if (getSessionUser() == $null){
    header("location:index.php");
    die();
}

