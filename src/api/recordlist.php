<?php 
include_once('./db_park.php');

 // 获取
 $sql="select * from tb_record order by send_time desc";
 $query = mysqli_query($link,$sql);

 $tb_record = [];
 while($row = mysqli_fetch_assoc($query)){
   $tb_record[] = $row;
 }

 $data = ['record' => [
     'code' => 3300,
     'msg'=> '成功',
     'tb_record'=> $tb_record
 ],
 ];

 
 echo(json_encode($data));