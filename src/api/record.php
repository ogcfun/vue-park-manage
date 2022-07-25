<?php 
include_once('./db_park.php');

if(isset($_POST['record'])){
    $record = $_POST['record'];

    $message = $record['message'];
    $permissions = $record['permissions'];
    $userName = $record['userName'];
    $userimage = $record['userimage'];
    $send_time = date('Y-m-d H:i:s',time());

    $sql = "insert into 
	`tb_record`(`user_img`,`user_level`,`user_message`,`send_time`,`user_name`) 
	values('$userimage','$permissions','$message','$send_time','$userName')";

    $result = mysqli_query($link,$sql);
    $nums = mysqli_affected_rows($link);
    if($nums > 0) {
        $arr = ['send' => [
            "code" => 3200,
            "msg" => "发送成功"
            ]
        ];
        echo(json_encode($arr));
    }else{
        $arr = ['send' => [
            "code" => -32,
            "msg" => "发送失败"
            ]
        ];
        echo(json_encode($arr));
    }
}else{
    exit();
}
