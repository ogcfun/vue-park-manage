<?php 
include_once('./db_park.php');

if(isset($_GET['sign_id'])){

    $id = $_GET['sign_id'];

    $sql = "update tb_addsign set sign_pace='未通过' where sign_id=$id";

    
$result = mysqli_query($link,$sql);
$nums = mysqli_affected_rows($link);
if($nums > 0) {
    $arr = ["code" => 3000,"msg" => "已拒绝该用户成为管理员"];
    echo(json_encode($arr));
    die();
}else{
    $arr = ["code" => -30,"msg" => "操作失败"];
    echo(json_encode($arr));
    die();
}
}else {
    exit();
}
?>