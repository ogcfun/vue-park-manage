<?php 
include_once('./db_park.php');

if(isset($_GET['ticket_id'])){
    $ticket_id = $_GET['ticket_id'];

    $sql = "delete from tb_ticket where ticket_id='$ticket_id'";

$result = mysqli_query($link,$sql);
$nums = mysqli_affected_rows($link);
if($nums > 0) {
    $arr = ["code" => 1000,"msg" => "已删除该条数据"];
    echo(json_encode($arr));
    die();
}else{
    $arr = ["code" => -10,"msg" => "删除该条数据失败"];
    echo(json_encode($arr));
    die();
}
}else {
    exit();
}
?>