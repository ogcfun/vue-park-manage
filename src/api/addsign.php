<?php 
include_once('./db_park.php');

if(isset($_POST['addsign'])){
    $addsign = $_POST['addsign'];

    $name = $addsign['name'];
    $username = $addsign['username'];
    $image = 'images/default.png';
    $password = $addsign['password'];
    $email = $addsign['email'];
    $addr = $addsign['addr'];
    $permissions = $addsign['permissions'];
    $state = $addsign['state'];
    $add_time = date('Y-m-d H:i:s',time());

    
$sql = "select * from tb_addsign where sign_account ='$username'";
$row = mysqli_query($link,$sql);
if( mysqli_num_rows( $row ) ){
  $arr = ["code" => -15,"msg" => "该用户账号已存在"];
  echo(json_encode($arr));
die();
}
    
if(empty($name) || strlen($name) < 2 || strlen($name) > 18) {
    $arr = ["code" => -15,"msg" => "用户昵称输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^[\x{4e00}-\x{9fa5}]{2,18}+$/u",$name)) {
    $arr = ["code" => -15,"msg" => "用户昵称只能是中文"];
    echo(json_encode($arr));
    die();
}
if(empty($username) || strlen($username) < 6 || strlen($username) > 12) {
    $arr = ["code" => -15,"msg" => "用户账号输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^\w{6,12}$/",$username)) {
    $arr = ["code" => -15,"msg" => "用户账号只能是数字、26个英文字母或者下划线"];
    echo(json_encode($arr));
    die();
}
if(empty($password) || strlen($password) < 6 || strlen($password) > 18) {
    $arr = ["code" => -15,"msg" => "用户密码输入有误"];
    echo(json_encode($arr));
    die();
}
if(!preg_match("/^\w{6,18}$/",$password)) {
    $arr = ["code" => -15,"msg" => "用户密码只能是数字、26个英文字母或者下划线"];
    echo(json_encode($arr));
    die();
}
if(empty($email) || filter_var($email, FILTER_VALIDATE_EMAIL) == false) {
    $arr = ["code" => -15,"msg" => "用户邮箱输入有误"];
    echo(json_encode($arr));
    die();
}
if(empty($addr) || $addr == 'NaN') {
    $arr = ["code" => -15,"msg" => "地址不能为空"];
    echo(json_encode($arr));
    die();
}



$sql = "insert into 
	`tb_addsign`(`sign_name`,`sign_image`,`sign_account`,`sign_password`,`sign_email`,`sign_addr`,`sign_time`,`sign_permissions`,`sign_state`) 
	values('$name','$image','$username','$password','$email','$addr','$add_time','$permissions','$state')";

    
$result = mysqli_query($link,$sql);
$nums = mysqli_affected_rows($link);
    if($nums > 0) {
        $arr = ["code" => 1500,"msg" => "已申请管理员账号"];
        echo(json_encode($arr));
    }else{
        $arr = ["code" => -15,"msg" => "申请失败"];
        echo(json_encode($arr));
    }

}else {
    exit();
}
?>