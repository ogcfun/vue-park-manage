<?php 
include_once('../api/db_park.php');

if(isset($_POST['addparams'])){

$addparams = $_POST['addparams'];

$user_name = $addparams['user_name'];
$user_account = $addparams['user_account'];
$save_name = $addparams['image'];
$user_password = $addparams['user_password'];
$state = $addparams['state'];
$permissions =$addparams['permissions'];
$email = $addparams['email'];
$addr = $addparams['addr'];
$add_time = date('Y-m-d H:i:s',time());

if(empty($user_name) || strlen($user_name) < 2 || strlen($user_name) > 18) {
    $arr = ["code" => -2,"msg" => "用户名称输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^[\x{4e00}-\x{9fa5}]{2,18}+$/u",$user_name)) {
    $arr = ["code" => -2,"msg" => "用户名称只能是中文"];
    echo(json_encode($arr));
    die();
}
if(empty($user_account) || strlen($user_account) < 6 || strlen($user_account) > 12) {
    $arr = ["code" => -2,"msg" => "用户账号输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^\w{6,12}$/",$user_account)) {
    $arr = ["code" => -2,"msg" => "用户账号只能是数字、26个英文字母或者下划线"];
    echo(json_encode($arr));
    die();
}
if(empty($user_password) || strlen($user_password) < 6 || strlen($user_password) > 18) {
    $arr = ["code" => -2,"msg" => "用户密码输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^\w{6,18}$/",$user_password)) {
    $arr = ["code" => -2,"msg" => "用户密码只能是数字、26个英文字母或者下划线"];
    echo(json_encode($arr));
    die();
}
if(empty($email) || filter_var($email, FILTER_VALIDATE_EMAIL) == false) {
    $arr = ["code" => -2,"msg" => "用户邮箱输入有误"];
    echo(json_encode($arr));
    die();
}
if(empty($addr || strlen($addr) < 18 || strlen($addr) > 50)) {
    $arr = ["code" => -2,"msg" => "地址输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^[\x{4e00}-\x{9fa5}]+$/u",$addr)) {
    $arr = ["code" => -2,"msg" => "地址只能是中文"];
    echo(json_encode($arr));
    die();
}

$sql = "insert into 
	`tb_userlist`(`user_name`,`user_account`,`image`,`user_password`,`email`,`addr`,`user_time`,`permissions`,`state`) 
	values('$user_name','$user_account','$save_name','$user_password','$email','$addr','$add_time','$permissions','$state')";

$result = mysqli_query($link,$sql);
$nums = mysqli_affected_rows($link);
    if($nums) {
        $arr = ["code" => 200,"msg" => "新增用户成功"];
        echo(json_encode($arr));
    }else{
        $arr = ["code" => -2,"msg" => "新增用户失败"];
        echo(json_encode($arr));
    }
}else{
    exit();
}

?>