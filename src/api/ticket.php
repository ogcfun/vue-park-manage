<?php 
include_once('./db_park.php');

$queryc = '';
if(isset($_GET['parameter'])){
    $parameter = $_GET['parameter'];
    $queryc = "and ticket_name like '%$parameter%'";
    if(is_numeric($parameter)){
        $queryc = "and ticket_name like '%$parameter%' or ticket_id = $parameter";
    }
}

$pageSize=9; //每页数量
if (!isset($_GET['page'])) {
    $page = 1; //当前第几页
    $pageu = $page - 1;
} else {
    $page = $_GET['page'];
    $pageu = ($page - 1) * $pageSize;
}

$sort = "order by ticket_id ASC";
if(isset($_GET['sortType'])){
    $sortType = $_GET['sortType'];
    if($sortType == 2){
        $sort = "order by ticket_id desc";
    }
}

$totalCount = mysqli_num_rows(mysqli_query($link, "select ticket_id from tb_ticket where 1=1 $queryc")); //总数据量

$totalPageCount = ceil($totalCount / $pageSize); //总页数

if($page > $totalPageCount){
    $page = $totalPageCount;
    $pageu = ($page - 1) * $pageSize;
}

$sql="select * from tb_ticket where 1=1 $queryc $sort limit $pageu,$pageSize";


$query = mysqli_query($link,$sql);

$tb_ticket = [];
while($row = mysqli_fetch_assoc($query)){
    $tb_ticket[] = $row;
}

$tb_ticket = [
    'totalCount' => $totalCount,
    'totalPageCount' => $totalPageCount,
    'currentPageNo' => $page,
    'data' => [
        'tb_ticket' => $tb_ticket
    ],
    'code' => 200,
    'msg' => 'user',
];
echo(json_encode($tb_ticket));