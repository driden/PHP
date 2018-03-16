<?php

if (getSessionUser() == $null){
    header("location:index.php");
    die();
}
