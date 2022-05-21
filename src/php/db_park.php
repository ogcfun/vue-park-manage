<?php
    header("Access-Control-Allow-Origin: *");

    //链接数据库
  $addr = 'localhost'; //地址
  $admin = 'admin'; //数据库用户名
  $passW = '123456'; //数据库密码
  $dbase = 'db_park'; //数据库名
  
  $link = mysqli_connect($addr,$admin,$passW,$dbase);
  if(!$link) {
	  echo "<script>alert('连接数据库失败');</script>";
	  die();
  }
  
  $sql = "set names utf8"; //设置utf8编码的sql命令
  mysqli_query($link,$sql);
  

?>