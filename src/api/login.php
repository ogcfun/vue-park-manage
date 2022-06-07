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

    // token
    $v = 1;
    $key = mt_rand();
    $hash = hash_hmac("sha1", $v . mt_rand() . time(), $key, true);
    $token = str_replace('=', '', strtr(base64_encode($hash), '+/', '-_'));


    // 前端传入路由
    $menu = [
            [
            'path' => '/home',
            'name'  => 'home',
            'label' => '首页',
            'icon' => 's-home',
            'url' => 'home/index'
            ],
            [
            'path'=> '/user',
            'name'=> 'user',
            'label'=> '用户管理',
            'icon'=> 'user-solid',
            'url'=> 'user/User' 
            ],
            [
            'path'=> '/sellTickets',
            'name'=> 'sellTickets',
            'label'=> '售票管理',
            'icon'=> 's-order',
            'url'=> 'tickets/SellTickets'
            ],
            [
            'path'=> '/ticketClass',
            'name'=> 'ticketClass',
            'label'=> '票务管理',
            'icon'=> 's-ticket',
            'url'=> 'ticketClass/TicketClass'   
            ],
            [
            'path'=> '/search',
            'name'=> 'search',
            'label'=> '查询',
            'icon'=> 's-promotion',
            'url'=> 'search/Search'
            ],
            [
            'path'=> '/stats',
            'name'=> 'stats',
            'label'=> '统计',
            'icon'=> 's-data',
            'url'=> 'stats/Stats'
            ],
            [
            'label'=> '设置',
            'icon'=> 's-operation',
            'children' => [
                [
                    'path'=> '/setting',
                    'name'=> 'setting',
                    'label'=> '个人设置',
                    'icon'=> 'setting',
                    'url'=> 'set/Setting'
                ],
                [
                    'path'=> '/userSet',
                    'name'=> 'userSet',
                    'label'=> '用户设置',
                    'icon'=> 'setting',
                    'url'=> 'set/UserSet'
                ],
            ]
            ],
    ];

    $menuX = [
        [
        'path' => '/home',
        'name'  => 'home',
        'label' => '首页',
        'icon' => 's-home',
        'url' => 'home/index'
        ],
        [
        'path'=> '/user',
        'name'=> 'user',
        'label'=> '用户管理',
        'icon'=> 'user-solid',
        'url'=> 'user/User' 
        ],
        [
        'path'=> '/sellTickets',
        'name'=> 'sellTickets',
        'label'=> '售票管理',
        'icon'=> 's-order',
        'url'=> 'tickets/SellTickets'
        ],
        [
        'path'=> '/search',
        'name'=> 'search',
        'label'=> '查询',
        'icon'=> 's-promotion',
        'url'=> 'search/Search'
        ],
        [
        'path'=> '/stats',
        'name'=> 'stats',
        'label'=> '统计',
        'icon'=> 's-data',
        'url'=> 'stats/Stats'
        ],
        [
        'label'=> '设置',
        'icon'=> 's-operation',
        'children' => [
            [
                'path'=> '/setting',
                'name'=> 'setting',
                'label'=> '个人设置',
                'icon'=> 'setting',
                'url'=> 'set/Setting'
            ],
        ]
        ],
];



	if(!empty($res)) {
        if($user_permissions == "超级管理员"){
            $arr = [ "token" => $token,"code" => 666,"msg" => "登录成功",'menu'=>$menu,];  
        }else if($user_permissions == "管理员"){
            $arr = [ "token" => $token,"code" => 666,"msg" => "登录成功",'menu'=>$menuX,]; 
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
