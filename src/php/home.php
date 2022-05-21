<?php 
  include_once('../php/db_park.php');

  $sql="select * from tabledata";
	$query = mysqli_query($link,$sql);
 
	$tabledata = [];
    while($row = mysqli_fetch_assoc($query)){
      $tabledata[] = $row;
    }
	
  $sql="select * from countdata";
	$query = mysqli_query($link,$sql);
 
	$countdata = [];
    while($row = mysqli_fetch_assoc($query)){
      $countdata[] = $row;
    }

  $sql="select * from linechart";
	$query = mysqli_query($link,$sql);
 
	$linechart = [];
    while($row = mysqli_fetch_assoc($query)){
      $linechart[] = $row;
    }

  $sql="select * from userchart";
	$query = mysqli_query($link,$sql);
 
	$userchart = [];
    while($row = mysqli_fetch_assoc($query)){
      $userchart[] = $row;
    }

    $sql="select * from videodata";
    $query = mysqli_query($link,$sql);
   
    $videodata = [];
      while($row = mysqli_fetch_assoc($query)){
        $videodata[] = $row;
      }


	$data = ['data' => [
        'tabledata' => $tabledata,
        'countdata' => $countdata,
        'linechart' => $linechart,
        'userchart' => $userchart,
        'videodata' => $videodata
    ],
    'code' => 1,
    'msg' => 'success'
    ];
	echo(json_encode($data));

// 
