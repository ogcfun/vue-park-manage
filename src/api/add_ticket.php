<?php 
include_once('./db_park.php');

if(isset($_POST['addticket'])){
    $addticket = $_POST['addticket'];
    
    $ticket_name = $addticket['ticket_name'];
    $ticket_year = $addticket['ticket_year'];
    $ticket_ip = $addticket['ticket_ip'];
    $ticket_type = $addticket['ticket_type'];
    $ticket_state = $addticket['ticket_state'];
    $add_time = date('Y-m-d',time());

    $ticket_price = '';
    $ticket_discount = '';
    
     // 查询门票价格
     $sql = "select price from tb_class_ticket WHERE value = '$ticket_type' ";
   $query = mysqli_query($link,$sql);
   $price = mysqli_fetch_assoc($query);
   if(!empty($price)){
       $ticket_price = $price['price'];
   }

   // 查询门票价格
   $sql = "select h_price from tb_class_ticket WHERE value = '$ticket_type' ";
   $query = mysqli_query($link,$sql);
   $discount = mysqli_fetch_assoc($query);
   if(!empty($discount)){
       $ticket_discount = $discount['h_price'];
   }

    if(empty($ticket_name) || strlen($ticket_name) < 2 || strlen($ticket_name) > 18) {
        $arr = ["code" => -8,"msg" => "用户姓名输入有误"];
        echo(json_encode($arr));
        die();
    }
    if(!preg_match("/^[\x{4e00}-\x{9fa5}]{2,18}+$/u",$ticket_name)) {
        $arr = ["code" => -8,"msg" => "姓名只能是中文"];
        echo(json_encode($arr));
        die();
    }
    if(empty($ticket_year) || strlen($ticket_year) < 1 || strlen($ticket_year) > 3) {
        $arr = ["code" => -8,"msg" => "用户年龄输入有误"];
        echo(json_encode($arr));
        die();
    }
    if(empty($ticket_ip) || strlen($ticket_ip) == 12) {
        $arr = ["code" => -8,"msg" => "电话号码输入有误"];
        echo(json_encode($arr));
        die();
    }
    
    $sql = "insert into 
	`tb_ticket`(`ticket_name`,`ticket_year`,`ticket_ip`,`ticket_type`,`ticket_state`,`ticket_date`,`ticket_price`,`ticket_discount`) 
	values('$ticket_name','$ticket_year','$ticket_ip','$ticket_type','$ticket_state','$add_time','$ticket_price','$ticket_discount')";

    $result = mysqli_query($link,$sql);
    $nums = mysqli_affected_rows($link);
    if($nums > 0) {
        $arr = ["code" => 800,"msg" => "新增售票信息成功"];
        echo(json_encode($arr));
    }else{
        $arr = ["code" => -8,"msg" => "新增售票信息失败"];
        echo(json_encode($arr));
    }
}else{
    exit();
}
?>