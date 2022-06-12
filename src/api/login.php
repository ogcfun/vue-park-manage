<?php 
include_once('./db_park.php');

if(isset($_POST['userform'])){
    $userform = $_POST['userform'];

    $username = $userform['username'];
    $password = $userform['password'];

    if(!preg_match("/^\w{6,12}$/",$username)) {
        $arr = ["code" => -6,"msg" => "用户账号只能是数字、26个英文字母或者下划线"];
        echo(json_encode($arr));
        die();
    }
    if(empty($username) || strlen($username) < 6 || strlen($username) > 12) {
        $arr = ["code" => -6,"msg" => "用户账号输入有误"];
        echo(json_encode($arr));
        die();
    }
    if(empty($password) || strlen($password) < 6 || strlen($password) > 18) {
        $arr = ["code" => -6,"msg" => "用户密码输入有误"];
        echo(json_encode($arr));
        die();
    }
    if(!preg_match("/^\w{6,18}$/",$password)) {
        $arr = ["code" => -6,"msg" => "用户密码只能是数字、26个英文字母或者下划线"];
        echo(json_encode($arr));
        die();
    }

    // 匹配用户账号与密码
    $sql = "select * from tb_userlist where user_account ='$username' and user_password ='$password'";
	$query = mysqli_query($link,$sql);
    $res = mysqli_fetch_assoc($query);

    // 查询用户权限
    $sql = "select permissions from tb_userlist WHERE user_account = '$username' ";
    $query = mysqli_query($link,$sql);
    $permissions = mysqli_fetch_assoc($query);
    if(!empty($permissions)){
        $user_permissions = $permissions['permissions'];
    }

    // 查询用户头像
    $sql = "select image from tb_userlist WHERE user_account = '$username' ";
    $query = mysqli_query($link,$sql);
    $image = mysqli_fetch_assoc($query);
    if(!empty($image)){
        $user_image = $image['image'];
    }

    // 查询用户名称
    $sql = "select user_name from tb_userlist WHERE user_account = '$username' ";
    $query = mysqli_query($link,$sql);
    $usernamed = mysqli_fetch_assoc($query);
    if(!empty($usernamed)){
        $usernamed = $usernamed['user_name'];
    }

    // token
    $v = 1;
    $key = mt_rand();
    $hash = hash_hmac("sha1", $v . mt_rand() . time(), $key, true);
    $token = str_replace('=', '', strtr(base64_encode($hash), '+/', '-_'));

    include_once('./menu.php');

	if(!empty($res)) {
        if($user_permissions == "超级管理员" || "站长"){
            $arr = [ 
            "token" => $token,
            "code" => 666,
            "msg" => "登录成功",
            'menu'=>$menu,
            'userimage'=> $user_image,
            'permissions'=>$user_permissions,
            'usernamed'=>$usernamed
        ];  
        }else if($user_permissions == "管理员"){
            $arr = [ 
            "token" => $token,
            "code" => 666,
            "msg" => "登录成功",
            'menu'=>$menuX,
            'userimage'=> $user_image,
            'permissions'=>$user_permissions,
            'usernamed'=>$usernamed
        ]; 
        }
        echo(json_encode($arr));
		die();
	}else{
		$arr = ["code" => -6,"msg" => "账号密码输入有误"];
        echo(json_encode($arr));
		die();
	}
}else{
    exit();
}
