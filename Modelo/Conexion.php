<?php 

require("config.php"); 
Class Conexion {
    
public static function conexcion(){    
    try{
    $pdo_conexion = new PDO('mysql:host=localhost;dbname=.USER', USER,PASS); 
    $pdo_conexion->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXEPTION);
    $pdo_conexion->exec("SET CHARACTER SET UTF8");
    }catch(Exception $e) {
        die('Error' .$e->getMessage());
        echo "Linea del error".$e->getLIne();
        echo "";
        }
        return $pdo_conexion;
    }
    
}
?>