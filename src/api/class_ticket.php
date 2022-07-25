<?php 
include_once('./db_park.php');


$sql="select * from tb_class_ticket";
$query = mysqli_query($link,$sql);

$tb_class_ticket = [];
  while($row = mysqli_fetch_assoc($query)){
    $tb_class_ticket[] = $row;
  }

  $class = [
    'tb_class_ticket' => $tb_class_ticket,
    'code' => 1200,
    'msg' => 'class'
  ];
  echo(json_encode($class));
?>