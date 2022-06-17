<?php 
include_once('./db_park.php');

if(isset($_POST['setticket'])){
    $setticket = $_POST['setticket'];

    $ticket_id = $setticket['ticket_id'];
    $ticket_name = $setticket['ticket_name'];
    $ticket_year = $setticket['ticket_year'];
    $ticket_ip = $setticket['ticket_ip'];
    $ticket_type = $setticket['ticket_type'];
    $ticket_state = $setticket['ticket_state'];

    $ticket_price = '';
    $ticket_discount = '';

    if($ticket_type == '儿童票'){
        $ticket_price = 300;
        $ticket_discount = 50;
    }else if($ticket_type == '成人票'){
        $ticket_price = 480;
        $ticket_discount = 40;
    }else if($ticket_type == '老人票'){
        $ticket_price = 450;
        $ticket_discount = 60;
    }else if($ticket_type == '军人票'){
        $ticket_price = 280;
        $ticket_discount = 30;
    }else if($ticket_type == '团票'){
        $ticket_price = 1200;
        $ticket_discount = 100;
    }else if($ticket_type == '年票'){
        $ticket_price = 2800;
        $ticket_discount = 200;
    }else if($ticket_type == '活动票'){
        $ticket_price = 300;
        $ticket_discount = 100;
    }

    if(empty($ticket_name) || strlen($ticket_name) < 2 || strlen($ticket_name) > 18) {
        $arr = ["code" => -9,"msg" => "用户名称输入有误"];
        echo(json_encode($arr));
        die();
    }
    if(!preg_match("/^[\x{4e00}-\x{9fa5}]{2,18}+$/u",$ticket_name)) {
        $arr = ["code" => -9,"msg" => "用户名称只能是中文"];
        echo(json_encode($arr));
        die();
    }
    if(empty($ticket_year) || strlen($ticket_year) < 1 || strlen($ticket_year) > 3) {
        $arr = ["code" => -9,"msg" => "用户年龄输入有误"];
        echo(json_encode($arr));
        die();
    }
    if(empty($ticket_ip) || strlen($ticket_ip) == 12) {
        $arr = ["code" => -9,"msg" => "电话号码输入有误"];
        echo(json_encode($arr));
        die();
    }

    $sql = "update tb_ticket set ticket_name='$ticket_name',ticket_year='$ticket_year',ticket_ip='$ticket_ip',ticket_type='$ticket_type',ticket_state='$ticket_state',ticket_price='$ticket_price',ticket_discount='$ticket_discount'  where ticket_id='$ticket_id'";
    $result = mysqli_query($link,$sql);
    $nums = mysqli_affected_rows($link);
    if($nums > 0) {
        $arr = ["code" => 900,"msg" => "修改售票信息成功"];
        echo(json_encode($arr));
    }else{
        $arr = ["code" => -9,"msg" => "修改售票信息失败"];
        echo(json_encode($arr));
    }
}else {
    exit();
}
?>