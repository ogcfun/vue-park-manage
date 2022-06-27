<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    header('Access-Control-Allow-Methods: GET, POST, PUT,DELETE');

    //链接数据库
  $addr = 'localhost'; //地址
  $admin = 'park_manage'; //数据库用户名
  $passW = 'deng2001'; //数据库密码
  $dbase = 'park_manage'; //数据库名
  
  $link = mysqli_connect($addr,$admin,$passW,$dbase);
  if(!$link) {
	  echo "<script>alert('连接数据库失败');</script>";
	  die();
  }
  
  $sql = "set names utf8"; //设置utf8编码的sql命令
  mysqli_query($link,$sql);
  

?>