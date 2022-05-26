<?php 
    include_once('../api/db_park.php');

    $sql="select * from tb_userlist";
	$query = mysqli_query($link,$sql);
 
	$tb_userlist = [];
    while($row = mysqli_fetch_assoc($query)){
      $tb_userlist[] = $row;
    }

    $user = ['data' => [
        'tb_userlist' => $tb_userlist
    ],
    'code' => 200,
    'msg' => 'user',
    ];


    echo(json_encode($user));

