<?php 
include_once('./db_park.php');

$save_name = '';
if($_FILES['file']['error']== 0) {
    $old_name = $_FILES['file']['name'];  //获取文件名称
    $n = strrpos($old_name,'.');  //获取图片文件名称的最后一个.
    $ext = substr($old_name,$n+1); //获取文件名称的最后一个.后的文件后缀

    $file_type = ['jpg','png','webp','svg','gif','jpeg','bmp'];  //图片类型
    if(!in_array(strtolower($ext),$file_type)) {  //判断图片类型是否正确
        die();
    }

    if($_FILES['file']['size']>2*1024*1024) {  //设置图片上传大小
        die();
    }

    $tmp_name = $_FILES['file']['tmp_name']; //拿到图片
    $file_name = time().rand(1000,9999).'.'.$ext;
    $save_name = 'images/'.$file_name;  //临时图片存入地址
    move_uploaded_file($tmp_name,$save_name);  //实现图片存入文件夹
    
    $arr = ["imageurl"=>$save_name];
    echo(json_encode($arr));
}
?> 