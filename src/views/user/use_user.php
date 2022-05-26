<?php 
include_once('../../api/db_park.php');

$res = json_decode(file_get_contents('php://input'),true);
// $res = $_POST['id'];
// print_r($res);

$id = $res['id'];

echo $id;



?>