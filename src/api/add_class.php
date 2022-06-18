<?php 
include_once('./db_park.php');

if(isset($_POST['addclass'])){
    $addclass = $_POST['addclass'];

    $value = $addclass['value'];
    $price = $addclass['price'];
    $h_price = $addclass['h_price'];
    $s_time = $addclass['s_time'];
    $d_time = $addclass['d_time'];

    if(empty($value)){
        $arr = ["code" => -13,"msg" => "门票类型不能为空"];
        echo(json_encode($arr));
        die();
    }

    if(empty($price)){
        $arr = ["code" => -13,"msg" => "门票价格不能为空"];
        echo(json_encode($arr));
        die();
    }

    $sql = "insert into 
	`tb_class_ticket`(`value`,`price`,`h_price`,`s_time`,`d_time`) 
	values('$value','$price','$h_price','$s_time','$d_time')";

    $result = mysqli_query($link,$sql);
    $nums = mysqli_affected_rows($link);
    if($nums > 0) {
        $arr = ["code" => 1300,"msg" => "新增门票信息成功"];
        echo(json_encode($arr));
    }else{
        $arr = ["code" => -13,"msg" => "新增门票信息失败"];
        echo(json_encode($arr));
    }
}else{
    exit();
}
?>