<?php 
include_once('./db_park.php');

if(isset($_POST['setclass'])){
    $setclass = $_POST['setclass'];

    $class_id = $setclass['id'];
    $value = $setclass['value'];
    $price = $setclass['price'];
    $h_price = $setclass['h_price'];
    $s_time = $setclass['s_time'];
    $d_time = $setclass['d_time'];


    if(empty($value)){
        $arr = ["code" => -14,"msg" => "门票类型不能为空"];
        echo(json_encode($arr));
        die();
    }

    if(empty($price)){
        $arr = ["code" => -14,"msg" => "门票价格不能为空"];
        echo(json_encode($arr));
        die();
    }

    $sql = "update tb_class_ticket set value='$value',price='$price',h_price='$h_price',s_time='$s_time',d_time='$d_time'  where id='$class_id'";
    
    $result = mysqli_query($link,$sql);
    $nums = mysqli_affected_rows($link);
    if($nums > 0) {
        $arr = ["code" => 1400,"msg" => "修改门票信息成功"];
        echo(json_encode($arr));
    }else{
        $arr = ["code" => -14,"msg" => "修改门票信息失败"];
        echo(json_encode($arr));
    }
}else{
    exit();
}
?>