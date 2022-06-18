<?php 
include_once('./db_park.php');

if(isset($_GET['id'])){
    $class_id = $_GET['id'];

    $sql = "delete from tb_class_ticket where id='$class_id'";

$result = mysqli_query($link,$sql);
$nums = mysqli_affected_rows($link);
if($nums > 0) {
    $arr = ["code" => 1500,"msg" => "已删除该条数据"];
    echo(json_encode($arr));
    die();
}else{
    $arr = ["code" => -15,"msg" => "删除该条数据失败"];
    echo(json_encode($arr));
    die();
}
}else {
    exit();
}
?>