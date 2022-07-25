<?php 
include_once('../api/db_park.php');

if(isset($_GET['id'])){

$id = $_GET['id'];

// print_r($id);

// $sql = "select * from tb_userlist where id='$id'";
// $query = mysqli_query($link,$sql);
// $nums = mysqli_fetch_assoc($query);

// if(empty($nums)){
//     $arr = ["code" => -3,"msg" => "该用户不存在"];
//     echo(json_encode($arr));
//     die();
// }

$sql = "delete from tb_userlist where id='$id'";

$result = mysqli_query($link,$sql);
$nums = mysqli_affected_rows($link);
if($nums > 0) {
    $arr = ["code" => 300,"msg" => "已删除该用户"];
    echo(json_encode($arr));
    die();
}else{
    $arr = ["code" => -3,"msg" => "删除该用户失败"];
    echo(json_encode($arr));
    die();
}

}else{
    exit();
}
    
?>