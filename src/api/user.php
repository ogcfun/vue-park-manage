<?php 
include_once('../api/db_park.php');

$queryc = '';
if(isset($_GET['parameter'])){
    $parameter = $_GET['parameter'];
    $queryc = "and user_name like '%$parameter%'";
    if(is_numeric($parameter)){
        $queryc = "and user_name like '%$parameter%' or id = $parameter";
    }
}

$pageSize=8; //每页数量
if (!isset($_GET['page'])) {
    $page = 1; //当前第几页
    $pageu = $page - 1;
} else {
    $page = $_GET['page'];
    $pageu = ($page - 1) * $pageSize;
}

$sort = "order by id ASC";
if(isset($_GET['sortType'])){
    $sortType = $_GET['sortType'];
    if($sortType == 2){
        $sort = "order by id desc";
    }
}

$totalCount = mysqli_num_rows(mysqli_query($link, "select id from tb_userlist where 1=1 $queryc")); //总数据量

$totalPageCount = ceil($totalCount / $pageSize); //总页数

if($page > $totalPageCount){
    $page = $totalPageCount;
    $pageu = ($page - 1) * $pageSize;
}

$sql="select * from tb_userlist where 1=1 $queryc $sort limit $pageu,$pageSize";
$query = mysqli_query($link,$sql);

$tb_userlist = [];
while($row = mysqli_fetch_assoc($query)){
    $tb_userlist[] = $row;
}

$user = [
    'totalCount' => $totalCount,
    'totalPageCount' => $totalPageCount,
    'currentPageNo' => $page,
    'data' => [
        'tb_userlist' => $tb_userlist
    ],
    'code' => 200,
    'msg' => 'user',
];
echo(json_encode($user));